//
//  MyPageOptionViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/09/03.
//

import UIKit

class MyPageOptionViewController: UIViewController {
    
    var data: [String] = ["아이디/비밀번호 변경", "이름 변경", "지역 변경", "소속 변경"]
    let textCellIdentifier = "OptionCell"
    @IBOutlet var optionList_TV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        optionList_TV.delegate = self
        optionList_TV.dataSource = self
        optionList_TV.rowHeight = 70
    }
}

extension MyPageOptionViewController : UITableViewDelegate {
    
}

extension MyPageOptionViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.font = UIFont(name: "GmarketSansTTFMedium", size: 20)
        cell.textLabel?.textColor = UIColor.darkGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //클릭한 셀의 이벤트 처리
            tableView.deselectRow(at: indexPath, animated: true)
            
            print("Click Cell Value: " + String(indexPath.row))
        }
}
