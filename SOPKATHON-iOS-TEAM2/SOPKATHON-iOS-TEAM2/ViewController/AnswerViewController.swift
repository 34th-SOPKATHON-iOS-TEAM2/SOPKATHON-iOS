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
    
    private lazy var answerTableView: UITableView = UITableView().then {
        $0.backgroundColor = .black
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setDelegate()
        setConstraint()
    }

    private func setLayout() {
        [
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
        answerTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}


extension AnswerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
}
