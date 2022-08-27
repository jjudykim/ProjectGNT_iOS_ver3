//
//  PreviousSearchTableViewCell.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/28.
//

import UIKit

class PreviousSearchTableViewCell: UITableViewCell {

    @IBOutlet var cellView: UIView!
    @IBOutlet var userID_Label: UILabel!
    @IBOutlet var userDelete_Btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.backgroundColor = UIColor(patternImage: UIImage(named: "searchBar")!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
