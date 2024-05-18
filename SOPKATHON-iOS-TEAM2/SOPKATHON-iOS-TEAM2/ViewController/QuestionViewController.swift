import UIKit
import SnapKit
import Then
import SwiftUI

final class QuestionViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "너 이거 알아?"
        $0.font = .font(.pretendardBold, ofSize: 40)
        $0.textAlignment = .left
    }
    
    private let questionView = UIView().then {
        $0.backgroundColor = .white
        $0.makeCornerRound(radius: 20)
    }
    
    private let firstAnswerButton = CustomButton(buttonText: "first Answer")
    
    private let secondAnswerButton = CustomButton(buttonText: "second Answer")
    
    private let thirdAnswerButton = CustomButton(buttonText: "third Answer")
    
    private let fourthAnswerButton = CustomButton(buttonText: "fourth Answer")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        view.addSubviews(titleLabel, questionView, firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        questionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(210)
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
    }
}

//struct PreView: PreviewProvider {
//    static var previews: some View {
//        QuestionViewController().toPreview()
//    }
//}
//
//#if DEBUG
//extension UIViewController {
//    private struct Preview: UIViewControllerRepresentable {
//        let viewController: UIViewController
//        
//        func makeUIViewController(context: Context) -> UIViewController {
//            return viewController
//        }
//        
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        }
//    }
//    
//    func toPreview() -> some View {
//        Preview(viewController: self)
//    }
//}
//#endif
