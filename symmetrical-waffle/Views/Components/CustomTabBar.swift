import UIKit

final class CustomTabBar: UIView {
    var onChatTap: (() -> Void)?
    var onProfileTap: (() -> Void)?
    
    private let centerButtonSize: CGFloat = 66
    
    private let backgroundContainer: UIView = {
        let v = UIView()
        
        v.backgroundColor = UIColor(red: 87/255.0, green: 144/255.0, blue: 223/255.0, alpha: 0.6)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let blurView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let v = UIVisualEffectView(effect: blur)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    private let shapeMaskLayer = CAShapeLayer()
    
    
    private let homeTab = createTabButton(asset: "home", sfSymbol: "house")
    private let chatTab = createTabButton(asset: "chatTab", sfSymbol: "message.fill")
    private let profileTab = createTabButton(asset: "profileTab", sfSymbol: "person.fill")
    private let bellTab = createTabButton(asset: "notificationTab", sfSymbol: "bell.fill")
    
    
    private let centerButton: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 33
        
        
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.15
        v.layer.shadowOffset = CGSize(width: 0, height: 4)
        v.layer.shadowRadius = 8
        v.translatesAutoresizingMaskIntoConstraints = false
        
        let plus = UIImageView(image: UIImage(
            systemName: "plus",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .bold)
        ))
        
        plus.tintColor = UIColor(red: 9/255.0, green: 61/255.0, blue: 137/255.0, alpha: 1.0)
        plus.translatesAutoresizingMaskIntoConstraints = false
        v.addSubview(plus)
        NSLayoutConstraint.activate([
            plus.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            plus.centerYAnchor.constraint(equalTo: v.centerYAnchor),
        ])
        return v
    }()
    
    
    
    private static func createTabButton(asset: String, sfSymbol: String) -> UIButton {
        let btn = UIButton(type: .system)
        let img = UIImage(named: asset) ?? UIImage(systemName: sfSymbol)
        btn.setImage(img?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    
    private func setupUI() {
        clipsToBounds = false
        
        
        addSubview(backgroundContainer)
        NSLayoutConstraint.activate([
            backgroundContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundContainer.topAnchor.constraint(equalTo: topAnchor),
            backgroundContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        
        backgroundContainer.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: backgroundContainer.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: backgroundContainer.trailingAnchor),
            blurView.topAnchor.constraint(equalTo: backgroundContainer.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: backgroundContainer.bottomAnchor),
        ])
        backgroundContainer.layer.mask = shapeMaskLayer
        
        
        addSubview(centerButton)
        NSLayoutConstraint.activate([
            centerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            centerButton.centerYAnchor.constraint(equalTo: topAnchor, constant: 16),
            centerButton.widthAnchor.constraint(equalToConstant: centerButtonSize),
            centerButton.heightAnchor.constraint(equalToConstant: centerButtonSize),
        ])
        
        
        addSubview(homeTab)
        addSubview(chatTab)
        addSubview(profileTab)
        addSubview(bellTab)
        
        chatTab.addTarget(self, action: #selector(handleChatTap), for: .touchUpInside)
        profileTab.addTarget(self, action: #selector(handleProfileTap), for: .touchUpInside)
        
        let iconSize: CGFloat = 26
        let iconYOffset: CGFloat = 26
        
        NSLayoutConstraint.activate([
            
            chatTab.centerYAnchor.constraint(equalTo: topAnchor, constant: iconYOffset),
            chatTab.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -62),
            chatTab.widthAnchor.constraint(equalToConstant: iconSize),
            chatTab.heightAnchor.constraint(equalToConstant: iconSize),
            
            homeTab.centerYAnchor.constraint(equalTo: topAnchor, constant: iconYOffset),
            homeTab.trailingAnchor.constraint(equalTo: chatTab.leadingAnchor, constant: -38),
            homeTab.widthAnchor.constraint(equalToConstant: iconSize),
            homeTab.heightAnchor.constraint(equalToConstant: iconSize),
            
            
            profileTab.centerYAnchor.constraint(equalTo: topAnchor, constant: iconYOffset),
            profileTab.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 62),
            profileTab.widthAnchor.constraint(equalToConstant: iconSize),
            profileTab.heightAnchor.constraint(equalToConstant: iconSize),
            
            bellTab.centerYAnchor.constraint(equalTo: topAnchor, constant: iconYOffset),
            bellTab.leadingAnchor.constraint(equalTo: profileTab.trailingAnchor, constant: 38),
            bellTab.widthAnchor.constraint(equalToConstant: iconSize),
            bellTab.heightAnchor.constraint(equalToConstant: iconSize),
        ])
    }
    
    @objc private func handleChatTap() {
        onChatTap?()
    }
    
    @objc private func handleProfileTap() {
        onProfileTap?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCutoutMask()
    }
    
    private func setupCutoutMask() {
        let w = backgroundContainer.bounds.width
        let h = backgroundContainer.bounds.height
        let cornerRadius: CGFloat = 12
        
        let path = UIBezierPath()
        
        
        path.move(to: CGPoint(x: 0, y: cornerRadius))
        path.addArc(withCenter: CGPoint(x: cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: .pi,
                    endAngle: 3 * .pi / 2,
                    clockwise: true)
        
        
        
        let holeRadius: CGFloat = 43
        let circleCenterY: CGFloat = 16
        let holeCenter = CGPoint(x: w / 2, y: circleCenterY)
        
        
        let shoulderWidth: CGFloat = 15
        let startX = holeCenter.x - holeRadius - shoulderWidth
        let endX = holeCenter.x + holeRadius + shoulderWidth
        
        path.addLine(to: CGPoint(x: startX, y: 0))
        
        
        path.addCurve(to: CGPoint(x: holeCenter.x - holeRadius, y: holeCenter.y),
                      controlPoint1: CGPoint(x: startX + 8, y: 0),
                      controlPoint2: CGPoint(x: holeCenter.x - holeRadius, y: 4))
        
        
        
        path.addArc(withCenter: holeCenter,
                    radius: holeRadius,
                    startAngle: .pi,
                    endAngle: 0,
                    clockwise: false)
        
        
        path.addCurve(to: CGPoint(x: endX, y: 0),
                      controlPoint1: CGPoint(x: holeCenter.x + holeRadius, y: 4),
                      controlPoint2: CGPoint(x: endX - 8, y: 0))
        
        
        
        path.addLine(to: CGPoint(x: w - cornerRadius, y: 0))
        path.addArc(withCenter: CGPoint(x: w - cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: 3 * .pi / 2,
                    endAngle: 2 * .pi,
                    clockwise: true)
        
        
        path.addLine(to: CGPoint(x: w, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.close()
        
        shapeMaskLayer.path = path.cgPath
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let convertedPoint = centerButton.convert(point, from: self)
        if centerButton.bounds.contains(convertedPoint) {
            return centerButton
        }
        if let path = shapeMaskLayer.path, path.contains(point) {
            return super.hitTest(point, with: event)
        }
        return nil
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

#Preview("CustomTabBar") {
    let tabBar = CustomTabBar()
    tabBar.translatesAutoresizingMaskIntoConstraints = false
    tabBar.heightAnchor.constraint(equalToConstant: 104).isActive = true
    
    let container = UIView()
    container.backgroundColor = .systemGray5
    container.addSubview(tabBar)
    
    NSLayoutConstraint.activate([
        tabBar.leadingAnchor.constraint(equalTo: container.leadingAnchor),
        tabBar.trailingAnchor.constraint(equalTo: container.trailingAnchor),
        tabBar.bottomAnchor.constraint(equalTo: container.bottomAnchor),
    ])
    
    return container
}
#endif
