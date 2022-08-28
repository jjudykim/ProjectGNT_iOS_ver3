//
//  RankingUserTableViewCell.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/29.
//

import UIKit

class RankingUserTableViewCell: UITableViewCell {
    
    @IBOutlet var cellView: UIView!
    @IBOutlet var userRank_IV: UIImageView!
    @IBOutlet var userName_Label: UILabel!
    @IBOutlet var userRank_Label: UILabel!
    @IBOutlet var userRankPoint_Label: UILabel!
    @IBOutlet var userWorL_Label: UILabel!
    @IBOutlet var userWinRate_Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
