using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRN231_Library.Request
{
    public class QuestionRequest
    {
        public int? MainId { get; set; }
        public int? SubId { get; set; }
        public bool? IsCorrect { get; set; }
    }
}
