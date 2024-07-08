using System;
using System.Collections.Generic;

namespace PRN231_Library.Models;

public partial class QuestionAnswer
{
    public int Id { get; set; }

    public int? QuizzId { get; set; }

    public int MainId { get; set; }

    public int SubId { get; set; }

    public DateTime? CreateDt { get; set; }

    public DateTime? UpdateDt { get; set; }

    public virtual MainQuestion Main { get; set; } = null!;

    public virtual QuizzReport? Quizz { get; set; }

    public virtual SubQuestion Sub { get; set; } = null!;
}
