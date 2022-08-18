//
//  SignUpViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/13.
//

import UIKit
import DropDown

class SignUpViewController: UIViewController {
    
    let dropDown = DropDown()
    @IBOutlet var mainIcon_ImageView: UIImageView!
    @IBOutlet var localSelect_Btn: UIButton!
    @IBOutlet var overlapCheck_Btn: UIButton!
    @IBOutlet var localInput_TF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainIcon_ImageView.image = #imageLiteral(resourceName: "MainIcon")
        setDropDown()
    }
    
    func setDropDown() {
        dropDown.dataSource = [
            "서울특별시"
            ,"대전광역시"
            ,"부산광역시"
            ,"울산광역시"
            ,"인천광역시"
            ,"광주광역시"
            ,"대구광역시"
            ,"경기도"
            ,"경상북도"
            ,"경상남도"
            ,"충청북도"
            ,"충청남도"
            ,"전라북도"
            ,"전라남도"
            ,"강원도"
            ,"세종특별자치시"
            ,"제주특별자치도"]
        dropDown.anchorView = localInput_TF
        dropDown.direction = .bottom
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.width = 300
        dropDown.selectedTextColor = #colorLiteral(red: 0, green: 0.3225597739, blue: 1, alpha: 1)
        dropDown.cellHeight = 50
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            localInput_TF.text = item
            localInput_TF.textColor = UIColor.darkGray
            localSelect_Btn.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
            self.dropDown.clearSelection()
        }
        dropDown.cancelAction = { [weak self] in
            self!.localSelect_Btn.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        }
    }
    
    @IBAction func localSelect_Btn(_ sender: UIButton) {
        dropDown.show()
        localSelect_Btn.setImage(UIImage(systemName: "arrowtriangle.up.fill"), for: .normal)
    }
    
    
}
