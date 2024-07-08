using PRN231_Library.Common;
using PRN231_Library.Response;

namespace PRN231_API.IRepository
{
    public interface IQuestionRepository
    {
        Task<ResultResponse<QuestionResponse>> GetAll(int typeId);

        Task<ResultResponse<TestResponse>> GetTest(int typeId);
    }
}
