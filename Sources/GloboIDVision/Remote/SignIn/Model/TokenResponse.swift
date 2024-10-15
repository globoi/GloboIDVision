import Foundation

struct TokenResponse: Decodable {
    let accessToken: String
    let idToken: String
    let refreshToken: String
    let tokenType: String
    let scope: String
    let expiresIn: Int
    let refreshExpiresIn: Int

    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case idToken = "id_token"
        case refreshToken = "refresh_token"
        case tokenType = "token_type"
        case scope = "scope"
        case expiresIn = "expires_in"
        case refreshExpiresIn = "refresh_expires_in"
    }
}
