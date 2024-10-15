import Foundation

class SetupRepository: SetupRepositoryProtocol {

    let localData: SetupLocalDataProtocol

    required init(localData: SetupLocalDataProtocol = SetupLocalData()) {
        self.localData = localData
    }

    func save(configuration: GloboIDVisionConfiguration) {
        localData.save(configuration: configuration)
    }
}
