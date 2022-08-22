//
//  MainViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/19.
//

import UIKit
import LGSegmentedControl

class MainViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var select_SC: LGSegmentedControl!
    @IBOutlet var rankInfo_SV: UIScrollView!
    @IBOutlet var rankInfo_PC: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        select_SC.Font = UIFont(name: "GmarketSansTTFMedium", size: 15) ?? UIFont.systemFont(ofSize: 15)
        rankInfo_SV.delegate = self
        addContentScrollView()
        setPageControl()
    }
    
    @IBAction func selectSegmentedControl(_ sender: LGSegmentedControl) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = (scrollView.contentOffset.x)/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
    private func addContentScrollView() {
        for i in 0..<3 {
            let imageView = UIImageView()
            let imageSizeWidth = UIImage(named: "rankInfo_main")!.size.width
            let imageSizeHeight = UIImage(named: "rankInfo_main")!.size.height
            let marginOfSV = (self.view.frame.width - rankInfo_SV.frame.width) / 2
            let xPos = rankInfo_SV.frame.width * CGFloat(i) + (rankInfo_SV.frame.width / 2) - (imageSizeWidth / 2) - marginOfSV
            imageView.frame = CGRect(x: xPos, y: 0, width: imageSizeWidth, height: imageSizeHeight)
            imageView.image = UIImage(named: "rankInfo_main")
            rankInfo_SV.addSubview(imageView)
            rankInfo_SV.contentSize.width = rankInfo_SV.frame.width * CGFloat(i + 1)
            
        }
    }
    
    private func setPageControl() {
        rankInfo_PC.numberOfPages = 3
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        rankInfo_PC.currentPage = currentPage
        print("현재 페이지 : \(currentPage)")
    }
}
