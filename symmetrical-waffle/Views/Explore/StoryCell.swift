




import UIKit

final class StoryCell: UICollectionViewCell {

    static let reuseID = "StoryCell"

    

    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 30
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let ringView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.layer.borderWidth = 2.5
        
        v.layer.borderColor = UIColor(red: 87/255.0, green: 144/255.0, blue: 223/255.0, alpha: 1).cgColor
        v.layer.cornerRadius = 34
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let plusBadge: UIView = {
        let container = UIView()
        
        container.backgroundColor = UIColor(red: 87/255.0, green: 144/255.0, blue: 223/255.0, alpha: 1)
        container.layer.cornerRadius = 11
        container.translatesAutoresizingMaskIntoConstraints = false
        container.isHidden = true

        let plus = UIImageView(image: UIImage(
            systemName: "plus",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .bold)
        ))
        plus.tintColor = .white
        plus.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(plus)

        NSLayoutConstraint.activate([
            plus.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            plus.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        ])

        return container
    }()

    private let usernameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        contentView.addSubview(ringView)
        contentView.addSubview(profileImageView)
        contentView.addSubview(plusBadge)
        contentView.addSubview(usernameLabel)

        NSLayoutConstraint.activate([
            
            ringView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ringView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            ringView.widthAnchor.constraint(equalToConstant: 68),
            ringView.heightAnchor.constraint(equalToConstant: 68),

            
            profileImageView.centerXAnchor.constraint(equalTo: ringView.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: ringView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),

            
            plusBadge.trailingAnchor.constraint(equalTo: ringView.trailingAnchor, constant: 2),
            plusBadge.bottomAnchor.constraint(equalTo: ringView.bottomAnchor, constant: 2),
            plusBadge.widthAnchor.constraint(equalToConstant: 22),
            plusBadge.heightAnchor.constraint(equalToConstant: 22),

            
            usernameLabel.topAnchor.constraint(equalTo: ringView.bottomAnchor, constant: 6),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    

    func configure(with story: Story) {
        profileImageView.image = UIImage(named: story.imageName)
        usernameLabel.text = story.username
        plusBadge.isHidden = !story.isYourStory
    }
}
