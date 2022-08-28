//
//  RankingViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/19.
//

import UIKit

class RankingViewController: UIViewController {
    
    var data_userName: [String] = ["user1", "user2", "user3", "user4", "user5"]
    let textCellIdentifier = "RankingUserCell"
    @IBOutlet var rankingUser_TV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        rankingUser_TV.delegate = self
        rankingUser_TV.dataSource = self
    }
}

extension RankingViewController : UITableViewDelegate {
    
}

extension RankingViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data_userName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 테이블뷰의 데이터를 뿌려주는 함수
        let cell: RankingUserTableViewCell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! RankingUserTableViewCell
        
        cell.userName_Label.text = data_userName[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //클릭한 셀의 이벤트 처리
            tableView.deselectRow(at: indexPath, animated: true)
            
            print("Click Cell Value: " + String(indexPath.row))
        }
}
