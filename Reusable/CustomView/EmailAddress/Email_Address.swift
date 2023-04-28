//
//  EmailView.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import UIKit

protocol pinViewSetDelegate{
    func setPinView()
}
class Email_Address: UIView {
    @IBOutlet weak var EmailAddressView:UIView!
    @IBOutlet weak var sendPINBtn:UIButton!
    
    let nibName = "Email_Address"
    var delegate:pinViewSetDelegate?
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
    @IBAction func sendPINClicked(_ sender:UIButton){
        delegate?.setPinView()
        sendPINBtn.setTitle("Validate", for: .normal)
//        if sender.isHidden{
//            EmailAddressView.isHidden = true
//        }
//        else{
//
//           // pinView.PINView.isHidden = false
//
//            sendPINBtn.setTitle("Validate", for: .normal)
//        }


    }

   
}
