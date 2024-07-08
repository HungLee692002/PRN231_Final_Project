using PRN231_Library.Common;
using PRN231_Library.Request;

namespace PRN231_API.IRepository
{
    public interface IAccountRepository
    {
        Task<AuthenticationResponse> UserLogin(UserRequest request);

        Task<RequestResponse> UserRegister(UserRegisterRequest request);
    }
}
