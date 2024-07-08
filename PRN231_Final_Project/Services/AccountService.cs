using PRN231_Final_Project.Authentication;
using PRN231_Library.Common;
using PRN231_Library.Request;
using System.Text;
using Newtonsoft.Json;
using PRN231_Final_Project.IServices;
using MudBlazor;

namespace PRN231_Final_Project.Services
{
    public class AccountService : IAccountService
    {
        private readonly HttpClient _httpClient;

        private readonly ISnackbar snackbar;

        public AccountService(HttpClient httpClient, ISnackbar SnackBar)
        {
            _httpClient = httpClient;
            snackbar = SnackBar;
        }

        public async Task<AuthenticationResponse> LoginUserAsync(UserRequest request)
        {

            try
            {
                HttpResponseMessage response = await _httpClient.PostAsJsonAsync("api/Account/Login", request);

                var requestResponse = await response.Content.ReadFromJsonAsync<AuthenticationResponse>();

                if (!requestResponse.IsSuccessful)
                {
                    snackbar.Add(requestResponse.Message, Severity.Error);
                }

                return requestResponse;
            } catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<RequestResponse> RegisterUserAsync(UserRegisterRequest request)
        {

            try
            {
                HttpResponseMessage response = await _httpClient.PostAsJsonAsync("api/Account/Register", request);

                var requestResponse = await response.Content.ReadFromJsonAsync<RequestResponse>();

                if (requestResponse.IsSuccessful)
                {
                    snackbar.Add(requestResponse.Message, Severity.Success);
                } else
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
