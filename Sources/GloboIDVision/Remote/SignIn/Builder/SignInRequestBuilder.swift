import Foundation

final class SignInRequestBuilder {

    private enum QueryParameterKeys: String {
        case scope = "scope"
        case clientId = "client_id"
        case grantType = "grant_type"
        case email = "username"
        case password = "password"
    }

    private let email: String
    private let password: String
    private let clientId: String
    private let grantType: String
    private let environment: Environment
    private let urlPath = "api/v1/sign-in"

    init(email: String, password: String, clientId: String, grantType: String, environment: Environment) {
        self.email = email
        self.password = password
        self.clientId = clientId
        self.grantType = grantType
        self.environment = environment
    }

    func build() -> URLRequest {
        var request = URLRequest(url: buildURL())
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue(HTTPContentType.formURLEncoded.rawValue,
                         forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        request.httpBody = getParameters()
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .data(using: .utf8)

        return request
    }

    // MARK: - Private API

    private func buildURL() -> URL {
        let devicesURL = DevicesConfiguration(environment: environment).host.absoluteString
        return URL(string: "\(devicesURL)/\(urlPath)")!
    }

    private func getParameters() -> [String: String] {
        var parameters: [String: String] = [:]
        parameters[QueryParameterKeys.scope.rawValue] = "glbid profile"
        parameters[QueryParameterKeys.clientId.rawValue] = clientId
        parameters[QueryParameterKeys.grantType.rawValue] = grantType
        parameters[QueryParameterKeys.email.rawValue] = email
        parameters[QueryParameterKeys.password.rawValue] = password
        return parameters
    }
}
