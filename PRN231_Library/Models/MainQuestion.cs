using System;
using System.Collections.Generic;

namespace PRN231_Library.Models;

public partial class MainQuestion
{
    public int MainId { get; set; }

    public string? MainContent { get; set; }

    public bool? IsRequired { get; set; }

    public int? TypeId { get; set; }

    public string? Images { get; set; }

    public DateTime? CreateDt { get; set; }

    public DateTime? UpdateDt { get; set; }

    public virtual ICollection<QuestionAnswer> QuestionAnswers { get; set; } = new List<QuestionAnswer>();

    public virtual ICollection<SubQuestion> SubQuestions { get; set; } = new List<SubQuestion>();

    public virtual QuestionType? Type { get; set; }
}
