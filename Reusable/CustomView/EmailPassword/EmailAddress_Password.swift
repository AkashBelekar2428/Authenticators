//
//  EmailAddress_Password.swift
//  Reusable
//
//  Created by Akash Belekar on 28/04/23.
//

import UIKit
protocol EmailAddress_PasswordDelegate{
    func validate(username:String,password:String)
}

class EmailAddress_Password: UIView {
    @IBOutlet weak var emailAddressLbl:UILabel!
    @IBOutlet weak var tfEmailAddress:UITextField!
    @IBOutlet weak var tfPassword:UITextField!
    @IBOutlet weak var validateBtn:UIButton!
    @IBOutlet weak var eyeImg:UIImageView!
    
    let nibName = "EmailAddress_Password"
    var delegate:EmailAddress_PasswordDelegate?
    
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
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    @IBAction func validateBtnAction(_ sender:UIButton){
        if tfEmailAddress.text != "" && tfEmailAddress.text != nil {
            if tfPassword.text != "" && tfPassword.text != ""{
                delegate?.validate(username: tfEmailAddress.text!, password: tfPassword.text!)
                print("Success")
            }
            else{
                print("Please enter your password")
            }
        }
        else{
            print("Please enter your EmailAddress")
        }
        
    }
}
    
