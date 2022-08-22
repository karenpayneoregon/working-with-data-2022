using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentAssertions;
using JustMockTestProject.Base;
using Telerik.JustMock;

namespace JustMockTestProject
{

    [TestClass]
    public partial class JustMockTest : TestBase
    {
        [TestMethod]
        [Ignore]
        public void MockNowTest()
        {
            DateTime birthDate = new(1945, 8, 12);
            DateTime expected = new(1945, 8, 12, 0, 0, 0, 0);
            Mock.Arrange(() => DateTime.Now).Returns(birthDate);

            birthDate.Should().Be(expected);

        }
    }
}
