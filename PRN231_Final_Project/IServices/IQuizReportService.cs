using PRN231_Library.Common;
using PRN231_Library.Request;
using PRN231_Library.Response;

namespace PRN231_Final_Project.IServices
{
    public interface IQuizReportService
    {
        Task<ResultResponse<TestResultResponse>> GetResult(int userId);

    }
}
