//
//  ViewController.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var containerView:UIView!

    var authSeccess = AuthenticationSuccessfulViewController()
    var usernamePasswordVC = Username_Password()
  //  var emailAddressPasswordVC = EmailAddress_Password()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        authSeccess = AuthenticationSuccessfulViewController.init()
        usernamePasswordVC = Username_Password.init()
     //   emailAddressPasswordVC = EmailAddress_Password.init()
        addUsername_Password()
      //  addEmailAddress_password()
        setViewsOnContainerView()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let frame = containerView.bounds
        self.usernamePasswordVC.frame = frame
        
       // self.emailAddressPasswordVC.frame = frame
    }
    
    func addUsername_Password(){
        usernamePasswordVC.delegate = self
        containerView.addSubview(usernamePasswordVC)
    }
    
//    func addEmailAddress_password(){
//        emailAddressPasswordVC.delegate = self
//        containerView.addSubview(usernamePasswordVC)
//    }
}

//MARK: UserNamePasswordvalidateBtnDelegate
extension ViewController:UserNamePasswordvalidateBtnDelegate{
    func validate(username: String, password: String, addView: UIViewController) {
        usernamePasswordVC.tfUsername.text = username
        usernamePasswordVC.tfPassword.text = password
        authSeccess = addView as! AuthenticationSuccessfulViewController
        addChild(authSeccess)
        view.addSubview(authSeccess.view)
    }
}

//MARK: EmailAddress_PasswordDelegate
//extension ViewController:EmailAddress_PasswordDelegate{
//    func validate(username: String, password: String) {
//        emailAddressPasswordVC.tfEmailAddress.text = username
//        emailAddressPasswordVC.tfPassword.text = password
//    }
    
    
//}
extension ViewController{
    func setViewsOnContainerView() -> UIView{
        if usernamePasswordVC.isHidden == false{
            usernamePasswordVC.usernameLbl.text = "Username"
        }
        else{
            usernamePasswordVC.usernameLbl.text = "EmailAddress"
        }
        return usernamePasswordVC
    }
}

//extension ViewController{
//    enum ViewType{
//        case Username_PasswordView
//        case EmailAddress_PasswordView
//    }
//    func createView(of typeOfView:ViewType) -> UIView{
//        switch typeOfView {
//        case .Username_PasswordView:
//            print("")
//            usernamePasswordVC.usernameLbl.text = "Username"
//            return usernamePasswordVC
//
//        case .EmailAddress_PasswordView:
//            print("")
//            emailAddressPasswordVC.emailAddressLbl.text = "EmailAddress"
//            return usernamePasswordVC
//
//        default :
//            print("not match")
//        }
//    }
//}
