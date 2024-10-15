import Foundation

protocol SignInRepositoryProtocol {

    var localData: SignInLocalDataProtocol { get }
    var remoteData: SignInRemoteDataProtocol { get }

    init(localData: SignInLocalDataProtocol, remoteData: SignInRemoteDataProtocol)

    func signIn(email: String, password: String) async throws -> String
}
