import Foundation

enum LoginErrors: LocalizedError {
    case invalidCredentials
    
    var errorDescription: String? {
        switch self {
            case .invalidCredentials:
                return "Invalid Username or Password"
        }
    }
}
