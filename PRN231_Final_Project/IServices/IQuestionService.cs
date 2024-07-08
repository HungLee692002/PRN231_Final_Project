using PRN231_Library.Common;
using PRN231_Library.Response;

namespace PRN231_Final_Project.IServices
{
    public interface IQuestionService
    {
        Task<ResultResponse<QuestionResponse>> GetAllQuestion(int typeId);

        Task<ResultResponse<TestResponse>> GetTestQuestion(int typeId);
    }
}
