//
//  RoundSegmentedControl.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/19.
//

import UIKit

@IBDesignable
class RoundSegmentedControl : UISegmentedControl {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
