//
//  ViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {
    
    var time: Float = 0.0
    var timer: Timer?

    @IBOutlet var mainIconImageView: UIImageView!
    @IBOutlet var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 이미지 뷰 -> mainIcon으로 변경
        mainIconImageView.image = UIImage(named: "MainIcon.png")
        
        // 프로그레스 뷰 -> 0.1로 셋팅
        progressView.progress = 0.1
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
    }
    
    @objc func setProgress() {
        time += 0.1
        progressView.setProgress(time, animated: true)
        if time >= 0.9 {
            timer!.invalidate()
        }
    }
}



