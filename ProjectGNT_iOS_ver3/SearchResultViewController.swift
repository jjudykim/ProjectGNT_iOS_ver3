//
//  SearchResultViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/28.
//

import UIKit
import LGSegmentedControl

class SearchResultViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet var rankTier_SC: LGSegmentedControl!
    @IBOutlet var ranking_SC: LGSegmentedControl!
    @IBOutlet var ranking_SV: UIScrollView!
    
    var isControlBySegment_ranking = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        rankTier_SC.Font = UIFont(name: "GmarketSansTTFMedium", size: 15) ?? UIFont.systemFont(ofSize: 15)
        ranking_SC.Font = UIFont(name: "GmarketSansTTFMedium", size: 15) ?? UIFont.systemFont(ofSize: 15)
        ranking_SV.delegate = self
        addContentScrollView()
    }
    
    @IBAction func selectSegmentedControl(_ sender: LGSegmentedControl) {
       if let segment = ranking_SC.selectedSegment {
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
            isControlBySegment_ranking = true
            ranking_SV.setContentOffset(CGPoint(x: ranking_SV.frame.width * CGFloat(index), y: 0), animated: true)
        } else { return }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = (scrollView.contentOffset.x)/scrollView.frame.size.width
        
        // segment로 선택한 것이 아닐 때만 스크롤에 따라서 segmentController의 현재 선택이 변경되도록 설정
        if !isControlBySegment_ranking {
            ranking_SC.selectedIndex = Int(round(value))
        } else if round(value) == value {
            isControlBySegment_ranking = false
        }
    }
    
    private func addContentScrollView() {
        for i in 0..<3 {
            // imageView 설정
            let view = UIView()
            let imageSizeWidth = UIImage(named: "rankInfo_main")!.size.width
            let imageSizeHeight = UIImage(named: "rankInfo_main")!.size.height
            let marginOfSV = (self.view.frame.width - ranking_SV.frame.width) / 2
            let xPos = ranking_SV.frame.width * CGFloat(i) + (ranking_SV.frame.width / 2) - (imageSizeWidth / 2) - marginOfSV
            
            view.frame = CGRect(x: xPos, y: 0, width: imageSizeWidth, height: imageSizeHeight)
            //view.backgroundColor = UIColor(patternImage: UIImage(named: "rankInfo_main")!)
            view.backgroundColor = UIColor.white
            
            // imageView에 label 추가 및 설정
            view.addSubview(setLabelForAddImage(view.frame, "소환사명 님은", UIFont(name: "GmarketSansTTFBold", size: 30)!, 0))
            if i == 0 {
                view.addSubview(setLabelForAddImage(view.frame, "그님티의", UIFont(name: "GmarketSansTTFMedium", size: 20)!, 1))
            } else if i == 1 {
                view.addSubview(setLabelForAddImage(view.frame, "지역의", UIFont(name: "GmarketSansTTFMedium", size: 20)!, 1))
            } else if i == 2 {
                view.addSubview(setLabelForAddImage(view.frame, "소속의", UIFont(name: "GmarketSansTTFMedium", size: 20)!, 1))
            }
            
            ranking_SV.addSubview(view)
            ranking_SV.contentSize.width = ranking_SV.frame.width * CGFloat(i + 1)
            
        }
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
        
        //print("\(frame.midX), \(100 * CGFloat(line))에 성공적으로 label 세팅!")
        return label
    }

}
