//
//  ViewController.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/16/24.
//

import UIKit
import SwiftUI

import Moya
import SnapKit
import Then

/// nicknameViewController
class ViewController: UIViewController {
    private let provider = MoyaProvider<APITarget.Members>(plugins: [MoyaLoggingPlugin()])
    
    let titleLabel = UILabel().then {
        $0.text = "이름을 입력해주세요"
        $0.font = UIFont.font(.pretendardExtraBold, ofSize: 32)
        $0.textColor = .white
    }
    
    let textField = UITextField().then {
        $0.font = UIFont.font(.pretendardMedium, ofSize: 18)
        $0.textColor = .white
        $0.makeCornerRound(radius: 12)
        $0.makeBorder(width: 1, color: .gray01)
        $0.addLeftPadding(24)
    }
    
    let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.font(.pretendardRegular, ofSize: 18)
        $0.backgroundColor = .doBlack
        $0.makeCornerRound(radius: 12)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
        addTarget()
    }
    
    private func setUI() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubviews(titleLabel, textField, nextButton)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            $0.leading.equalToSuperview().offset(20)
            
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(48)
        }
    }
    
    private func addTarget() {
        nextButton.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
    }
    
    private func postNickName(nickName: String) {
        provider.request(.createMember(DTO.CreateMemberRequest(name: nickName))) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(DTO.CreateMemberResponse.self, from: response.data)
                    UserDefaults.standard.setValue(true, forKey: "isLogin")
                    UserDefaults.standard.setValue(response.data.id, forKey: "memberID")
                    
                    self.navigationController?.pushViewController(UIHostingController(rootView: HomeView()), animated: true)
                    self.navigationController?.isNavigationBarHidden = true
                    
                } catch {
                    print("Decoding error: \(error)")
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc
    func tapNextButton() {
        if let nickName = textField.text {
            postNickName(nickName: nickName)
        }
    }

}
