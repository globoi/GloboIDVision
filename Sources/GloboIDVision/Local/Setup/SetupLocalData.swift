import Foundation

final class SetupLocalData: SetupLocalDataProtocol {
    
    private let userDefaultsManager: UserDefaultsManager

    init(userDefaultsManager: UserDefaultsManager = UserDefaultsManager.shared) {
        self.userDefaultsManager = userDefaultsManager
    }

    func save(configuration: GloboIDVisionConfiguration) {
        UserDefaultsManager.shared.clientID = configuration.clientID
        UserDefaultsManager.shared.redirectURL = configuration.redirectURL
        UserDefaultsManager.shared.environment = configuration.environment.rawValue
    }
}
