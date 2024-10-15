import Foundation

protocol SetupUseCaseProtocol: AnyObject {

    func execute(clientID: String, redirectURL: String, environment: Environment) throws
}
