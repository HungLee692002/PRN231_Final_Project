using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRN231_Library.Response
{
    public class ResultDetailResponse
    {
        public int? Mark {  get; set; }  
        public int? QuizzId { get; set; }
        public int? Time { get; set; }

        public DateTime? CreateDt { get;set; }

        public List<MainQuestionResponse> Questions { get; set; }
    }
}
