﻿using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


// ReSharper disable once CheckNamespace - do not change
namespace DataUnitTestProject
{
    public partial class DataProviderTest1
    {

        [TestInitialize]
        public void Init()
        {
 
        }

        /// <summary>
        /// Perform any initialize for the class
        /// </summary>
        /// <param name="testContext"></param>
        [ClassInitialize()]
        public static void MyClassInitialize(TestContext testContext)
        {
            TestResults = new List<TestContext>();
        }

    }

}
