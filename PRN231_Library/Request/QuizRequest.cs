using PRN231_Library.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRN231_Library.Request
{
    public class QuizRequest
    {
        public int? Mark { get; set; }
        public int? Time { get; set; }
        public int? UserId { get; set; }
        public int? TypeId {  get; set; }
        public DateTime? CreateDt { get; set; }
        public List<QuestionRequest> Questions { get; set; }

    }
}
