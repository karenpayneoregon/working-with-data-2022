﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace EntityFrameworkCore6App.Models;

public partial class Customer
{
    public int Identifier { get; set; }
    public string CompanyName { get; set; }
    public string ContactFirstName { get; set; }
    public string ContactLastName { get; set; }
    public int? ContactTypeIdentifier { get; set; }
    public int? GenderIdentifier { get; set; }

    public virtual ContactTypes ContactTypeIdentifierNavigation { get; set; }
    public virtual Genders GenderIdentifierNavigation { get; set; }
}