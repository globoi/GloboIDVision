import Foundation

final class SignInLocalData: SignInLocalDataProtocol {

    var userDefaults: UserDefaultsManager

    init(userDefaults: UserDefaultsManager = UserDefaultsManager.shared) {
        self.userDefaults = userDefaults
    }

    func getEnvironment() -> Environment {
        Environment(rawValue: userDefaults.environment ?? "") ?? .production
    }

    func getClientId() -> String {
        userDefaults.clientID ?? ""
    }

    func saveTokens(data: TokenData) {
        userDefaults.accessToken = data.accessToken

    }
}
