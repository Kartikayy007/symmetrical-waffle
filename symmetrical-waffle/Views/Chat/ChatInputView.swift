import UIKit

final class ChatInputView: UIView {
    
    private let pillBackground: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 24
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let cameraButton: UIButton = {
        let btn = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        btn.setImage(UIImage(systemName: "camera.fill", withConfiguration: config), for: .normal)
        
        btn.backgroundColor = UIColor(red: 87/255.0, green: 144/255.0, blue: 223/255.0, alpha: 1)
        btn.tintColor = .white
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let sendButton: UIButton = {
        let btn = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .bold)
        btn.setImage(UIImage(systemName: "paperplane.fill", withConfiguration: config), for: .normal)
        btn.backgroundColor = UIColor(red: 87/255.0, green: 144/255.0, blue: 223/255.0, alpha: 1)
        btn.tintColor = .white
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = " "
        tf.backgroundColor = .clear
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(pillBackground)
        pillBackground.addSubview(cameraButton)
        pillBackground.addSubview(textField)
        pillBackground.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            
            pillBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pillBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            pillBackground.centerYAnchor.constraint(equalTo: centerYAnchor),
            pillBackground.heightAnchor.constraint(equalToConstant: 48),
            
            cameraButton.leadingAnchor.constraint(equalTo: pillBackground.leadingAnchor, constant: 4),
            cameraButton.centerYAnchor.constraint(equalTo: pillBackground.centerYAnchor),
            cameraButton.widthAnchor.constraint(equalToConstant: 40),
            cameraButton.heightAnchor.constraint(equalToConstant: 40),
            
            sendButton.trailingAnchor.constraint(equalTo: pillBackground.trailingAnchor, constant: -4),
            sendButton.centerYAnchor.constraint(equalTo: pillBackground.centerYAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 40),
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            
            textField.leadingAnchor.constraint(equalTo: cameraButton.trailingAnchor, constant: 12),
            textField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -12),
            textField.centerYAnchor.constraint(equalTo: pillBackground.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
