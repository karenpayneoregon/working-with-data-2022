﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace EntityFrameworkCore6App.Models;

public partial class ContactTypes
{
    public ContactTypes()
    {
        Customer = new HashSet<Customer>();
    }

    public int Identifier { get; set; }
    public string ContactType { get; set; }

    public virtual ICollection<Customer> Customer { get; set; }
}