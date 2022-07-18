@testable import SimpleLoginSystem
import XCTest

class ValidationServicesTest: XCTestCase {

    var validationService: ValidationServices!
    
    override func setUp() {
        super.setUp()
        validationService = ValidationServices()
    }

    override func tearDown() {
        super.tearDown()
        validationService = nil
    }
    
    func test_is_username_valid() throws {
        XCTAssertNoThrow(try validationService.validadateUsername(withUsername: "Gabriel"))
    }
    
    func test_is_username_nil() throws {
        let expectedError = ValidationError.nilValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validadateUsername(withUsername: nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_is_username_too_short() throws {
        let expectedError = ValidationError.usernameTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validadateUsername(withUsername: "a")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_is_username_too_long() throws {
        let expectedError = ValidationError.usernameTooLong
        var error: ValidationError?
        let username = "aaaaaaaaaaaaaaaaaaaaaaaaaaa"
        
        XCTAssertTrue(username.count > 20)
        
        XCTAssertThrowsError(try validationService.validadateUsername(withUsername: username)) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_is_password_valid() throws {
        XCTAssertNoThrow(try validationService.validatePassword(withPassword: "12345678"))
    }
    
    func test_password_is_nil() throws {
        let expectedError = ValidationError.nilValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validatePassword(withPassword: nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_is_password_too_short() throws {
        let expectedError = ValidationError.passwordTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validatePassword(withPassword: "a")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_is_password_too_long() throws{
        let expectedError = ValidationError.passwordTooLong
        var error: ValidationError?
        let password = "aaaaaaaaaaaaaaaaaaaaaaa"
        
        XCTAssertTrue(password.count > 20)
        XCTAssertThrowsError(try validationService.validatePassword(withPassword: password)) { thrownError in
            error = thrownError as? ValidationError

        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    
}
