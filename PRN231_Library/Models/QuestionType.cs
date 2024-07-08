using System;
using System.Collections.Generic;

namespace PRN231_Library.Models;

public partial class QuestionType
{
    public int TypeId { get; set; }

    public string? TypeName { get; set; }

    public TimeOnly? TimeLimit { get; set; }

    public DateTime? CreateDt { get; set; }

    public DateTime? UpdateDt { get; set; }

    public virtual ICollection<MainQuestion> MainQuestions { get; set; } = new List<MainQuestion>();
    public virtual ICollection<QuizzReport> QuizzReports { get; set; } = new List<QuizzReport>();
}
