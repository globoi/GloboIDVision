import Foundation

final class SignInRemoteData: SignInRemoteDataProtocol {

}


// Define an error enum to handle various errors in the API call
enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case statusCodeError(Int)
    case decodingError
}


final class APIClient {

    nonisolated(unsafe) static let shared = APIClient()
    private init() {}

    func signIn(username: String, password: String) async throws -> SignInResponse {
        guard let url = URL(string: "https://devices.globoid.qa.globoi.com/api/v1/sign-in") else {
            throw APIError.invalidURL
        }

        // Create the URLRequest with required headers and body
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")

        // Prepare the form data as x-www-form-urlencoded
        let bodyComponents = [
            "scope": "glbid profile openid",
            "username": username,
            "password": password,
            "client_id": "globoid-connect-sdk",
            "grant_type": "password"
        ]
        request.httpBody = bodyComponents
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .data(using: .utf8)

        // Perform the network request using URLSession
        let (data, response) = try await URLSession.shared.data(for: request)

        // Check for valid HTTP response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        // Check the HTTP status code
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.statusCodeError(httpResponse.statusCode)
        }

        // Decode the response into the SignInResponse struct if needed
        do {
            let decoder = JSONDecoder()
            let signInResponse = try decoder.decode(SignInResponse.self, from: data)
            return signInResponse
        } catch {
            throw APIError.decodingError
        }
    }
}
