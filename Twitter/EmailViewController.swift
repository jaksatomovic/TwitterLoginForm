//
//  EmailViewController.swift
//  Twitter
//
//  Created by Jaksa Tomovic on 24/02/17.
//  Copyright © 2017 Jaksa Tomovic. All rights reserved.
//

//
//  RegisterViewController.swift
//  Twitter
//
//  Created by Jaksa Tomovic on 24/02/17.
//  Copyright © 2017 Jaksa Tomovic. All rights reserved.
//


import UIKit
import LBTAComponents

class EmailViewControler : UIViewController {
    
    
    var doneToolbar = UIToolbar()
    
    lazy var infoText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Enter your e-mail address!"
        return label
    }()
    
    lazy var spamText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "we will not send you spam"
        return label
    }()
    
    lazy var privacyText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.text = "With this registration you accept  conditions of services, including cookies. Other user will be abe to find you by your e-amil address or phone number if they are provide"
        return label
    }()
    
    lazy var emailTextField : UITextField = {
        let text = UITextField()
        text.placeholder = "e-mail"
        return text
    }()
    
    
    ///let viewModel : LoginViewModel
    
    //init(mode: LoginViewModel.Mode){
    //    viewModel = LoginViewModel(mode: mode)
    //    super.init(nibName: nil, bundle: nil)
    //}
    
    //required init?(coder aDecoder: NSCoder) {
    //    fatalError("init(coder:) has not been implemented")
    //}
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.tintColor = TwitterConstants.Colors.twitterBlue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewControler.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewControler.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        setupRemainingNavItems()
        
        infoText.frame = CGRect(x: 10, y: 20, width: self.view.frame.size.width-20, height: 40)
        infoText.textAlignment = .left
        spamText.frame = CGRect(x: 10, y: infoText.frame.origin.y+40, width: self.view.frame.size.width-20, height: 15)
        spamText.textAlignment = .left
        emailTextField.frame = CGRect(x: 10, y: 75, width: self.view.frame.size.width-20, height: 40)
        privacyText.frame = CGRect(x: 10, y: emailTextField.frame.origin.y+45, width: self.view.frame.size.width-20, height: 75)
        privacyText.textAlignment = .left
        
        
        let width = CGFloat(1.0)
        let border = CALayer()
        border.borderColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: emailTextField.frame.size.height - width, width:  emailTextField.frame.size.width, height: emailTextField.frame.size.height)
        border.borderWidth = width
        emailTextField.layer.addSublayer(border)
        emailTextField.layer.masksToBounds = true
        
        
        
        
        view.addSubview(infoText)
        view.addSubview(spamText)
        view.addSubview(emailTextField)
        view.addSubview(privacyText)
        
        
        
        setupToolbar()
        
        
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EmailViewControler.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        
        
        
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.doneToolbar.frame.origin.y != (self.view.frame.size.height - keyboardSize.height - 45) {
                self.doneToolbar.frame.origin.y = self.view.frame.size.height - keyboardSize.height - 45
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.doneToolbar.frame.origin.y == (self.view.frame.size.height - keyboardSize.height - 45) {
                self.doneToolbar.frame.origin.y = self.view.frame.size.height - 45
            }
        }
    }
    
    
    private func setupRemainingNavItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparatorView)
        //navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    
    func setupToolbar() {
        doneToolbar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height-110, width: self.view.frame.size.width, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        doneToolbar.barTintColor = .white
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(EmailViewControler.doneButtonAction))
        done.tintColor = TwitterConstants.Colors.twitterBlue
        done.isEnabled = false
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.view.addSubview(doneToolbar)
        //self.usernameTextField.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction() {
        // register user
        // go to next viewcontroller
        
    }
    
    //override var prefersStatusBarHidden: Bool{
    //   return true
    //}
}

