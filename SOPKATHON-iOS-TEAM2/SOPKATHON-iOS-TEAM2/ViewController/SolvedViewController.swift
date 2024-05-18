import UIKit

import Then
import SnapKit

final class SolvedViewController: UIViewController {
    let question =  "모집인원 0명"
    let answer = "1~9명"
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "이전에 푼 퀴즈"
        $0.font = UIFont.font(.pretendardBold, ofSize: 40)
        $0.textColor = .white
    }
    
    private let answerView = UIView().then {
        $0.backgroundColor = .doGreen
        
        $0.transform = CGAffineTransform(rotationAngle: -.pi / 180 * 6)
    }
    
    private let questionLabel = UILabel().then {
        $0.text = "모집인원 0명"
        $0.font = .font(.pretendardBold, ofSize: 40)
        $0.textColor = .white
    }
    
    private let label = UILabel().then {
        $0.text = "은"
        $0.font = .font(.pretendardSemiBold, ofSize: 24)
        $0.textColor = .white
    }
    
    private let answerLabel = UILabel().then {
        $0.text = "1~9명"
        $0.font = .font(.slowFonts, ofSize: 58)
        $0.textColor = .white
    }
    
    private let endLabel = UILabel().then {
        $0.text = "이다."
        $0.textColor = .white
        $0.font = .font(.pretendardSemiBold, ofSize: 24)
    }
    
    private let descriptionView = UIView().then {
        $0.backgroundColor = .black
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    
    private let sharedButton = UIButton().then {
        $0.setTitle("친구에게 자랑하기", for: .normal)
        $0.backgroundColor = .p500
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .font(.pretendardRegular, ofSize: 18)
        $0.layer.cornerRadius = 25
    }
    
    private let sharingView = UIView().then {
        $0.backgroundColor = .black
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    
    private let descriptionTitleLabel = UILabel().then {
        $0.text = "친절한 해설지"
        $0.font = .font(.pretendardSemiBold, ofSize: 24)
        $0.textColor = .white
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "모집인원 0명은 기업에서 해당 분야의 사람을 0~9명까지 채용할 수 있다는 뜻을 가지고 있어."
        $0.font = .font(.pretendardRegular, ofSize: 18)
        $0.textColor = .p200
        $0.numberOfLines = 5
        $0.lineBreakMode = .byClipping
        $0.textAlignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addTarget()
        // Do any additional setup after loading the view.
    }
    
    
    private func setUI() {
        view.backgroundColor = .doBlack
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubviews(backButton,
                         titleLabel,
                         sharingView,
                         descriptionView,
                         sharedButton)
        
        sharingView.addSubviews(questionLabel,
                                label,
                                answerView,
                                endLabel)
        
        answerView.addSubview(answerLabel)
        descriptionView.addSubviews(descriptionTitleLabel,
                                   descriptionLabel)
    }
    
    private func setConstraints() {
        backButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(26)
            
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.trailing).offset(10)
            $0.centerY.equalTo(backButton)
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
            $0.bottom.equalTo(questionLabel.snp.bottom)
            $0.leading.equalTo(questionLabel.snp.trailing).offset(3)
        }
        
        answerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(78.adjusted)
            $0.width.equalTo(195.adjusted)
        }
        
        answerLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        endLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(32)
            $0.trailing.equalToSuperview().inset(34)
        }
        
        descriptionTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(41)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(293)
            $0.top.equalTo(descriptionTitleLabel.snp.bottom).offset(32.adjusted)
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
                    "com.instagram.sharedSticker.backgroundTopColor": "#222222",
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

