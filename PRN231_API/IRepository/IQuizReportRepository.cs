using PRN231_Library.Common;
using PRN231_Library.Request;
using PRN231_Library.Response;

namespace PRN231_API.IRepository
{
    public interface IQuizReportRepository
    {
        Task<ResultResponse<TestResultResponse>> GetResult(int userId);
        Task<ResultResponse<ResultDetailResponse>> GetDetail(int QuizId);
    }
}
