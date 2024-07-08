using PRN231_Library.Common;
using PRN231_Library.Request;

namespace PRN231_Final_Project.IServices
{
    public interface IAccountService
    {
        Task<AuthenticationResponse> LoginUserAsync(UserRequest request);

        Task<RequestResponse> RegisterUserAsync(UserRegisterRequest request);
    }
}
