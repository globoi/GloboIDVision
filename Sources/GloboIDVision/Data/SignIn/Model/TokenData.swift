import Foundation

struct TokenData {

    let accessToken: String
    let expiresIn: Int
    let refreshExpiresIn: Int
    let refreshToken: String
    let tokenType: String
    let idToken: String
    let notBeforePolicy: Int?
    let sessionState: String?
    let scope: String
    let expirationDate: Date
    let refreshExpirationDate: Date
}
