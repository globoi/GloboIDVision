import Foundation

protocol SignInUseCaseProtocol {

    func execute(email: String, password: String) async throws -> String
}
