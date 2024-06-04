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
    let questions: [SimpleQuestion] = [
        SimpleQuestion(question: "모집인원 0명의 뜻은", answer: ["0명", "1~6명"]),
        SimpleQuestion(question: "명일의 뜻은", answer: ["그저께", "어제", "오늘", "내일"]),
        SimpleQuestion(question: "사료하다의 뜻은", answer: ["깊이 생각하여 헤아리다.", "사물을 헤아리고 판단하다", "짜거나 엮은 것이 거칠고 성기다", "여럿 가운데서 하나를 구별하여 고르다"]),
        SimpleQuestion(question: "심심한 사과의 뜻은", answer: ["지루한 마음으로 하는 사과", "진심을 다해 간절한 마음으로 하는 사과", "맛이 좋지 않은 사과", "크기가 작은 과일 사과"]),
        SimpleQuestion(question: "바야흐로의 뜻은", answer: ["이제 한창", "최고의 경지에 달한 시기"])
    ]
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
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
        
     //   cell.dataBind(SimpleQuestion[indexPath.row])
        
        if indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 4 {
            cell.answerLabel.textColor = UIColor.doRed
            cell.statusImageView.image = .icnWarning
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: 화면 전환 코드 작성
        let viewModel = SolvedViewModel(networkService: QuestionsNetworkService(), questionId: indexPath.row + 1)
        let solvedViewController = SolvedViewController()
        solvedViewController.viewModel = viewModel
        self.navigationController?.pushViewController(solvedViewController, animated: true)
    }
}
