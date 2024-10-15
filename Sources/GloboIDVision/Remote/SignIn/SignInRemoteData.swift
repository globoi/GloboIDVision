import Foundation

final class SignInRemoteData: SignInRemoteDataProtocol {

    let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func signIn(with input: SignInInput) async throws -> TokenResponse {
        let request = SignInRequestBuilder(
            email: input.email,
            password: input.password,
            clientId: input.clientId,
            grantType: input.grantType,
            environment: input.environment
        ).build()

        let responseData = try await urlSession.data(for: request).0
        let tokenData = try JSONDecoder().decode(TokenResponse.self, from: responseData)
        return tokenData
    }
}
