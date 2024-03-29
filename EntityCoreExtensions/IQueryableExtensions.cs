﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace EntityCoreExtensions
{
    /// <summary>
    /// Extension method for EF Core, written with EF Core 5 tested
    /// with SQL-Server and Oracle.
    /// </summary>
    /// <remarks>
    /// When moving to a newer version of EF Core make sure to check for
    /// breaking changes that may affect these methods.
    /// </remarks>
    public static class IQueryableExtensions
    {
        /// <summary>
        /// Use the extension method to implement the Between operation in Entity Framework for client side evaluation
        /// </summary>
        /// <typeparam name="TSource">Type of the entity</typeparam>
        /// <typeparam name="TKey">Type of the return value</typeparam>
        /// <param name="source">The entity used to apply the method</param>
        /// <param name="keySelector">The lambda expression used to get the return value</param>
        /// <param name="low">Low boundary of the return value</param>
        /// <param name="high">High boundary of the return value</param>
        /// <returns>return the IQueryable</returns>
        public static IQueryable<TSource> Between<TSource, TKey>(this IQueryable<TSource> source, Expression<Func<TSource, TKey>> keySelector, TKey low, TKey high) where TKey : IComparable<TKey>
        {
            // Get a ParameterExpression node of the TSource that is used in the expression tree
            //ParameterExpression sourceParameter = Expression.Parameter(typeof(TSource));

            // Get the body and parameter of the lambda expression
            Expression body = keySelector.Body;
            ParameterExpression parameter = null;

            if (keySelector.Parameters.Count > 0)
            {
                parameter = keySelector.Parameters[0];
            }

            // Get the Compare method of the type of the return value
            MethodInfo compareMethod = typeof(TKey).GetMethod("CompareTo", new[] { typeof(TKey) });

            // Expression.LessThanOrEqual and Expression.GreaterThanOrEqual method are only used in
            // the numeric comparision. If we want to compare the non-numeric type, we can't directly 
            // use the two methods. 
            //
            // So first use the Compare method to compare the objects, and the Compare method 
            // will return a int number. Then we can use the LessThanOrEqual and GreaterThanOrEqual method.
            // For this reason, we ask all the TKey type implement the IComparable<> interface.
            Expression upper = Expression.LessThanOrEqual(Expression.Call(body, compareMethod!, Expression.Constant(high)), Expression.Constant(0, typeof(int)));
            Expression lower = Expression.GreaterThanOrEqual(Expression.Call(body, compareMethod, Expression.Constant(low)), Expression.Constant(0, typeof(int)));

            Expression andExpression = Expression.And(upper, lower);

            // Get the Where method expression.
            MethodCallExpression whereCallExpression = Expression.Call(
                typeof(Queryable),
                "Where",
                new[] { source.ElementType },
                source.Expression,
                Expression.Lambda<Func<TSource, bool>>(andExpression, parameter!));

            return source.Provider.CreateQuery<TSource>(whereCallExpression);
        }

        /// <summary>
        /// Provides a compact method to perform a where in
        /// </summary>
        /// <typeparam name="TSource">model</typeparam>
        /// <param name="entities">model data</param>
        /// <param name="propertySelector">property in model</param>
        /// <param name="ids">values for property</param>
        /// <returns>records if there are matches</returns>
        public static IQueryable<TSource> WithIdentifiers<TSource>(this IQueryable<TSource> entities, Expression<Func<TSource, int>> propertySelector, ICollection<int> ids)
        {

            PropertyInfo property = (PropertyInfo)((MemberExpression)propertySelector.Body).Member;

            ParameterExpression parameter = Expression.Parameter(typeof(TSource));

            var expression = Expression.Lambda<Func<TSource, bool>>(
                Expression.Call(
                    Expression.Constant(ids),
                    typeof(ICollection<int>).GetMethod("Contains")!,
                    Expression.Property(parameter, property)),
                parameter);

            return entities.Where(expression);
        }
        public static IQueryable<T> WithIdentifiers<T>(this IQueryable<T> entities, Expression<Func<T, int?>> propertySelector, ICollection<int?> ids)
        {
            var property = (PropertyInfo)((MemberExpression)propertySelector.Body).Member;

            ParameterExpression parameter = Expression.Parameter(typeof(T));

            var expression = Expression.Lambda<Func<T, bool>>(
                Expression.Call(
                    Expression.Constant(ids),
                    typeof(ICollection<int?>).GetMethod("Contains")!,
                    Expression.Property(parameter, property)),
                parameter);

            return entities.Where(expression);
        }
    }

}

