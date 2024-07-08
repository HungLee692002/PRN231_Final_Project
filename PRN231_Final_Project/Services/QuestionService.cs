using MudBlazor;
using PRN231_Final_Project.IServices;
using PRN231_Library.Common;
using PRN231_Library.Response;
using System.Net.Http;

namespace PRN231_Final_Project.Services
{
    public class QuestionService : IQuestionService
    {
        private readonly HttpClient _httpClient;

        private readonly ISnackbar snackbar;

        public QuestionService(HttpClient httpClient, ISnackbar SnackBar)
        {
            _httpClient = httpClient;
            snackbar = SnackBar;
        }
        public async Task<ResultResponse<QuestionResponse>> GetAllQuestion(int typeId)
        {
            try
            {
                if(Constants.JWTToken == "")
                {
                    return null;
                }
                _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Constants.JWTToken);

                HttpResponseMessage response = await _httpClient.GetAsync($"api/Question/GetAll/{typeId}");

                var requestResponse = await response.Content.ReadFromJsonAsync<ResultResponse<QuestionResponse>>();

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

        public async Task<ResultResponse<TestResponse>> GetTestQuestion(int typeId)
        {
            try
            {
                if (Constants.JWTToken == "")
                {
                    return null;
                }
                _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Constants.JWTToken);

                HttpResponseMessage response = await _httpClient.GetAsync($"api/Question/GetTest/{typeId}");

                var requestResponse = await response.Content.ReadFromJsonAsync<ResultResponse<TestResponse>>();

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
