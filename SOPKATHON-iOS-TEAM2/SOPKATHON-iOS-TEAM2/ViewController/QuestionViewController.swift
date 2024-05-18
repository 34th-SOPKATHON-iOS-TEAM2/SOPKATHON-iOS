import UIKit
import SnapKit
import Then

final class QuestionViewController: UIViewController {
    
    private var correctAnswersCount: Int = 0
    
    private let progressBar = UIProgressView(progressViewStyle: .default).then {
        $0.progress = 0.0
        $0.tintColor = .white
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "너 이거 알아?"
        $0.font = .font(.pretendardBold, ofSize: 40)
        $0.textColor = .white
        $0.textAlignment = .left
    }
    
    private let questionView = UIView().then {
        $0.backgroundColor = .white
        $0.makeCornerRound(radius: 20)
    }
    
    private let upperQuestionLabel = UILabel().then {
        $0.text = "모집인원 0명은"
        $0.font = .font(.pretendardSemiBold, ofSize: 20)
        $0.textColor = .black
    }
    
    private let middleQuestionLabel = UILabel().then {
        $0.text = " "
        $0.font = .font(.pretendardSemiBold, ofSize: 20)
        $0.textColor = .black
        $0.backgroundColor = .gray02
    }
    
    private let lowerQuestionLabel = UILabel().then {
        $0.text = "이다."
        $0.font = .font(.pretendardSemiBold, ofSize: 20)
        $0.textColor = .black
    }
    
    private let firstAnswerButton = CustomButton(buttonText: "first Answer")
    
    private let secondAnswerButton = CustomButton(buttonText: "second Answer")
    
    private let thirdAnswerButton = CustomButton(buttonText: "third Answer")
    
    private let fourthAnswerButton = CustomButton(buttonText: "fourth Answer")
    
    private let nextQuestionButton = UIButton().then {
        $0.backgroundColor = .white
        $0.
        $0.makeCornerRound(radius: 13)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setLayout()
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
        }
        
        upperQuestionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(53)
        }
        
        middleQuestionLabel.snp.makeConstraints {
            $0.top.equalTo(upperQuestionLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(52)
            $0.trailing.equalToSuperview().inset(52)
            $0.height.equalTo(50)
            $0.width.equalTo(200)
        }
        
        lowerQuestionLabel.snp.makeConstraints {
            $0.top.equalTo(middleQuestionLabel.snp.bottom).offset(14)
            $0.trailing.equalToSuperview().inset(52)
            $0.bottom.equalToSuperview().inset(40)
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
            $0.top.equalTo(fourthAnswerButton.snp.bottom).offset(20)
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
}
