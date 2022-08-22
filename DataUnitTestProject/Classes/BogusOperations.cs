using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bogus;
using CustomerDatabaseLibrary.Models;
using static CustomerDatabaseLibrary.Classes.DataOperations;

namespace DataUnitTestProject.Classes
{
    public class BogusOperations
    {
        public static List<Customer> CustomersList(int count = 10)
        {

            var contactTypesIdentifiers = 
                ContactTypesList()
                    .Select(ct => ct.Identifier)
                    .ToList();

            var genderIdentifiers =
                GendersList()
                    .Select(g => g.id)
                    .ToList();

            var fake = new Faker<Customer>()
                    .RuleFor(c => c.CompanyName, f => 
                        f.Company.CompanyName())
                    .RuleFor(c => c.ContactName, f => 
                        f.Person.FullName)
                    .RuleFor(c => c.GenderIdentifier, f => 
                        f.PickRandom(genderIdentifiers))
                    .RuleFor(c => c.ContactTypeIdentifier, f => 
                        f.PickRandom(contactTypesIdentifiers));

            return fake.Generate(count);

        }

        public static List<Customer> CustomersWithIdentifiersList(int count = 1)
        {
            int identifier = 1;

            var contactTypesIdentifiers =
                ContactTypesList()
                    .Select(ct => ct.Identifier)
                    .ToList();

            var genderIdentifiers =
                GendersList()
                    .Select(g => g.id)
                    .ToList();

            var fake = new Faker<Customer>()
                .CustomInstantiator(f => new Customer(identifier++))
                .RuleFor(c => c.CompanyName, f =>
                    f.Company.CompanyName())
                .RuleFor(c => c.ContactName, f =>
                    f.Person.FullName)
                .RuleFor(c => c.GenderIdentifier, f =>
                    f.PickRandom(genderIdentifiers))
                .RuleFor(c => c.ContactTypeIdentifier, f =>
                    f.PickRandom(contactTypesIdentifiers));

            return fake.Generate(count);

        }
    }
}
