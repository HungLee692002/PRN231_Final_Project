using System;
using System.Collections.Generic;

namespace PRN231_Library.Models;

public partial class Account
{
    public int UserId { get; set; }

    public string? Email { get; set; }

    public string? Password { get; set; }

    public DateTime? Dob { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public DateTime? CreateDt { get; set; }

    public DateTime? UpdateDt { get; set; }

    public int? RoleId { get; set; }

    public virtual ICollection<QuizzReport> QuizzReports { get; set; } = new List<QuizzReport>();

    public virtual Role? Role { get; set; }
}
