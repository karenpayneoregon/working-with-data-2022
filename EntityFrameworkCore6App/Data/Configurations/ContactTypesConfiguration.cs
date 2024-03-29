﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using EntityFrameworkCore6App.Data;
using EntityFrameworkCore6App.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;

namespace EntityFrameworkCore6App.Data.Configurations
{
    public partial class ContactTypesConfiguration : IEntityTypeConfiguration<ContactTypes>
    {
        public void Configure(EntityTypeBuilder<ContactTypes> entity)
        {
            entity.HasKey(e => e.Identifier);

            entity.Property(e => e.ContactType).HasMaxLength(50);

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<ContactTypes> entity);
    }
}
