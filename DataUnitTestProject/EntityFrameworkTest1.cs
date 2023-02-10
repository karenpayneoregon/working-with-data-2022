using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Runtime.InteropServices;
using System.Text.Json;

using FluentAssertions;
using NFluent;

using System.Threading.Tasks;
using CustomerDatabaseLibrary.Classes;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using EF = CustomerDatabaseLibraryEntityFramework;
using CustomerDatabaseLibraryEntityFramework.Data;
using DataUnitTestProject.Base;
using DataUnitTestProject.Classes;
using EntityCoreExtensions;
using EntityCoreExtensions.Classes;

namespace DataUnitTestProject
{

    [TestClass]
    public partial class EntityFrameworkTest1 : TestBase
    {
        /// <summary>
        /// 
        /// </summary>
        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public void GetGenderListTest()
        {
            // act
            var genders = EF.Classes.DataOperations.GendersList();

            // assert
            Check.That(genders.Count).Equals(4);
        }

        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public void GetContactTypesTest()
        {
            // act
            IReadOnlyList<EF.Models.ContactTypes> contactTypes = 
                EF.Classes.DataOperations.ContactTypesList();

            // assert
            Check.That(contactTypes.Count).Equals(13);
        }

        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void GetAllCustomersWithoutChildTables()
        {
            // act
            List<EF.Models.Customer> customers = EF.Classes.DataOperations.Customers();

            // assert
            customers.Count.Should().BeGreaterOrEqualTo(8);
        }

        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void GetAllCustomersWithChildTables()
        {
            // act
            List<EF.Models.Customer> customers = EF.Classes.DataOperations.CustomersWithIncludes();

            // assert
            customers.FirstOrDefault()!.ContactTypeIdentifierNavigation.Should().NotBeNull();
            customers.FirstOrDefault()!.GenderIdentifierNavigation.Should().NotBeNull();
        }

        [TestMethod]
        [TestTraits(Trait.PlaceHolder)]
        [Ignore]
        public void CustomersToJson()
        {
            List<EF.Models.Customer> customers = EF.Classes.DataOperations.Customers();


            var json = JsonSerializer.Serialize(customers, new JsonSerializerOptions()
            {
                WriteIndented = true
            });

            File.WriteAllText("Customers.json", json);

            DataHelpers.ResetCustomerTable();
        }

        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void CustomerByIdentifierTest()
        {
            // arrange
            int identifier = 2;

            // act
            EF.Models.Customer customer = EF.Classes.DataOperations.CustomerByIdentifier(identifier);

            // assert
            Check.That(customer).IsNotNull();
        }

        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void CustomerByIdentifierBadTest()
        {
            // arrange
            int identifier = 200;

            // act
            EF.Models.Customer customer = EF.Classes.DataOperations.CustomerByIdentifier(identifier);

            // assert
            Check.That(customer).IsNull();
        }

        [TestMethod]
        [TestTraits(Trait.Bogus)]
        public void BogusCustomerCreationTest()
        {
            var customers = BogusOperations.CustomersList();
            Check.That(customers.Count).Equals(10);
        }

        /// <summary>
        /// The customer from bogus when sent to <seealso cref="EF.Classes.DataOperations.AddNewCustomer"/> has no key,
        /// a key is assigned on a successful SaveChanges
        /// </summary>
        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void AddNewCustomerTest()
        {
            // arrange
            var initialRowCount = VerificationOperations.CustomersRecordCount();
            List<EF.Models.Customer> customers = BogusOperationsEf.CustomersList();
            EF.Models.Customer customer = customers.FirstOrDefault();
            // act
            EF.Classes.DataOperations.AddNewCustomer(customer);

            var currentRowCount = VerificationOperations.CustomersRecordCount();
            // assert
            currentRowCount.Should().BeGreaterThan(initialRowCount);

        }


        [TestMethod]
        [TestTraits(Trait.FirstRound)]
        public void AddCustomerRangeTest()
        {
            List<EF.Models.Customer> customers = BogusOperationsEf.CustomersList(2);
            EF.Classes.DataOperations.AddCustomers(customers);

            Assert.IsTrue(customers.All(x => x.Identifier >0));
        }

        [TestMethod]
        [TestTraits(Trait.PlaceHolder)]
        public void RemoveCustomerTest()
        {
            // arrange
            List<EF.Models.Customer> customers = BogusOperationsEf.CustomersList();
            EF.Models.Customer customer = customers.FirstOrDefault();
            EF.Classes.DataOperations.AddNewCustomer(customer);

            // act
            EF.Classes.DataOperations.RemoveCustomer(customer).Should().BeTrue();
        }

        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public void EditCustomerTest()
        {
            // arrange
            List<EF.Models.Customer> customers = BogusOperationsEf.CustomersList();
            EF.Models.Customer customer = customers.FirstOrDefault();
            EF.Classes.DataOperations.AddNewCustomer(customer);

            customer.CompanyName = "Just changed";

            // act
            EF.Classes.DataOperations.EditCustomer(customer).Should().BeTrue();

            // clean-up
            EF.Classes.DataOperations.RemoveCustomer(customer);

        }


        /// <summary>
        /// Given multiple keys, return a record for each, in this case we
        /// expect three records
        /// </summary>
        /// <returns></returns>
        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public async Task WhereInTest()
        {
            string[] expected = { "Fly Girls", "Garrys Coffee", "Salem Boat Rentals" };
            var primaryKeys = new[] { 1,3,4 };
            var customers = await EF.Classes.DataOperations.CustomersWhereInAsync(primaryKeys);

            var customerNames = customers.Select(customer => customer.CompanyName).ToArray();

            customerNames.Should().BeEquivalentTo(expected);

        }
        /// <summary>
        /// Given multiple keys, return a record for each, in this case we
        /// expected two records
        /// </summary>
        /// <returns></returns>
        [TestMethod]
        [TestTraits(Trait.AllRounds)]
        public async Task WhereInTestIncompleteTest()
        {
            string[] expected = { "Fly Girls", "Garrys Coffee", "Salem Boat Rentals" };
            var primaryKeys = new[] { 1, 3, 400 };
            var customers = await EF.Classes.DataOperations.CustomersWhereInAsync(primaryKeys);

            var customerNames = customers.Select(customer => customer.CompanyName).ToArray();

            customerNames.Length.Should().Be(2);
        }


        /// <summary>
        /// Test getting comments from a model where properties are have comment with
        /// [Comment("...")]
        ///
        /// Can break if comment changes
        /// </summary>
        [TestMethod]
        [TestTraits(Trait.DbContextExtensions)]
        public void GetCommentsForCustomerModelTest()
        {
            // arrange
            List<ModelComment> expected = new()
            {
                new() { Name = "Identifier", Comment = "Identifier" },
                new() { Name = "CompanyName", Comment = "Company name" },
                new() { Name = "ContactName", Comment = "Contact full name" },
                new() { Name = "ContactTypeIdentifier", Comment = "Contact type key" },
                new() { Name = "GenderIdentifier", Comment = "Gender key" }
            };

            // act
            using CustomerContext context = new();
            List<ModelComment> comments = context.Comments("Customer").ToList();

            // assert
            comments.Should().BeEquivalentTo(expected);

        }

        [TestMethod]
        [TestTraits(Trait.Navigations)]
        public void CustomerNavigations()
        {
            EF.Classes.DataOperations.GetNavigationDetails();
            
        }

    }

}