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
    
    var isControlBySegment = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        select_SC.Font = UIFont(name: "GmarketSansTTFMedium", size: 15) ?? UIFont.systemFont(ofSize: 15)
        rankInfo_SV.delegate = self
        addContentScrollView()
        setPageControl()
    }
    
    @IBAction func selectSegmentedControl(_ sender: LGSegmentedControl) {
        guard let segment = select_SC.selectedSegment else { return }
        let selected = segment.title
        var index: Int
        switch selected {
        case "그님티":
            index = 0
        case "지역":
            index = 1
        case "소속":
            index = 2
        default:
            index = -1
        }
        isControlBySegment = true
        rankInfo_SV.setContentOffset(CGPoint(x: rankInfo_SV.frame.width * CGFloat(index), y: 0), animated: true)
        setPageControlSelectedPage(currentPage: index)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = (scrollView.contentOffset.x)/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
        
        // segment로 선택한 것이 아닐 때만 스크롤에 따라서 segmentController의 현재 선택이 변경되도록 설정
        if !isControlBySegment {
            select_SC.selectedIndex = Int(round(value))
        } else if round(value) == value {
            isControlBySegment = false
        }
    }
    
    private func addContentScrollView() {
        for i in 0..<3 {
            // imageView 설정
            let view = UIView()
            let imageSizeWidth = UIImage(named: "rankInfo_main")!.size.width
            let imageSizeHeight = UIImage(named: "rankInfo_main")!.size.height
            let marginOfSV = (self.view.frame.width - rankInfo_SV.frame.width) / 2
            let xPos = rankInfo_SV.frame.width * CGFloat(i) + (rankInfo_SV.frame.width / 2) - (imageSizeWidth / 2) - marginOfSV
            
            view.frame = CGRect(x: xPos, y: 0, width: imageSizeWidth, height: imageSizeHeight)
            view.backgroundColor = UIColor(patternImage: UIImage(named: "rankInfo_main")!)
            
            // imageView에 label 추가 및 설정
            view.addSubview(setLabelForAddImage(view.frame, "소환사명 님은", UIFont(name: "GmarketSansTTFBold", size: 30)!, 0))
            if i == 0 {
                view.addSubview(setLabelForAddImage(view.frame, "그님티의", UIFont(name: "GmarketSansTTFMedium", size: 20)!, 1))
            } else if i == 1 {
                view.addSubview(setLabelForAddImage(view.frame, "지역의", UIFont(name: "GmarketSansTTFMedium", size: 20)!, 1))
            } else if i == 2 {
                view.addSubview(setLabelForAddImage(view.frame, "소속의", UIFont(name: "GmarketSansTTFMedium", size: 20)!, 1))
            }
            
            rankInfo_SV.addSubview(view)
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
    
    private func setLabelForAddImage(_ frame: CGRect, _ text: String, _ font: UIFont, _ line: Int) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: frame.midX, y: 100 * CGFloat(line), width: frame.width, height: frame.height)
        print(label.frame)
        let font = font
        let attributedStr = NSMutableAttributedString(string: text)
        attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: font ?? .init(), range: (text as NSString).range(of: text))
        attributedStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: (text as NSString).range(of: text))
        label.attributedText = attributedStr
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = text
        label.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        print("\(frame.midX), \(100 * CGFloat(line))에 성공적으로 label 세팅!")
        return label
    }
}


