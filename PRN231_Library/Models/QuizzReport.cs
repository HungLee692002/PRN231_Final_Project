using System;
using System.Collections.Generic;

namespace PRN231_Library.Models;

public partial class QuizzReport
{
    public int QuizzId { get; set; }

    public int? UserId { get; set; }

    public int? Mark { get; set; }

    public int? Time { get; set; }

    public int? TypeId { get; set; }

    public DateTime? CreateDt { get; set; }

    public virtual ICollection<QuestionAnswer> QuestionAnswers { get; set; } = new List<QuestionAnswer>();

    public virtual Account? User { get; set; }

    public virtual QuestionType? Type { get; set; }
}
