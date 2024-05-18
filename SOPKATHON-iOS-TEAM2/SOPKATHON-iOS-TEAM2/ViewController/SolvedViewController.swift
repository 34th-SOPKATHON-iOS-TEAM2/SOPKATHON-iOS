import UIKit

import Then
import SnapKit

final class SolvedViewController: UIViewController {
    var titleText = ""
    var question =  "모집인원 0명"
    var answer = "1~9명" {
        didSet{
            answerView.set(title: question, des: answer)
        }
    }
    var isShared = false {
        didSet {
            setShareView()
        }
    }
    
    private let backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "이전에 푼 퀴즈"
        $0.numberOfLines = 2
        $0.font = UIFont.font(.pretendardBold, ofSize: 40)
        $0.textColor = .white
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
    
    private let answerView = SharedInstaView(title: "모집인원 0명", description: "1명 - 9명")
    
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
    
    private let sharedView = UIView().then {
        $0.backgroundColor = .doBlack
    }
    
    private let imageview = UIImageView(image: .design3)
    private let logoImageView = UIImageView(image: .frame1171276036)
    
    
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
        view.addSubviews(imageview,
                         backButton,
                         titleLabel,
                         answerView,
                         descriptionView,
                         logoImageView,
                         sharedButton)
        
        
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
        
        answerView.snp.makeConstraints {
            $0.height.equalTo(304)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        descriptionView.snp.makeConstraints {
            $0.top.equalTo(answerView.snp.bottom).offset(10)
            $0.height.equalTo(191)
            $0.leading.trailing.equalToSuperview().inset(22)
        }
        
        sharedButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(descriptionView.snp.bottom).offset(30)
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
        
        imageview.snp.makeConstraints {
            $0.top.equalToSuperview().offset(59)
            $0.trailing.equalToSuperview().offset(100)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(answerView.snp.bottom).offset(68)
            $0.centerX.equalToSuperview()
        }
        
        setShareView()
    }
    
    func setShareView() {
        descriptionView.isHidden = isShared
        sharedButton.isHidden = isShared
        backButton.isHidden = isShared
        imageview.isHidden = !isShared
        logoImageView.isHidden = !isShared
        if isShared {
            titleLabel.text = "너\n이거 알아?"
            answerView.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        }
    }
    
    
    func addTarget () {
        sharedButton.addTarget(self, action: #selector(instagramButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(button), for: .touchUpInside)
    }
    
    func bindData() {
        titleLabel.text = titleText
    }
    
    @objc func button() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func instagramButtonTapped() {
        isShared.toggle()
        setShareView()
        if let storyShareURL = URL(string: "instagram-stories://share?source_application=" + "955820726285983") {
            
            if UIApplication.shared.canOpenURL(storyShareURL) {
                let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
                
                let renderImage = renderer.image { _ in
                    view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
                }
                
                guard let imageData = renderImage.pngData() else {return}
                let pasteboardItems: [String: Any] = [
                    "com.instagram.sharedSticker.backgroundImage": imageData,
                    "com.instagram.sharedSticker.backgroundTopColor": "#222222",
                    "com.instagram.sharedSticker.backgroundBottomColor": "#111111"
                ]
                isShared.toggle()
                titleLabel.text = "이전에 푼 문제"
                answerView.snp.remakeConstraints {
                    $0.height.equalTo(304)
                    $0.top.equalTo(titleLabel.snp.bottom).offset(20)
                    $0.leading.trailing.equalToSuperview().inset(22)
                }
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

