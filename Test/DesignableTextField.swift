//
//  DesignableTextField.swift
//  Test
//
//  Created by Bathanti on 8/28/17.
//  Copyright © 2017 Bathanti. All rights reserved.
//

import UIKit
@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var cornerRadius:CGFloat =  0 {
        
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var leftImage :UIImage?{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var leftpadding : CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    
    
    func updateView (){
        if let image = leftImage {
            leftViewMode = .always
            
            let imageview = UIImageView(frame : CGRect(x:leftpadding , y: 0 , width : 20 , height : 20 ))
            imageview.image = image
            imageview.tintColor = tintColor
            var width = leftpadding+20
            if borderStyle == UITextBorderStyle.line || borderStyle == UITextBorderStyle.none{
                
                width = width + 10
            }
            let view = UIView(frame : CGRect(x: 0 , y: 0 , width : width , height : 20))
            view.addSubview(imageview)
            leftView = view
            
            
            
        }
        else
        {
            leftViewMode = .never
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! :  " " , attributes: [NSForegroundColorAttributeName : tintColor])
        
        
    }
    
    

}
