import UIKit

final class HeaderView: UIView {
    private let cameraButton: UIButton = {
        let btn = UIButton(type: .system)
        let img = UIImage(named: "ExploreCamera")?
            .withRenderingMode(.alwaysTemplate)
        btn.setImage(img, for: .normal)
        
        btn.backgroundColor = UIColor(red: 233/255.0, green: 233/255.0, blue: 235/255.0, alpha: 1)
        
        btn.tintColor = UIColor(red: 9/255.0, green: 61/255.0, blue: 137/255.0, alpha: 1)
        btn.layer.cornerRadius = 21
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Explore"
        lbl.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let bellButton: UIButton = {
        let btn = UIButton(type: .system)
        let img = UIImage(named: "exploreBell")?
            .withRenderingMode(.alwaysTemplate)
        btn.setImage(img, for: .normal)
        
        btn.backgroundColor = UIColor(red: 233/255.0, green: 233/255.0, blue: 235/255.0, alpha: 1)
        
        btn.tintColor = UIColor(red: 9/255.0, green: 61/255.0, blue: 137/255.0, alpha: 1)
        btn.layer.cornerRadius = 21
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(cameraButton)
        addSubview(titleLabel)
        addSubview(bellButton)
        
        NSLayoutConstraint.activate([
            
            cameraButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cameraButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cameraButton.widthAnchor.constraint(equalToConstant: 42),
            cameraButton.heightAnchor.constraint(equalToConstant: 42),
            
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
            bellButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bellButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            bellButton.widthAnchor.constraint(equalToConstant: 42),
            bellButton.heightAnchor.constraint(equalToConstant: 42),
        ])
    }
}
