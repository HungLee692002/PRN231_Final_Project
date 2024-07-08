using PRN231_Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRN231_Library.Response
{
    public class TestResultResponse
    {
        public int? MarkA1 { get;set; }

        public int? MarkB1 { get;set;}

        public List<QuizzReport> quizzReports { get; set; }
    }
}
