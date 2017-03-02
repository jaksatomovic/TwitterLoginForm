//
//  RegisterViewController.swift
//  Twitter
//
//  Created by Jaksa Tomovic on 24/02/17.
//  Copyright © 2017 Jaksa Tomovic. All rights reserved.
//


import UIKit
import LBTAComponents

class RegisterViewControler : UIViewController {
    
    
    var doneToolbar = UIToolbar()
    
    var done = UIBarButtonItem()
    
    lazy var infoText : UILabel = {
        let label = UILabel()
        label.text = "Hello! What is your name?"
        return label
    }()
    
    lazy var fullnameTextField : UITextField = {
        let text = UITextField()
        text.placeholder = "First and Last Name"
        return text
    }()
    
    
    let viewModel : LoginViewModel
    
    init(mode: LoginViewModel.Mode){
        viewModel = LoginViewModel(mode: mode)
            super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        UINavigationBar.appearance().backIndicatorImage = UIImage()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage()
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-15, 0), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.backItem?.title = "Dismiss"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullnameTextField.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewControler.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewControler.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        setupRemainingNavItems()
        
        infoText.frame = CGRect(x: 10, y: 30, width: self.view.frame.size.width-20, height: 40)
        infoText.textAlignment = .left
        fullnameTextField.frame = CGRect(x: 10, y: 75, width: self.view.frame.size.width-20, height: 40)
        
        
        let width = CGFloat(1.0)
        let border = CALayer()
        border.borderColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: fullnameTextField.frame.size.height - width, width:  fullnameTextField.frame.size.width, height: fullnameTextField.frame.size.height)
        border.borderWidth = width
        fullnameTextField.layer.addSublayer(border)
        fullnameTextField.layer.masksToBounds = true
        
        
        
        
        view.addSubview(infoText)
        view.addSubview(fullnameTextField)
        
        
        
        setupToolbar()
        
        fullnameTextField.addTarget(self, action: #selector(self.checkTextField(sender:)), for: .editingChanged);

    
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewControler.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        
        
        
    }
    func checkTextField(sender: UITextField) {
        
        done.isEnabled = sender.hasText

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
    }
    
    
    func setupToolbar() {
        doneToolbar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height-110, width: self.view.frame.size.width, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        doneToolbar.barTintColor = .white
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        done = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(LoginViewControler.doneButtonAction))
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
        // save fullname
        // go to next viewcontroller
        self.navigationController?.pushViewController(EmailViewControler(), animated: false)
        
    }
    
    //override var prefersStatusBarHidden: Bool{
     //   return true
    //}
}

