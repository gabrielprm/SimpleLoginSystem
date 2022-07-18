import Foundation

struct ValidationServices {
    
    func validadateUsername(withUsername username: String?) throws -> String {
        guard let username = username else { throw ValidationError.nilValue }
        guard username != "" else { throw ValidationError.nilValue }
        guard username.count > 3 else { throw ValidationError.usernameTooShort }
        guard username.count < 20 else { throw ValidationError.usernameTooLong }
        return username
    }
    
    func validatePassword(withPassword password: String?) throws -> String {
        guard let password = password else { throw ValidationError.nilValue }
        guard password != "" else { throw ValidationError.nilValue }
        guard password.count >= 8 else { throw ValidationError.passwordTooShort }
        guard password.count < 20 else { throw ValidationError.passwordTooLong }
        return password
    }
    
}
