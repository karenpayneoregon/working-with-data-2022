﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using EntityFrameworkCore6App.Data.Configurations;
using EntityFrameworkCore6App.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using System;
using System.Collections.Generic;
using ConfigurationLibrary.Classes;
#nullable disable

namespace EntityFrameworkCore6App.Data;

public partial class Context : DbContext
{
    public Context()
    {
    }

    public Context(DbContextOptions<Context> options)
        : base(options)
    {
    }

    public virtual DbSet<ContactTypes> ContactTypes { get; set; }
    public virtual DbSet<Customer> Customer { get; set; }
    public virtual DbSet<Genders> Genders { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            // added by Karen
            optionsBuilder.UseSqlServer(ConfigurationHelper.ConnectionString());
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfiguration(new Configurations.ContactTypesConfiguration());
        modelBuilder.ApplyConfiguration(new Configurations.CustomerConfiguration());

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}