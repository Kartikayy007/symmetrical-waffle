import UIKit

class ProfileHeaderView: UIView {
    
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profilebg")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let backButton: UIButton = {
        let btn = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        btn.setImage(UIImage(systemName: "arrow.left", withConfiguration: config), for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = .white.withAlphaComponent(0.8)
        btn.layer.cornerRadius = 22
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let mailButton: UIButton = {
        let btn = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
        btn.setImage(UIImage(systemName: "envelope.fill", withConfiguration: config), for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = .white.withAlphaComponent(0.8)
        btn.layer.cornerRadius = 22
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    let infoContainer: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 231/255.0, green: 238/255.0, blue: 250/255.0, alpha: 1) 
        v.layer.cornerRadius = 48
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profilepic")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 55 
        iv.layer.borderWidth = 5
        iv.layer.borderColor = UIColor(red: 231/255.0, green: 238/255.0, blue: 250/255.0, alpha: 1).cgColor 
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    lazy var followersStack: UIStackView = createStatStack(count: "1k", label: "Followers")
    lazy var followingStack: UIStackView = createStatStack(count: "342", label: "Following")
    
    let handleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "@Catherine13"
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let bioLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "My name is Catherine. I like dancing in the rain\nand travelling all around the world."
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.textColor = UIColor(red: 101/255.0, green: 119/255.0, blue: 158/255.0, alpha: 1) 
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    let followButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Follow", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        let blueColor = UIColor(red: 87/255.0, green: 144/255.0, blue: 223/255.0, alpha: 1)
        btn.backgroundColor = blueColor
        btn.layer.cornerRadius = 24
        btn.layer.shadowColor = blueColor.cgColor
        btn.layer.shadowOpacity = 0.4
        btn.layer.shadowRadius = 15
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let messageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Message", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 24
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.15
        btn.layer.shadowRadius = 15
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let tabsStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let allTabLabel: UILabel = createTabLabel(text: "All", isActive: true)
    private let photosTabLabel: UILabel = createTabLabel(text: "Photos", isActive: false)
    private let videosTabLabel: UILabel = createTabLabel(text: "Videos", isActive: false)
    
    let tabIndicator: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 101/255.0, green: 119/255.0, blue: 158/255.0, alpha: 1)
        v.layer.cornerRadius = 1.5
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
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
        
        addSubview(backgroundImageView)
        addSubview(infoContainer)
        addSubview(backButton)
        addSubview(mailButton)
        addSubview(avatarImageView) 
        
        
        infoContainer.addSubview(followersStack)
        infoContainer.addSubview(followingStack)
        infoContainer.addSubview(handleLabel)
        infoContainer.addSubview(bioLabel)
        
        let buttonsStack = UIStackView(arrangedSubviews: [followButton, messageButton])
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 16
        buttonsStack.distribution = .fillEqually
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        infoContainer.addSubview(buttonsStack)
        
        tabsStack.addArrangedSubview(allTabLabel)
        tabsStack.addArrangedSubview(photosTabLabel)
        tabsStack.addArrangedSubview(videosTabLabel)
        infoContainer.addSubview(tabsStack)
        infoContainer.addSubview(tabIndicator)
        
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 220),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            
            mailButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            mailButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mailButton.widthAnchor.constraint(equalToConstant: 44),
            mailButton.heightAnchor.constraint(equalToConstant: 44),
            
            
            infoContainer.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -48),
            infoContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: infoContainer.topAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            
            
            followersStack.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 16),
            followersStack.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -24),
            
            followingStack.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 16),
            followingStack.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            
            
            handleLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            handleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bioLabel.topAnchor.constraint(equalTo: handleLabel.bottomAnchor, constant: 12),
            bioLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            
            buttonsStack.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 24),
            buttonsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            buttonsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            buttonsStack.heightAnchor.constraint(equalToConstant: 48),
            
            
            tabsStack.topAnchor.constraint(equalTo: buttonsStack.bottomAnchor, constant: 32),
            tabsStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            tabsStack.widthAnchor.constraint(equalToConstant: 240),
            
            tabIndicator.topAnchor.constraint(equalTo: allTabLabel.bottomAnchor, constant: 4),
            tabIndicator.centerXAnchor.constraint(equalTo: allTabLabel.centerXAnchor),
            tabIndicator.widthAnchor.constraint(equalToConstant: 16),
            tabIndicator.heightAnchor.constraint(equalToConstant: 3),
            
            
            tabsStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    private func createStatStack(count: String, label: String) -> UIStackView {
        let countLabel = UILabel()
        countLabel.text = count
        countLabel.font = .systemFont(ofSize: 16, weight: .bold)
        countLabel.textColor = .black
        countLabel.textAlignment = .center
        
        let subLabel = UILabel()
        subLabel.text = label
        subLabel.font = .systemFont(ofSize: 13, weight: .regular)
        subLabel.textColor = .black
        subLabel.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [countLabel, subLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    private static func createTabLabel(text: String, isActive: Bool) -> UILabel {
        let lbl = UILabel()
        lbl.text = text
        lbl.font = .systemFont(ofSize: 15, weight: isActive ? .semibold : .regular)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
}

