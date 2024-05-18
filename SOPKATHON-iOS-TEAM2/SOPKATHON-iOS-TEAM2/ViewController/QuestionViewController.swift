import UIKit
import SnapKit
import Then

struct Question {
    let question: String
    let answer: [String]
}

final class QuestionViewController: UIViewController {
    
    let questions: [Question] = [
        Question(question: "모집인원 0명의 뜻은", answer: ["0명", "1~6명"]),
        Question(question: "명일의 뜻은", answer: ["그저께", "어제", "오늘", "내일"]),
        Question(question: "사료하다의 뜻은", answer: ["깊이 생각하여 헤아리다.", "사물을 헤아리고 판단하다", "짜거나 엮은 것이 거칠고 성기다", "여럿 가운데서 하나를 구별하여 고르다"]),
        Question(question: "심심한 사과의 뜻은", answer: ["지루한 마음으로 하는 사과", "진심을 다해 간절한 마음으로 하는 사과", "맛이 좋지 않은 사과", "크기가 작은 과일 사과"]),
        Question(question: "바야흐로의 뜻은", answer: ["이제 한창", "최고의 경지에 달한 시기"])
    ]

    var index = 0

    private var correctAnswersCount: Int = 0
    
    private let progressBar = UIProgressView(progressViewStyle: .default).then {
        $0.progress = 0.0
        $0.tintColor = .white
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "이거 알아?"
        $0.font = .font(.pretendardBold, ofSize: 40)
        $0.textColor = .white
        $0.textAlignment = .left
    }
    
    private let questionView = UIView().then {
        $0.backgroundColor = UIColor.init(hexCode: "000000")
        $0.makeCornerRound(radius: 20)
    }
    
    private let upperQuestionLabel = UILabel().then {
        $0.text = "모집인원 0명은"
        $0.font = .font(.pretendardSemiBold, ofSize: 24)
        $0.textColor = .white
    }
    
    private let middleQuestionLabel = UILabel().then {
        $0.text = "?????"
        $0.font = .font(.pretendardBold, ofSize: 58)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.backgroundColor = UIColor(hexCode: "#03A864")
        $0.transform = CGAffineTransform(rotationAngle: -4.481 * (.pi / 360))
    }
    
    private let lowerQuestionLabel = UILabel().then {
        $0.text = "이다."
        $0.font = .font(.pretendardSemiBold, ofSize: 24)
        $0.textColor = .white
    }

    private let firstAnswerButton: UIButton = CustomButton(buttonText: "first Answer").then {
        $0.setTitleColor(.white, for: .normal)
    }

    private let secondAnswerButton: UIButton = CustomButton(buttonText: "second Answer").then {
        $0.setTitleColor(.white, for: .normal)

    }

    private let thirdAnswerButton: UIButton = CustomButton(buttonText: "third Answer").then {
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    private let fourthAnswerButton: UIButton = CustomButton(buttonText: "fourth Answer").then {
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    private let nextQuestionButton = UIButton().then {
        $0.setImage(.nextButton, for: .normal)
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }

    private let finishButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexCode: "222222")
        setLayout()
        setStyle()
    }

    private func setStyle() {
        if questions[index].answer.count == 2 {
            firstAnswerButton.do {
                $0.setTitle(questions[index].answer[0], for: .normal)
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
            secondAnswerButton.do {
                $0.setTitle(questions[index].answer[1], for: .normal)
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
            thirdAnswerButton.isHidden = true
            fourthAnswerButton.isHidden = true
        } else {
            thirdAnswerButton.isHidden = false
            fourthAnswerButton.isHidden = false
            firstAnswerButton.do {
                $0.setTitleColor(.white, for: .normal)
                $0.backgroundColor = UIColor(hexCode: "000000")
                $0.layer.borderColor = UIColor.black.cgColor
                $0.layer.borderWidth = 0
                $0.setTitle(questions[index].answer[0], for: .normal)
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
            secondAnswerButton.do {
                $0.setTitleColor(.white, for: .normal)
                $0.backgroundColor = UIColor(hexCode: "000000")
                $0.layer.borderColor = UIColor.black.cgColor
                $0.layer.borderWidth = 0
                $0.setTitle(questions[index].answer[1], for: .normal)
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
            thirdAnswerButton.do {
                $0.setTitleColor(.white, for: .normal)
                $0.backgroundColor = UIColor(hexCode: "000000")
                $0.layer.borderColor = UIColor.black.cgColor
                $0.layer.borderWidth = 0
                $0.setTitle(questions[index].answer[2], for: .normal)
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
            fourthAnswerButton.do {
                $0.setTitleColor(.white, for: .normal)
                $0.backgroundColor = UIColor(hexCode: "000000")
                $0.layer.borderColor = UIColor.black.cgColor
                $0.layer.borderWidth = 0
                $0.setTitle(questions[index].answer[3], for: .normal)
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
        }
    }

    private func setFinishButton() {
        [firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton, nextQuestionButton].forEach {
            $0.isHidden = true
        }
        finishButton.do {
            $0.setTitle("결과 보러 가기", for: .normal)
            $0.backgroundColor = .p500
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 12
        }
        self.view.addSubview(finishButton)
        finishButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(36)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }

    private func setLayout() {
        view.addSubviews(
            progressBar,
            titleLabel,
            questionView,
            firstAnswerButton,
            secondAnswerButton,
            thirdAnswerButton,
            fourthAnswerButton,
            nextQuestionButton
        )
        
        questionView.addSubviews(
            upperQuestionLabel,
            middleQuestionLabel,
            lowerQuestionLabel
        )
        
        progressBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(4)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(progressBar.snp.bottom).offset(66)
            $0.leading.equalToSuperview().offset(20)
        }
        
        questionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(210)
            $0.width.equalTo(335)
        }
        
        upperQuestionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(26)
            $0.leading.equalToSuperview().offset(28)
        }
        
        middleQuestionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(67)
            $0.height.equalTo(78)
            $0.width.equalTo(195)
        }
        
        lowerQuestionLabel.snp.makeConstraints {
            $0.top.equalTo(middleQuestionLabel.snp.bottom).offset(14)
            $0.trailing.equalToSuperview().inset(28)
            $0.bottom.equalToSuperview().inset(26)
        }
        
        firstAnswerButton.snp.makeConstraints {
            $0.top.equalTo(questionView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        secondAnswerButton.snp.makeConstraints {
            $0.top.equalTo(firstAnswerButton.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        thirdAnswerButton.snp.makeConstraints {
            $0.top.equalTo(secondAnswerButton.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        fourthAnswerButton.snp.makeConstraints {
            $0.top.equalTo(thirdAnswerButton.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        nextQuestionButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(36)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(26)
        }
    }
    
    private func updateProgressBar() {
        let progress = Float(correctAnswersCount) / 5.0
        progressBar.setProgress(progress, animated: true)
    }
    
    private func userDidAnswerCorrectly() {
        correctAnswersCount += 1
        updateProgressBar()
    }

    @objc func buttonTapped(_ sender: UIButton) {
        // 선택된 버튼에 대한 스타일 설정
        sender.setTitleColor(.p200, for: .normal)
        sender.backgroundColor = .p400
        sender.layer.borderColor = UIColor.p200.cgColor
        sender.layer.borderWidth = 1

        // 나머지 버튼들의 스타일을 기본 상태로 설정
        [firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton].filter { $0 != sender }.forEach { button in
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(hexCode: "000000")
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 0
        }
    }

    @objc func nextButtonTapped() {
        if index < 4 {
            index += 1
            setStyle()
        } else {
            // PushViewController
            setFinishButton()
        }
    }
}
