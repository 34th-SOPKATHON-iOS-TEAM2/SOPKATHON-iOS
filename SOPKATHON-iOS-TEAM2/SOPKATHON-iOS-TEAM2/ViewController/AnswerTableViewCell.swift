//
//  AnswerTableViewCell.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by YOUJIM on 5/18/24.
//

import UIKit

import Then


class AnswerTableViewCell: UITableViewCell {
    
    static let identifier = "answerTableViewCell"
    
    private let problemLabel: UILabel = UILabel().then {
        $0.text = "n번 문제"
        // $0.font =
        $0.textColor = .black
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
    }
    
    private func setLayout() {
        
    }
}


extension AnswerTableViewCell {
    func dataBind(_ data: Data) {
        // TODO: 추후 추가
    }
}
