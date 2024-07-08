using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRN231_Library.Response
{
    public class TestResponse
    {
        public int? MainId {  get; set; }

        public string? MainContent { get; set; }

        public string? Image { get; set; }

        public bool? IsRequired { get; set; }

        public int? SelectedSubId { get; set; }

        public List<SubQuestionResponse> SubQuestions { get; set; }
    }
}
