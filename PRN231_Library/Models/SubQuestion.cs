using System;
using System.Collections.Generic;

namespace PRN231_Library.Models;

public partial class SubQuestion
{
    public int SubId { get; set; }

    public int MainId { get; set; }

    public string? SubContent { get; set; }

    public bool? IsAnswer { get; set; }

    public DateTime? CreateDt { get; set; }

    public DateTime? UpdateDt { get; set; }

    public virtual MainQuestion Main { get; set; } = null!;

    public virtual ICollection<QuestionAnswer> QuestionAnswers { get; set; } = new List<QuestionAnswer>();
}
