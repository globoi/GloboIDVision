import Foundation

final class SignInUseCase: SignInUseCaseProtocol {

    private let repository: SignInRepositoryProtocol

    init(repository: SignInRepositoryProtocol = SignInRepository()) {
        self.repository = repository
    }

    func execute(scopes: [Scope]) -> AnyPublisher<String, SignInError> {
        if let error = validateInput(scopes: scopes) {
            return Fail(error: error).eraseToAnyPublisher()
        }
        return signIn(scopes: scopes)
    }

    // MARK: - Private API

    private func signIn(scopes: [Scope]) -> AnyPublisher<String, SignInError> {
        repository.signIn(scopes: scopes)
            .eraseToAnyPublisher()
    }

    private func validateInput(scopes: [Scope]) -> SignInError? {
        if scopes.isEmpty {
            return .emptyScopes
        }
        return nil
    }
}
