import UIKit

struct InputViewSetup {
    
    func setupInputView(textField: UITextField) -> UIView {
        let view = UIView()
        
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8).isActive = true
        view.layer.cornerRadius = 24
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 30
        view.layer.shadowOffset = .zero
        
        view.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
       
        
        return view
    }
    
    func setupInputTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
    
        textField.font = .systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        return textField
    }
}
