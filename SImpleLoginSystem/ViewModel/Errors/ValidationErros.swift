import Foundation

enum ValidationError: LocalizedError{
    case nilValue
    case usernameTooShort
    case usernameTooLong
    case passwordTooShort
    case passwordTooLong
    
    var errorDescription: String? {
        switch self {
            case .nilValue:
                return "Value empty"
            case .usernameTooShort:
                return "Username has 3 or less characters"
            case .usernameTooLong:
                return "Username has 20 or more characters"
            case .passwordTooShort:
                return "Password has 8 or less characters"
            case .passwordTooLong:
                return "Password has 20 o more characters"
        }
    }
}
