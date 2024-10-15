protocol SignInLocalDataProtocol {

    var userDefaults: UserDefaultsManager { get }

    func getEnvironment() -> Environment
    func getClientId() -> String
    func saveTokens(data: TokenData)
}
