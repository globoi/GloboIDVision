import Foundation

final class UserDefaultsManager {

    nonisolated(unsafe) static let shared = UserDefaultsManager()
    private let store: UserDefaults

    var clientID: String? {
        get { store.string(forKey: Keys.clientID) }
        set { store.set(newValue, forKey: Keys.clientID) }
    }

    var redirectURL: String? {
        get { store.string(forKey: Keys.redirectURL) }
        set { store.set(newValue, forKey: Keys.redirectURL) }
    }

    var environment: String? {
        get { store.string(forKey: Keys.environment) }
        set { store.set(newValue, forKey: Keys.environment) }
    }

    var accessToken: String? {
        get { store.string(forKey: Keys.accessToken) }
        set { store.set(newValue, forKey: Keys.accessToken) }
    }

    private init() {
        self.store = UserDefaults.standard
    }
}

// MARK: - Keys
extension UserDefaultsManager {

    private enum Keys {
        static let clientID = "clientId"
        static let redirectURL = "redirectURL"
        static let environment = "environment"
        static let accessToken = "accessToken"
    }
}
