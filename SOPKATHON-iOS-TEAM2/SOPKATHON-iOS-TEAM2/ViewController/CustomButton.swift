//
//  CustomButton.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by Chandrala on 5/19/24.
//

import UIKit

final class CustomButton: UIButton {
    var buttonHeight: CGFloat = 52
    var buttonText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    init(buttonText: String) {
        super.init(frame: .zero)
        setUI()
        self.buttonText = buttonText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomButton {
    func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.setTitle(buttonText, for: .normal)
        self.makeCornerRound(radius: buttonHeight/2)
        self.backgroundColor = UIColor.init(hexCode: "000000")
        self.titleLabel?.font = .font(.pretendardRegular, ofSize: 16)
        self.setTitleColor(.white, for: .normal)
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(buttonHeight)
        }
    }
    
}
