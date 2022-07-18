@testable import SimpleLoginSystem
import XCTest

class LoginViewControllerTest: XCTestCase {
    
    var loginViewController: LoginViewController!
    
    override  func setUp() {
        loginViewController = LoginViewController()
    }
    
    override func tearDown() {
        loginViewController = nil
    }
    
    func test_is_handle_login_valid() throws {
        let username = "Gabriel"
        let password = "12345678"
        let database = [User(username: "Gabriel", password: "12345678")]
        
        XCTAssertNoThrow(try loginViewController.handleLoginAction())
    }
    
//    func test_is_login_credential_invalid() throws {
//        let username = ";aldsfjdfhalsjf"
//        let password = "asdfasfafsd"
//        let database = [User(username: "Gabriel", password: "12345678")]
//
//        let expectedError = LoginErrors.invalidCredentials
//        var error: LoginErrors?
//
//        XCTAssertThrowsError(try loginViewController.handleLoginAction()) { errorThrown in
//            error = errorThrown as? LoginErrors
//        }
//
//        XCTAssertEqual(expectedError, error)
//    }
    
    
}
