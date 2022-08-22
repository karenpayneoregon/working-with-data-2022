using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using DataUnitTestProject.Base;
using DataUnitTestProject.Classes;
using FluentAssertions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NFluent;

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