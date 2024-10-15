import Foundation

enum SignInError: Error {
    case emptyScopes
    case local(error: SignInLocalDataError)
    case remote(error: SignInRemoteDataError)
}
