import UIKit

class ProfileGridView: UIView {
    
    
    let containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 48
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    private let topLeft = createImageView(named: "post-6")   
    private let topRight1 = createImageView(named: "post-2") 
    private let topRight2 = createImageView(named: "post-3") 
    private let botLeft = createImageView(named: "post-4")   
    private let botMid = createImageView(named: "post-5")    
    private let botRight = createImageView(named: "post-1")  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(containerView)
        
        let gridSpacing: CGFloat = 4
        
        
        let rightTopVStack = UIStackView(arrangedSubviews: [topRight1, topRight2])
        rightTopVStack.axis = .vertical
        rightTopVStack.spacing = gridSpacing
        rightTopVStack.distribution = .fillEqually
        
        
        let topRowHStack = UIStackView(arrangedSubviews: [topLeft, rightTopVStack])
        topRowHStack.axis = .horizontal
        topRowHStack.spacing = gridSpacing
        topRowHStack.distribution = .fill
        
        
        topLeft.widthAnchor.constraint(equalTo: topRowHStack.widthAnchor, multiplier: 0.55).isActive = true
        
        
        let bottomRowHStack = UIStackView(arrangedSubviews: [botLeft, botMid, botRight])
        bottomRowHStack.axis = .horizontal
        bottomRowHStack.spacing = gridSpacing
        bottomRowHStack.distribution = .fillEqually
        
        
        let masterVStack = UIStackView(arrangedSubviews: [topRowHStack, bottomRowHStack])
        masterVStack.axis = .vertical
        masterVStack.spacing = gridSpacing
        masterVStack.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(masterVStack)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            
            masterVStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            masterVStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            masterVStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            masterVStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
            
            topRowHStack.heightAnchor.constraint(equalToConstant: 240),
            bottomRowHStack.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    private static func createImageView(named: String) -> UIImageView {
        let iv = UIImageView()
        iv.image = UIImage(named: named)
        iv.contentMode = .scaleAspectFill
        
        iv.layer.cornerRadius = 0
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }
}
