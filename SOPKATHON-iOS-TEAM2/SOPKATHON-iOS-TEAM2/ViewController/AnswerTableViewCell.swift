//
//  AnswerTableViewCell.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by YOUJIM on 5/18/24.
//

import UIKit

import Then


final class AnswerTableViewCell: UITableViewCell {
    
    static let identifier = "answerTableViewCell"
    
    public let isCorrect: Bool = true
    var word = ""
    var answer = ""
    
    private let backView: UIView = UIView().then {
        $0.backgroundColor = UIColor(hexCode: "000000")
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
    }
    
    private lazy var wordLabel: UILabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardBold, ofSize: 20)
        $0.text = "\(self.word)의 뜻은"
    }
    
    public let statusImageView: UIImageView = UIImageView().then {
        $0.image = .icnCheck
        $0.contentMode = .scaleAspectFit
    }
    
    public lazy var answerLabel: UILabel = UILabel().then {
        $0.font = UIFont.font(.pretendardBold, ofSize: 40)
        $0.textColor = UIColor(hexCode: "0085FF")
        $0.text = answer
    }
    
    private let endLabel: UILabel = UILabel().then {
        $0.font = UIFont.font(.pretendardBold, ofSize: 20)
        $0.textColor = .white
        $0.text = "이다."
    }
    
    private let chevronImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .black
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setHierarchy()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        self.contentView.addSubview(backView)
        [
            wordLabel,
            statusImageView,
            answerLabel,
            endLabel,
            chevronImageView
        ].forEach { backView.addSubview($0) }
    }
    
    private func setConstraint() {
        backView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(108)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        wordLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(36)
        }
        
        statusImageView.snp.makeConstraints {
            $0.top.equalTo(wordLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(21)
            $0.width.height.equalTo(32)
        }
        
        answerLabel.snp.makeConstraints {
            $0.centerY.equalTo(statusImageView)
            $0.leading.equalTo(statusImageView.snp.trailing).offset(4)
            $0.width.equalTo(138)
        }
        
        endLabel.snp.makeConstraints {
            $0.bottom.equalTo(answerLabel.snp.bottom)
            $0.leading.equalTo(answerLabel.snp.trailing).offset(8)
            $0.bottom.equalToSuperview().inset(19)
        }
        
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(26)
            $0.width.height.equalTo(24)
        }
    }
}


extension AnswerTableViewCell {
    func dataBind(_ data: Question) {
        word = data.question
        answer = data.answer[1]
        wordLabel.text = "\(self.word)의 뜻은"
        answerLabel.text = answer
    }
}
