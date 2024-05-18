//
//  AnswerViewController.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by YOUJIM on 5/18/24.
//

import UIKit

import SnapKit
import Then

final class AnswerViewController: UIViewController {
    
    private let todayWordLabel: UILabel = UILabel().then {
        $0.font = UIFont.font(.pretendardBold, ofSize: 40)
        $0.text = "오늘의 단어"
        $0.textColor = .white
    }
    
    private lazy var answerTableView: UITableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        $0.isScrollEnabled = false
        $0.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.identifier)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setDelegate()
        setConstraint()
    }

    private func setHierarchy() {
        view.backgroundColor = UIColor(hexCode: "222222")
        
        [
            todayWordLabel,
            answerTableView
        ].forEach() {
            view.addSubview($0)
        }
    }
    
    private func setDelegate() {
        answerTableView.delegate = self
        answerTableView.dataSource = self
    }
    
    private func setConstraint() {
        todayWordLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.leading.equalToSuperview().offset(20)
        }
        
        answerTableView.snp.makeConstraints {
            $0.top.equalTo(todayWordLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(68)
        }
    }
}


extension AnswerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell else { return UITableViewCell() }
        
        // cell.dataBind(<#T##data: Data##Data#>)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: 화면 전환 코드 작성
    }
}
