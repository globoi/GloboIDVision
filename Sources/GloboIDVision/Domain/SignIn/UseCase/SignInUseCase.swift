import Foundation

final class SignInUseCase: SignInUseCaseProtocol {

    private let repository: SignInRepositoryProtocol

    init(repository: SignInRepositoryProtocol = SignInRepository()) {
        self.repository = repository
    }

    func execute(email: String, password: String) async throws -> String {
        try validateInput(email: email, password: password)
        return try await repository.signIn(email: email, password: password)
    }

    // MARK: - Private API

    private func validateInput(email: String, password: String) throws {
        if email.isEmpty {
            throw SignInError.emptyEmail
        }
        if password.isEmpty {
            throw SignInError.emptyPassword
        }
    }
}
