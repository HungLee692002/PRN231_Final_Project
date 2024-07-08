using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.VisualBasic;
using PRN231_Library.Common;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Xml.Serialization;

namespace PRN231_Final_Project.Authentication
{
    public class CustomAuthenticationStateProvider : AuthenticationStateProvider
    {
        private readonly ClaimsPrincipal anonymous = new ClaimsPrincipal(new ClaimsIdentity());

        public async override Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            try
            {
                if (string.IsNullOrEmpty(PRN231_Library.Common.Constants.JWTToken))
                {
                    return await Task.FromResult(new AuthenticationState(anonymous));
                }

                var getUserClaims = DecryptToken(PRN231_Library.Common.Constants.JWTToken);
                if (getUserClaims == null)
                {

                    return await Task.FromResult(new AuthenticationState(anonymous));
                }

                var claimsPrincipal = SetClaimsPrincipal(getUserClaims);

                return await Task.FromResult(new AuthenticationState(claimsPrincipal));
            }
            catch
            {
                return await Task.FromResult(new AuthenticationState(anonymous));
            }
        }

        public void NotifyUserAuthentication(ClaimsPrincipal user)
        {
            var authState = Task.FromResult(new AuthenticationState(user));
            NotifyAuthenticationStateChanged(authState);
        }

        public void NotifyUserLogout()
        {
            var authState = Task.FromResult(new AuthenticationState(new ClaimsPrincipal(new ClaimsIdentity())));
            NotifyAuthenticationStateChanged(authState);
        }

        public static ClaimsPrincipal SetClaimsPrincipal(AccountClaims claims)
        {
            if (string.IsNullOrEmpty(claims.Email))
            {
                return new ClaimsPrincipal();
            }

            return new ClaimsPrincipal(new ClaimsIdentity(
                new List<Claim>
                {
                    new(ClaimTypes.Email, claims.Email),
                    new(ClaimTypes.Name, claims.FirstName!),
                    new(ClaimTypes.NameIdentifier, claims.Id.ToString()!),
                }, "JwtAuth"));
        }

        private static AccountClaims DecryptToken(string jwtToken)
        {
            if (string.IsNullOrEmpty(jwtToken))
            {
                return new AccountClaims();
            }

            var handler = new JwtSecurityTokenHandler();
            var token = handler.ReadJwtToken(jwtToken);

            AccountClaims data = new AccountClaims();

            data.Email = token.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Email)!.Value;
            data.FirstName = token.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Name)!.Value;
            data.Id = int.Parse(token.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier)!.Value);

            return data;
        }

        public async Task UpdateAuthenticationState(string jwtToken)
        {
            var claimsPrincipal = new ClaimsPrincipal();
            if (!string.IsNullOrEmpty(jwtToken))
            {
                PRN231_Library.Common.Constants.JWTToken = jwtToken;
                var getUserClaims = DecryptToken(jwtToken);
                claimsPrincipal = SetClaimsPrincipal(getUserClaims);
            }
            else
            {
                PRN231_Library.Common.Constants.JWTToken = string.Empty;
            }
            NotifyUserAuthentication(claimsPrincipal);
        }

        public async Task<bool> IsUserAuthenticated()
        {
            var authState = await GetAuthenticationStateAsync();
            return authState.User.Identity != null && authState.User.Identity.IsAuthenticated;
        }
    }
}
