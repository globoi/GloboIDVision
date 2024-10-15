import Foundation

protocol SetupRepositoryProtocol {

    var localData: SetupLocalDataProtocol { get }

    init(localData: SetupLocalDataProtocol)

    func save(configuration: GloboIDVisionConfiguration)
}
