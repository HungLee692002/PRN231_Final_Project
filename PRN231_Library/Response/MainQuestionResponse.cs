using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRN231_Library.Response
{
    public class MainQuestionResponse
    {
        public int? MainId { get; set; }

        public string? MainContent { get; set; }

        public string? Image { get; set; }

        public int? SubId { get; set; }

        public string? SubContent { get; set; }

        public bool? IsCorrect { get; set; }
    }
}
