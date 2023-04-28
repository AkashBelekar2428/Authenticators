//
//  AuthView.swift
//  Reusable
//
//  Created by Akash Belekar on 26/04/23.
//

import UIKit

protocol UserNamePasswordvalidateBtnDelegate{
    func validate(username:String,password:String,addView:UIViewController)
}

class Username_Password: UIView {
    @IBOutlet weak var usernameLbl:UILabel!
    @IBOutlet weak var tfUsername:UITextField!
    @IBOutlet weak var tfPassword:UITextField!
    @IBOutlet weak var validateBtn:UIButton!
    @IBOutlet weak var eyeImg:UIImageView!
    
    let nibName = "Username_Password"
    var delegate:UserNamePasswordvalidateBtnDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        setBtnStyle()
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    //MARK: Action
    @IBAction func validateBtnAction(_ sender:UIButton){
        if tfUsername.text != "" && tfUsername.text != nil {
            if tfPassword.text != "" && tfPassword.text != ""{
                delegate?.validate(username: tfUsername.text!, password: tfPassword.text!, addView: AuthenticationSuccessfulViewController())
                print("Success")
            }
            else{
                print("Please enter your password")
            }
        }
        else{
            print("Please enter your username")
        }
    }
    
    //MARK: SetButtonStyle
    
    func setBtnStyle(){
        validateBtn.setTitle("Send PIN   -->", for: .normal)
        validateBtn.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 28)
    }
    

}
