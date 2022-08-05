//
//  ViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/03.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var mainIcon_ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainIcon_ImageView.image = #imageLiteral(resourceName: "MainIcon")
    }
    
    @IBAction func LoginForKakao(_ sender: UIButton) {
        
    }
    
    @IBAction func LoginForApple(_ sender: UIButton) {
    }
    
}



