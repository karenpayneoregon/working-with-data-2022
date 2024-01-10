using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CustomerDatabaseLibrary.Classes;
using CustomerDatabaseLibrary.Models;
using DataUnitTestProject.Base;
using DataUnitTestProject.Classes;
using FluentAssertions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NFluent;

namespace DataUnitTestProject
{
    [TestClass]
    public partial class DataProviderTest1 : TestBase
    {
        /// <summary>
        /// There are three genders, one select
        /// </summary>
        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public void GetGenderListTest()
        {
            var genders = DataOperations.GendersList();
            Check.That(genders.Count).Equals(3);

        }
            
        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public void GetContactTypesTest()
        {
            var contactTypes = DataOperations.ContactTypesList();

            Check.That(contactTypes.Count).Equals(12);
        }

        [TestMethod]
        [TestTraits(Trait.Dapper)]
        public void DapperContactListTest()
        {
            var contactTypes = DataOperations.ContactTypesListDapper(1, 7);
            var names = contactTypes.Select(ct => ct.ContactType).ToArray();
            Check.That(names).IsOnlyMadeOf("Account Manager", "Owner");
        }

        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void GetAllCustomers()
        {
            var customers = DataOperations.Customers();
            customers.Count.Should().BeGreaterOrEqualTo(8);
        }

        [TestMethod]
        [TestTraits(Trait.Bogus)]
        public void BogusCustomerCreationTest()
        {
            var customers = BogusOperations.CustomersList();
            Check.That(customers.Count).Equals(10);
        }
        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void CustomerByIdentifierTest()
        {
            const int identifier = 2;
            Customer customer = DataOperations.CustomerByIdentifier(identifier);
            Check.That(customer).IsNotNull();
        }

        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void CustomerByIdentifierBadTest()
        {
            int identifier = 200;
            Customer customer = DataOperations.CustomerByIdentifier(identifier);
            Check.That(customer).IsNull();
        }

        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void AddNewCustomerTest()
        {
            // arrange
            var identifier = VerificationOperations.LastCustomerIdentifier();
            Customer customer = BogusOperations.CustomersList(1).FirstOrDefault();

            // act
            DataOperations.AddCustomer(customer);
            
            // assert
            customer.Identifier.Should().BeGreaterThan(identifier);

        }

        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public void EditCustomerTest()
        {
            var customer = BogusOperations.CustomersList(1).FirstOrDefault();
            DataOperations.AddCustomer(customer);
            customer.CompanyName = "Just changed with provider";
            DataOperations.EditCustomer(customer).Should().Be(1);
            DataOperations.RemoveCustomer(customer);
        }

        /// <summary>
        /// Remove an existing customer
        /// </summary>
        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public void RemoveCustomerTest()
        {
            var identifier = VerificationOperations.LastCustomerIdentifier();
            Customer customer = BogusOperations.CustomersList(1).FirstOrDefault();
            DataOperations.AddCustomer(customer);

            // act
            var (success, _) = DataOperations.RemoveCustomer(customer);
            success.Should().BeTrue();
        }


        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void AddCustomerRangeTest()
        {
            /*
             * See DataHelpers.ResetCustomerTable
             */
        }


        /// <summary>
        /// Non-operational for article purposes only
        /// Because we are extracting values from command parameters
        /// which normally are not exposed
        /// </summary>
        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public void WhereInTest()
        {
            string value = "";

            int.TryParse(value, out var x);

            var decodedStatement = 
                DataOperations.GetCustomersNamesBack(new List<int>() {1,3,4});

            decodedStatement.Should()
                .Be("SELECT CompanyName FROM dbo.Customer WHERE Identifier IN (1,3,4)");
        }

        /// <summary>
        /// Get multiple customers by primary keys where the SQL uses a WHERE IN which
        /// is created dynamically from SqlCoreUtilityLibrary.Classes.SqlWhereInParamBuilder
        /// </summary>
        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public async Task WhereInTestAsync()
        {
            var primaryKeys = new[] { 1, 3, 4 };
            var customers = await DataOperations.CustomersWhereInAsync(primaryKeys);

            customers.Count.Should().Be(3);
        }


    }
}
