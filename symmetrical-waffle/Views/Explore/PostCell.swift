




import UIKit

final class PostCell: UICollectionViewCell {

    static let reuseID = "PostCell"

    

    private let cardView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 32 
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let usernameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let handleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13)
        
        lbl.textColor = UIColor(red: 108/255.0, green: 122/255.0, blue: 156/255.0, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 24 
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    
    private let commentIcon: UIImageView = {
        let iv = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        iv.image = UIImage(systemName: "message.fill", withConfiguration: config)
        iv.tintColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let commentLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let likeIcon: UIImageView = {
        let iv = UIImageView()
        let img = UIImage(named: "likeicon")?
            .withRenderingMode(.alwaysOriginal)
        iv.image = img
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let likeLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let sendButton: UIButton = {
        let btn = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .medium)
        btn.setImage(UIImage(systemName: "paperplane.fill", withConfiguration: config), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let saveButton: UIButton = {
        let btn = UIButton(type: .system)
        let img = UIImage(named: "Save")?
            .withRenderingMode(.alwaysOriginal)
        btn.setImage(img, for: .normal)
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
        contentView.addSubview(cardView)

        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

        
        cardView.addSubview(profileImageView)
        cardView.addSubview(usernameLabel)
        cardView.addSubview(handleLabel)

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 14),
            profileImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 14),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),

            usernameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 1),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            usernameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -14),

            handleLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 1),
            handleLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            handleLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
        ])

        
        cardView.addSubview(postImageView)
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 12),
            postImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -12),
            postImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -12),
        ])

        
        setupEngagementOverlay()
    }

    private func setupEngagementOverlay() {
        
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        postImageView.addSubview(blurView)
        postImageView.isUserInteractionEnabled = true

        
        let leftStack = UIStackView(arrangedSubviews: [commentIcon, commentLabel, likeIcon, likeLabel])
        leftStack.axis = .horizontal
        leftStack.spacing = 6
        leftStack.alignment = .center
        leftStack.translatesAutoresizingMaskIntoConstraints = false

        
        let rightStack = UIStackView(arrangedSubviews: [sendButton, saveButton])
        rightStack.axis = .horizontal
        rightStack.spacing = 14
        rightStack.alignment = .center
        rightStack.translatesAutoresizingMaskIntoConstraints = false

        blurView.contentView.addSubview(leftStack)
        blurView.contentView.addSubview(rightStack)

        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: postImageView.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: postImageView.bottomAnchor),
            blurView.heightAnchor.constraint(equalToConstant: 60), 
            
            leftStack.leadingAnchor.constraint(equalTo: blurView.contentView.leadingAnchor, constant: 18),
            leftStack.centerYAnchor.constraint(equalTo: blurView.contentView.centerYAnchor),

            rightStack.trailingAnchor.constraint(equalTo: blurView.contentView.trailingAnchor, constant: -18),
            rightStack.centerYAnchor.constraint(equalTo: blurView.contentView.centerYAnchor),

            likeIcon.widthAnchor.constraint(equalToConstant: 20),
            likeIcon.heightAnchor.constraint(equalToConstant: 20),
            sendButton.widthAnchor.constraint(equalToConstant: 24),
            sendButton.heightAnchor.constraint(equalToConstant: 24),
            saveButton.widthAnchor.constraint(equalToConstant: 24),
            saveButton.heightAnchor.constraint(equalToConstant: 24),
        ])
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    

    func configure(with post: Post) {
        profileImageView.image = UIImage(named: post.profileImageName)
        usernameLabel.text = post.username
        handleLabel.text = post.handle
        postImageView.image = UIImage(named: post.postImageName)
        commentLabel.text = "\(post.commentCount)"
        likeLabel.text = "\(post.likeCount)"
    }
}
