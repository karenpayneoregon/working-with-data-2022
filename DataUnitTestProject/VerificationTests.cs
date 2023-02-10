using System.Threading.Tasks;
using DataUnitTestProject.Base;
using DataUnitTestProject.Classes;
using FluentAssertions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DataUnitTestProject
{
    /// <summary>
    /// 
    /// </summary>
    [TestClass]
    public partial class VerificationTests : TestBase
    {
        [TestMethod]
        [TestTraits(Trait.Verifications)]
        public void GetLastCustomerIdentifier()
        {
            var identifier = VerificationOperations.LastCustomerIdentifier();
            identifier.Should().BeGreaterOrEqualTo(8);
        }

        [TestMethod]
        [TestTraits(Trait.Verifications)]
        public void TablesHaveRecords()
        {
            VerificationOperations.TablesArePopulated().Should().BeTrue();
        }

        [TestMethod]
        [TestTraits(Trait.Verifications)]
        public async Task DatabaseExistUsingEntityFrameworkTest()
        {
            var result = await VerificationOperations.DatabaseExistsAsync();
            result.Should().BeTrue();
        }



    }

}