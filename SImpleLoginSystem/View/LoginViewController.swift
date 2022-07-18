import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private let customView = CustomShapeView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.9))
    
    private lazy var usernameView: UIView = {
        let view = InputViewSetup().setupInputView(textField: usernameTextField)
        return view
    }()
    
    private lazy var passwordView: UIView = {
        let view = InputViewSetup().setupInputView(textField: passwordTextField)
        return view
    }()
    
    private var usernameTextField: UITextField = {
        let placeholder = "Username"
        let textField = InputViewSetup().setupInputTextField(placeholder: placeholder)
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let placeholder = "Password"
        let textField = InputViewSetup().setupInputTextField(placeholder: placeholder)
        return textField
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8).isActive = true
        button.layer.cornerRadius = 24
        button.backgroundColor = UIColor.rgb(red: 109, green: 119, blue: 200)
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleLoginAction), for: .touchUpInside)
        return button
    }()
    
    private let authorizationButton: ASAuthorizationAppleIDButton = {
        let button = ASAuthorizationAppleIDButton(type: .continue, style: .black)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8).isActive = true
        button.cornerRadius = 24
        return button
    }()
    
    private let registerAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue])
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        button.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        return button
    }()
    
    var validationService: ValidationServices
    
    var database = [User(username: "Gabriel", password: "12345678")]
    
    //MARK: - LifeCycle
    
    init() {
        validationService = ValidationServices()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        view.addSubview(authorizationButton)
        authorizationButton.translatesAutoresizingMaskIntoConstraints = false
        authorizationButton.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: -40).isActive = true
        authorizationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    deinit {
//        validationService = nil
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = true

        let stack = UIStackView(arrangedSubviews: [usernameView, passwordView])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(customView)
        customView.addSubview(stack)
        customView.addSubview(loginButton)
        customView.addSubview(registerAccountButton)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     stack.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
                                     
                                     loginButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 40),
                                     loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     
                                     registerAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
                                     registerAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
    }
    
    //MARK: - Selectors
    @objc func handleLoginAction() throws {
        do {
            let username = try ValidationServices().validadateUsername(withUsername: usernameTextField.text)
            let password = try ValidationServices().validatePassword(withPassword: passwordTextField.text)
            
            if database.first(where: { user in
                user.username == username && user.password == password
            }) != nil {
                
                let vc = HomeViewController()
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
                
            } else {
                throw LoginErrors.invalidCredentials
            }
        } catch let err {
            present(err)
        }  
    }
    
    @objc func didTapRegister() {
        //
    }
 
}

