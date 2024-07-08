using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PRN231_API.IRepository;
using PRN231_Library.Request;

namespace PRN231_API.Controllers
{
    public class QuizResultController : ApiBaseController
    {
        private readonly IQuizReportRepository _quizzRepository;

        public QuizResultController(IQuizReportRepository QuizzRepository)
        {
            _quizzRepository = QuizzRepository;
        }

        [HttpGet("GetResult/{userId}")]
        [AllowAnonymous]
        public async Task<IActionResult> UserLogin(int userId)
        {
            var data = await this._quizzRepository.GetResult(userId);

            return Ok(data);
        }
    }
}
