using System.Collections.Generic;
using System.Linq;
using Bogus;
using CustomerDatabaseLibraryEntityFramework.Classes;
using CustomerDatabaseLibraryEntityFramework.Models;

namespace DataUnitTestProject.Classes
{
    public class BogusOperationsEf
    {
        public static List<Customer> CustomersList(int count = 10)
        {

            var contactTypesIdentifiers =
                DataOperations.ContactTypesList(false)
                    .Select(ct => ct.Identifier)
                    .ToList();

            var genderIdentifiers =
                DataOperations.GendersList(false)
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
                DataOperations.ContactTypesList()
                    .Select(ct => ct.Identifier)
                    .ToList();

            var genderIdentifiers =
                DataOperations.GendersList()
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
