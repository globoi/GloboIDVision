public class GloboIDVision {

    nonisolated(unsafe) public static let shared = GloboIDVision()

    private let setupUseCase: SetupUseCaseProtocol

    private init(
        setupUseCase: SetupUseCaseProtocol = SetupUseCase()
    ) {
        self.setupUseCase = setupUseCase
    }

    public func setup(clientID: String, redirectURL: String, environment: Environment) throws {
        try setupUseCase.execute(clientID: clientID, redirectURL: redirectURL, environment: environment)
    }
}
