import Foundation

final class SignInRepository: SignInRepositoryProtocol {

    let localData: SignInLocalDataProtocol
    let remoteData: SignInRemoteDataProtocol

    required init(
        localData: SignInLocalDataProtocol = SignInLocalData(),
        remoteData: SignInRemoteDataProtocol = SignInRemoteData()
    ) {
        self.localData = localData
        self.remoteData = remoteData
    }

    func signIn(email: String, password: String) async throws -> String {
        let clientId = localData.getClientId()
        let environment = localData.getEnvironment()
        let input = SignInInput(
            email: email,
            password: password,
            clientId: clientId,
            grantType: "password",
            environment: environment
        )

        let tokenResponse = try await remoteData.signIn(with: input)
        let tokenData = map(response: tokenResponse)
        localData.saveTokens(data: tokenData)
        return tokenData.accessToken
    }

    // MARK: - Private API

    private func map(response: TokenResponse) -> TokenData {
        let expirationDate = Date().addingTimeInterval(TimeInterval(response.expiresIn))
        let refreshExpirationsDate = Date().addingTimeInterval(TimeInterval(response.refreshExpiresIn))
        return TokenData(accessToken: response.accessToken,
                              expiresIn: response.expiresIn,
                              refreshExpiresIn: response.refreshExpiresIn,
                              refreshToken: response.refreshToken,
                              tokenType: response.tokenType,
                              idToken: response.idToken,
                              notBeforePolicy: response.notBeforePolicy,
                              sessionState: response.sessionState,
                              scope: response.scope,
                              expirationDate: expirationDate,
                              refreshExpirationDate: refreshExpirationsDate)
    }
}
