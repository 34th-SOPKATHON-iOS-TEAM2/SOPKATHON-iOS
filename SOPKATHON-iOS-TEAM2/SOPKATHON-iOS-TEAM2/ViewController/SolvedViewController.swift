import UIKit

import Then
import SnapKit

final class SolvedViewController: UIViewController {
    let question =  "모집인원 0명"
    let answer = "1~9명"
    
    private let titleLabel = UILabel().then {
        $0.text = "오늘의 단어"
        $0.textColor = .white
    }
    
    private let answerView = UIView().then {
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 0.3
    }
    
    private let questionLabel = UILabel().then {
        $0.text = "모집인원 0명"
        $0.textColor = .white
    }

    private let label = UILabel().then {
        $0.text = "은"
        $0.textColor = .white
    }
    
    
    private let answerLabel = UILabel().then {
        $0.text = "1~9명"
        $0.textColor = .white
    }
    
    private let endLabel = UILabel().then {
        $0.text = "이다."
        $0.textColor = .white
    }
    
    private let descriptionView = UIView().then {
        $0.backgroundColor = .blue
    }
    
    private let sharedButton = UIButton().then {
        $0.setTitle("공유하기", for: .normal)
        $0.backgroundColor = .white
        $0.setTitleColor(.gray06, for: .normal)
        $0.layer.cornerRadius = 25
    }
    
    private let sharingView = UIView().then {
        $0.backgroundColor = .blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addTarget()
        // Do any additional setup after loading the view.
    }
    
    
    private func setUI() {
        view.backgroundColor = .black
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubviews(titleLabel,
                         sharingView,
                         descriptionView,
                         sharedButton)
        
        sharingView.addSubviews(questionLabel, 
                                label, 
                                answerView,
                                endLabel)
        
        answerView.addSubview(answerLabel)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(26)
        }
        
        sharingView.snp.makeConstraints {
            $0.height.equalTo(304)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        descriptionView.snp.makeConstraints {
            $0.top.equalTo(sharingView.snp.bottom).offset(10)
            $0.height.equalTo(191)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        sharedButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(descriptionView.snp.bottom).offset(30)
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(24)
        }
        
        label.snp.makeConstraints {
            $0.centerY.equalTo(questionLabel.snp.centerY)
            $0.leading.equalTo(questionLabel.snp.trailing).offset(10)
        }
        
        answerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(103)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(78)
            $0.width.equalTo(195)
        }
        
        answerLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        endLabel.snp.makeConstraints {
            $0.top.equalTo(answerView.snp.bottom).offset(24)
            $0.leading.equalTo(answerView.snp.trailing).offset(10)
        }
        
    }
    
    func addTarget () {
        sharedButton.addTarget(self, action: #selector(instagramButtonTapped), for: .touchUpInside)
    }
    
    @objc func instagramButtonTapped() {
        if let storyShareURL = URL(string: "instagram-stories://share?source_application=" + "955820726285983") {
            
            if UIApplication.shared.canOpenURL(storyShareURL) {
                let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
                
                let renderImage = renderer.image { _ in
                    sharingView.drawHierarchy(in: sharingView.bounds, afterScreenUpdates: true)
                }
                
                guard let imageData = renderImage.pngData() else {return}
                let pasteboardItems: [String: Any] = [
                    "com.instagram.sharedSticker.backgroundImage": imageData,
                    "com.instagram.sharedSticker.backgroundTopColor": "#000000",
                    "com.instagram.sharedSticker.backgroundBottomColor": "#111111"
                ]
                let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)]
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                UIApplication.shared.open(storyShareURL, options: [:], completionHandler: nil)
            } else {
                let url = URL(string: "https://apps.apple.com/kr/app/instagram/id389801252")!
                print("엥?")
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

}

