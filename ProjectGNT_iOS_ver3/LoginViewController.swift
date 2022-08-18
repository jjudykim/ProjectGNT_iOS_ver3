//
//  ViewController.swift
//  ProjectGNT_iOS_ver3
//
//  Created by jjudy on 2022/08/03.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    @IBOutlet var mainIcon_ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainIcon_ImageView.image = #imageLiteral(resourceName: "MainIcon")
    }
    
    @IBAction func LoginForKakao(_ sender: UIButton) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    // 기존 사용자일 경우
                    
                    // 기존 사용자가 아닐 경우 회원가입 화면으로 이동
                    guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "signUpVCID") as? SignUpViewController else { return }
                    // 화면 전환 애니메이션 설정
                    signUpVC.modalTransitionStyle = .coverVertical
                    // 전환된 화면이 보여지는 방법 설정 (fullScreen)
                    signUpVC.modalPresentationStyle = .fullScreen
                    self.present(signUpVC, animated: true, completion: nil)
                    
                    _ = oauthToken
                }
            }
    }
    
    @IBAction func LoginForApple(_ sender: UIButton) {
    }
    
}



