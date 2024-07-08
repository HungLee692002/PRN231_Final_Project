using Azure.Core;
using MudBlazor;
using PRN231_Final_Project.IServices;
using PRN231_Library.Common;
using PRN231_Library.Response;

namespace PRN231_Final_Project.Services
{
    public class QuizReportService : IQuizReportService
    {
        private readonly HttpClient _httpClient;

        private readonly ISnackbar snackbar;

        public QuizReportService(HttpClient httpClient, ISnackbar SnackBar)
        {
            _httpClient = httpClient;
            snackbar = SnackBar;
        }

        public async Task<ResultResponse<TestResultResponse>> GetResult(int userId)
        {
            try
            {
                HttpResponseMessage response = await _httpClient.GetAsync($"api/QuizReport/GetResult/{userId}");

                var requestResponse = await response.Content.ReadFromJsonAsync<ResultResponse<TestResultResponse>>();

                if (!requestResponse.IsSuccessful)
                {
                    snackbar.Add(requestResponse.Message, Severity.Error);
                }

                return requestResponse;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<ResultResponse<ResultDetailResponse>> GetDetail(int quizId)
        {
            try
            {
                HttpResponseMessage response = await _httpClient.GetAsync($"api/QuizReport/GetResult/{quizId}");

                var requestResponse = await response.Content.ReadFromJsonAsync<ResultResponse<ResultDetailResponse>>();

                if (!requestResponse.IsSuccessful)
                {
                    snackbar.Add(requestResponse.Message, Severity.Error);
                }

                return requestResponse;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
