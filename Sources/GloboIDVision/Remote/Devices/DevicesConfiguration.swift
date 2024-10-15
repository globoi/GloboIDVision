import Foundation

struct DevicesConfiguration {

    private let environment: Environment

    init(environment: Environment) {
        self.environment = environment
    }

    var host: URL {
        switch environment {
        case .production:
            guard let url = URL(string: "https://devices.globoid.globo.com") else {
                fatalError("Invalid URL for environment")
            }
            return url
        case .staging:
            guard let url = URL(string: "https://devices.globoid.qa.globoi.com") else {
                fatalError("Invalid URL for environment")
            }
            return url
        }
    }
}
