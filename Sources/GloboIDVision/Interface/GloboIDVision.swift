public class GloboIDVision {

    nonisolated(unsafe) public static let shared = GloboIDVision()

    private let setupUseCase: SetupUseCaseProtocol
    private let signInUseCase: SignInUseCaseProtocol

    private init(
        setupUseCase: SetupUseCaseProtocol = SetupUseCase(),
        signInUseCase: SignInUseCaseProtocol = SignInUseCase()

    ) {
        self.setupUseCase = setupUseCase
        self.signInUseCase = signInUseCase
    }

    public func setup(clientID: String, redirectURL: String, environment: Environment) throws {
        try setupUseCase.execute(clientID: clientID, redirectURL: redirectURL, environment: environment)
    }

    public func signIn(email: String, password: String) async throws -> String {
        return try await signInUseCase.execute(email: email, password: password)
    }
}
