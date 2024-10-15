import Foundation

protocol SignInRemoteDataProtocol: AnyObject {

    var urlSession: URLSession { get }

    init(urlSession: URLSession)

    func signIn(with input: SignInInput) async throws -> TokenResponse
}
