using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PRN231_API.IRepository;
using PRN231_Library.Request;

namespace PRN231_API.Controllers
{
    public class QuestionController : ApiBaseController
    {
        private readonly IQuestionRepository _questionRepository;

        public QuestionController(IQuestionRepository questionRepository)
        {
            _questionRepository = questionRepository;
        }

        [HttpGet("GetAll/{typeId}")]
        public async Task<IActionResult> GetAll(int typeId)
        {
            var data = await this._questionRepository.GetAll(typeId);

            return Ok(data);
        }

        [HttpGet("GetTest/{typeId}")]
        public async Task<IActionResult> GetTest(int typeId)
        {
            var data = await this._questionRepository.GetTest(typeId);

            return Ok(data);
        }
    }
}
