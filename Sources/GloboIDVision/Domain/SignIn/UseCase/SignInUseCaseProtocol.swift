import Foundation

protocol SignInUseCaseProtocol {

    func execute(scopes: [Scope]) -> AnyPublisher<String, SignInError>
}
