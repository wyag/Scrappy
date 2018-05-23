import UIKit

class CustomNavView: UIView {
    
    ///////////////////////////////////////////////////////////// MARK: Lifecycle Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    ///////////////////////////////////////////////////////////// MARK: Local Properties
    
    let navMenuView = UIView()
    var blurView = UIVisualEffectView()
    let closeMenuButton = UIButton()
    
    // Nav Buttons | 10 Buttons
    let homeMenuButton = UIButton()
    let birthdayMenuButton = UIButton()
    let seasonalMenuButton = UIButton()
    let holidayMenuButton = UIButton()
    let sportsMenuButton = UIButton()
    let congratsMenuButton = UIButton()
    let miscMenuButton = UIButton()
    
    let cartImageView = UIImageView()
    let cartLabel = UILabel()
    let cartMenuButton = UIButton()
    
    
    let profileImage = UIImageView()
    let profileButton = UIButton()
    
    
    let logOutMenuButton = UIButton()
    
    
    
    ///////////////////////////////////////////////////////////// MARK: Setup UI Function
    
    func setupUI(frame: CGRect) {
        
        // 'menuView'
        navMenuView.frame = CGRect(x: ((frame.width/2) * -1), y: 0, width: frame.width/2, height: frame.height)
        navMenuView.backgroundColor = UIColor.orange
        
        // 'blurView'
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        blurView.alpha = 0
        
        // 'closeMenuButton'
        closeMenuButton.setImage(UIImage(named: "whiteX"), for: .normal)
        closeMenuButton.setImage(UIImage(named: "whiteX"), for: .highlighted)
        closeMenuButton.setImage(UIImage(named: "whiteX"), for: .selected)
        closeMenuButton.backgroundColor = UIColor.clear
        closeMenuButton.frame = CGRect(x: (frame.width/2), y: 0, width: (frame.width/2), height: frame.height)
        closeMenuButton.alpha = 0
        
        // 'homeMenuButton'
        homeMenuButton.backgroundColor = UIColor.clear
        let oneMenuButtonAT = NSMutableAttributedString(string: "Home", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 20) as Any])
        homeMenuButton.setAttributedTitle(oneMenuButtonAT, for: .normal)
        homeMenuButton.frame = CGRect(x: 0, y: 80, width: 100, height: 20)
        homeMenuButton.sizeToFit()
        homeMenuButton.frame.origin.x = 10
        homeMenuButton.accessibilityIdentifier = "Home"
        
        // 'birthdayMenuButton'
        let birthdayMenuButtonAT = NSMutableAttributedString(string: "- Birthday", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        birthdayMenuButton.setAttributedTitle(birthdayMenuButtonAT, for: .normal)
        birthdayMenuButton.backgroundColor = UIColor.clear
        birthdayMenuButton.frame = CGRect(x: 0, y: 140, width: 100, height: 20)
        birthdayMenuButton.sizeToFit()
        birthdayMenuButton.frame.origin.x = 20
        birthdayMenuButton.accessibilityIdentifier = "Birthday"
        
        // 'seasonalMenuButton'
        let sesonalMenuButtonAT = NSMutableAttributedString(string: "- Sesonal", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        seasonalMenuButton.setAttributedTitle(sesonalMenuButtonAT, for: .normal)
        seasonalMenuButton.backgroundColor = UIColor.clear
        seasonalMenuButton.frame = CGRect(x: 0, y: 180, width: 100, height: 20)
        seasonalMenuButton.sizeToFit()
        seasonalMenuButton.frame.origin.x = 20
        seasonalMenuButton.accessibilityIdentifier = "Seasonal"
        
        // 'holidayMenuButton'
        let holidayMenuButtonAT = NSMutableAttributedString(string: "- Holiday", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        holidayMenuButton.setAttributedTitle(holidayMenuButtonAT, for: .normal)
        holidayMenuButton.backgroundColor = UIColor.clear
        holidayMenuButton.frame = CGRect(x: 0, y: 220, width: 100, height: 20)
        holidayMenuButton.sizeToFit()
        holidayMenuButton.frame.origin.x = 20
        holidayMenuButton.accessibilityIdentifier = "Holiday"
        
        // 'sportsMenuButton'
        let sportsMenuButtonAT = NSMutableAttributedString(string: "- Sports", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        sportsMenuButton.setAttributedTitle(sportsMenuButtonAT, for: .normal)
        sportsMenuButton.backgroundColor = UIColor.clear
        sportsMenuButton.frame = CGRect(x: 0, y: 260, width: 100, height: 20)
        sportsMenuButton.sizeToFit()
        sportsMenuButton.frame.origin.x = 20
        sportsMenuButton.accessibilityIdentifier = "Sports"
        
        // 'congratsMenuButton'
        let congratsMenuButtonAT = NSMutableAttributedString(string: "- Congrats", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        congratsMenuButton.setAttributedTitle(congratsMenuButtonAT, for: .normal)
        congratsMenuButton.backgroundColor = UIColor.clear
        congratsMenuButton.frame = CGRect(x: 0, y: 300, width: 100, height: 20)
        congratsMenuButton.sizeToFit()
        congratsMenuButton.frame.origin.x = 20
        congratsMenuButton.accessibilityIdentifier = "Congrats"
        
        // 'miscMenuButton'
        let miscMenuButtonAT = NSMutableAttributedString(string: "- Misc", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any])
        miscMenuButton.setAttributedTitle(miscMenuButtonAT, for: .normal)
        miscMenuButton.backgroundColor = UIColor.clear
        miscMenuButton.frame = CGRect(x: 0, y: 340, width: 100, height: 20)
        miscMenuButton.sizeToFit()
        miscMenuButton.frame.origin.x = 20
        miscMenuButton.accessibilityIdentifier = "Misc"
        
        // 'profileImage'
        profileImage.image = UIImage(named: "mock6")
        profileImage.backgroundColor = UIColor.darkGray
        profileImage.frame = CGRect(x: 20, y: 520, width: 80, height: 80)
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 40
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.white.cgColor
        
        // 'profileButton'
        profileButton.backgroundColor = UIColor.clear
        profileButton.frame = CGRect(x: 20, y: 520, width: 80, height: 80)
        profileButton.accessibilityIdentifier = "Profile"
        
        
        // 'cartImageView'
        cartImageView.image = UIImage(named: "whitetrolley")
        cartImageView.frame = CGRect(x: 40, y: 400, width: 40, height: 40)
        cartImageView.backgroundColor = UIColor.clear
        
        // 'cartMenuButton'
        cartMenuButton.frame = CGRect(x: 20, y: 400, width: 160, height: 50)
        cartMenuButton.backgroundColor = UIColor.clear
        cartMenuButton.accessibilityIdentifier = "Cart"
        cartMenuButton.layer.borderColor = UIColor.white.cgColor
        cartMenuButton.layer.borderWidth = 2
        cartMenuButton.layer.cornerRadius = 16
        
        
        
        // 'logOutMenuButton'
        let logOutMenuButtonAT = NSMutableAttributedString(string: "  Log Out  ", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "AvenirNext-Medium", size: 24) as Any])
        logOutMenuButton.setAttributedTitle(logOutMenuButtonAT, for: .normal)
        logOutMenuButton.backgroundColor = UIColor.clear
        logOutMenuButton.layer.cornerRadius = 8
        logOutMenuButton.layer.borderColor = UIColor.white.cgColor
        logOutMenuButton.layer.borderWidth = 2
        logOutMenuButton.frame = CGRect(x: 20, y: 660, width: ((frame.width/2) - 40), height: 40)
        //logOutMenuButton.sizeToFit()
        logOutMenuButton.accessibilityIdentifier = "Logout"
        
        
        /////////////// Add Subviews
        self.addSubview(blurView)
        self.addSubview(navMenuView)
        self.addSubview(closeMenuButton)
        navMenuView.addSubview(homeMenuButton)
        navMenuView.addSubview(birthdayMenuButton)
        navMenuView.addSubview(seasonalMenuButton)
        navMenuView.addSubview(holidayMenuButton)
        navMenuView.addSubview(sportsMenuButton)
        navMenuView.addSubview(congratsMenuButton)
        navMenuView.addSubview(miscMenuButton)
        //navMenuView.addSubview(cartImageView)
        navMenuView.addSubview(cartMenuButton)
        navMenuView.addSubview(profileImage)
        navMenuView.addSubview(profileButton)
        navMenuView.addSubview(logOutMenuButton)
    }
    
    
    
    
}
