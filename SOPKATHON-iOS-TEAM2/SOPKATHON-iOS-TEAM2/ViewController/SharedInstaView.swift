//
//  SharedInstaView.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 이지희 on 5/19/24.
//

import UIKit

final class SharedInstaView: UIView {
    private var title = ""
    private var subTitle = ""
    
    private let answerView = UIView().then {
        $0.backgroundColor = .doGreen
        
        $0.transform = CGAffineTransform(rotationAngle: -.pi / 180 * 6)
    }
    
    private let questionLabel = UILabel().then {
        $0.text = "모집인원 0명"
        $0.font = .font(.pretendardBold, ofSize: 40)
        $0.textColor = .white
    }
    
    private let label = UILabel().then {
        $0.text = "은"
        $0.font = .font(.pretendardSemiBold, ofSize: 24)
        $0.textColor = .white
    }
    
    private let answerLabel = UILabel().then {
        $0.text = "1~9명"
        $0.font = .font(.slowFonts, ofSize: 58)
        $0.textColor = .white
    }
    
    private let endLabel = UILabel().then {
        $0.text = "이다."
        $0.textColor = .white
        $0.font = .font(.pretendardSemiBold, ofSize: 24)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(title: String, description: String) {
        super.init(frame: .zero)
        self.title = title
        self.subTitle = description
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
        self.backgroundColor = .black
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        
        self.addSubviews(questionLabel,
                                label,
                                answerView,
                                endLabel)
        
        answerView.addSubview(answerLabel)
    }
    
    private func setConstraints() {
        questionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(24)
        }
        
        label.snp.makeConstraints {
            $0.bottom.equalTo(questionLabel.snp.bottom)
            $0.leading.equalTo(questionLabel.snp.trailing).offset(3)
        }
        
        answerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(78.adjusted)
            $0.width.equalTo(195.adjusted)
        }
        
        answerLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        endLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(32)
            $0.trailing.equalToSuperview().inset(34)
        }
        
    }
}
