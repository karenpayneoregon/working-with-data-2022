#nullable disable

using System.ComponentModel.DataAnnotations;

namespace IndexingSamplerApp.Models;


public partial class Person
{
    public int Id { get; set; }
    [Display(Name = "First")]
    public string FirstName { get; set; }
    [Display(Name = "Last")]
    public string LastName { get; set; }
    [Display(Name = "Email")]
    public string EmailAddress { get; set; }
    [Display(Name = "Pass")]
    public string SitePassword { get; set; }
    public override string ToString() => $"{FirstName} {LastName}";

}