import Foundation

class SetupUseCase: SetupUseCaseProtocol {

    private let repository: SetupRepositoryProtocol

    init(repository: SetupRepositoryProtocol = SetupRepository()) {
        self.repository = repository
    }

    func execute(clientID: String, redirectURL: String, environment: Environment) throws {
        if let error = validateInput(clientID: clientID, redirectURL: redirectURL) {
           throw error
        }
        setup(clientID: clientID, redirectURL: redirectURL, environment: environment)
    }

    // MARK: - Private API

    private func setup(clientID: String, redirectURL: String, environment: Environment) {
        repository.save(configuration: GloboIDVisionConfiguration(clientID: clientID, redirectURL: redirectURL, environment: environment))
    }

    private func validateInput(clientID: String, redirectURL: String) -> SetupError? {
        if clientID.isEmpty {
            return .emptyClientID
        }
        if redirectURL.isEmpty {
            return .emptyRedirectURL
        }
        return nil
    }
}
