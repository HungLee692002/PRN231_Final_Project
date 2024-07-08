using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRN231_Library.Response
{
    public class SubQuestionResponse
    {
        public int? SubsId { get; set; }

        public string? SubContent { get; set; }

        public bool? IsCorrect { get; set; }
    }
}
