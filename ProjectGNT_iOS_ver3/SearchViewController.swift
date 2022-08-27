//
//  SearchViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/19.
//

import UIKit

class SearchViewController: UIViewController {
    
    var data: [String] = ["user1", "user2", "user3", "user4", "user5"]
    let textCellIdentifier = "PreviousSearchCell"
    @IBOutlet var previousSearchUser_TV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        previousSearchUser_TV.delegate = self
        previousSearchUser_TV.dataSource = self
    }
}

extension SearchViewController : UITableViewDelegate {
    
}

extension SearchViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 테이블뷰의 데이터를 뿌려주는 함수
        let cell: PreviousSearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! PreviousSearchTableViewCell
        
        cell.userID_Label.text = data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //클릭한 셀의 이벤트 처리
            tableView.deselectRow(at: indexPath, animated: true)
            
            print("Click Cell Value: " + String(indexPath.row))
        }
}
