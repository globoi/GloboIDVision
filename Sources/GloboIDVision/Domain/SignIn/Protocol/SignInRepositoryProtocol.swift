import Foundation

protocol SignInRepositoryProtocol {

    var localData: SignInLocalDataProtocol { get }
    var remoteData: SignInRemoteDataProtocol { get }

    init(localData: SignInLocalDataProtocol, remoteData: SignInRemoteDataProtocol)

    func signIn(scopes: [Scope]) -> AnyPublisher<String, SignInError>
}
