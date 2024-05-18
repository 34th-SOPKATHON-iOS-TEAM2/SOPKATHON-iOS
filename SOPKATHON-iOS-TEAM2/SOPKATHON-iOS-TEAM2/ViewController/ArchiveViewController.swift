//
//  ArchiveViewController.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by YOUJIM on 5/19/24.
//

import UIKit
import SwiftUI

import Then


final class ArchiveViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = UIImageView().then {
        $0.image = .quizListBackground
        $0.contentMode = .scaleAspectFill
    }
    
    private let blueDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 20)
    }
    
    private let blueImageView: UIImageView = UIImageView().then {
        $0.image = .blueSticker
        $0.contentMode = .scaleAspectFit
    }
    
    private let orangeDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 20)
    }
    
    private let orangeImageView: UIImageView = UIImageView().then {
        $0.image = .orangeSticker
        $0.contentMode = .scaleAspectFill
    }
    
    private let greenDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 20)
    }
    
    private let greenImageView: UIImageView = UIImageView().then {
        $0.image = .greenSticker
        $0.contentMode = .scaleAspectFill
    }
    
    private let yellowDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 20)
    }
    
    private let yellowImageView: UIImageView = UIImageView().then {
        $0.image = .yellowSticker
        $0.contentMode = .scaleAspectFill
    }
    
    private let blueRectangleDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 20)
    }
    
    private let blueRectangleImageView: UIImageView = UIImageView().then {
        $0.image = .rectangleBlueSticker
        $0.contentMode = .scaleAspectFill
    }
    
    private let yellowTriangleDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 20)
    }
    
    private let yellowTriangleImageView: UIImageView = UIImageView().then {
        $0.image = .yellowTriangleSticker
        $0.contentMode = .scaleAspectFill
    }
    
    private let greenStarDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .white
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 20)
    }
    
    private let greenStarImageView: UIImageView = UIImageView().then {
        $0.image = .greenStarSticker
        $0.contentMode = .scaleAspectFill
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setConstraint()
    }
    
    private func setHierarchy() {
        [
            backgroundImageView,
            blueImageView,
            blueDateLabel,
            orangeImageView,
            orangeDateLabel,
            greenImageView,
            greenDateLabel,
            yellowImageView,
            yellowDateLabel,
            blueRectangleImageView,
            blueRectangleDateLabel,
            yellowTriangleImageView,
            yellowTriangleDateLabel,
            greenStarImageView,
            greenStarDateLabel
        ].forEach() {
            view.addSubview($0)
        }
    }
    
    private func setConstraint() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        blueImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(195)
            $0.leading.equalToSuperview().offset(140)
            $0.width.equalTo(311)
        }
        
        blueDateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(235)
            $0.leading.equalToSuperview().offset(265)
        }
        
        orangeImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(368)
            $0.trailing.equalToSuperview().inset(175)
            $0.width.equalTo(278)
        }
        
        orangeDateLabel.snp.makeConstraints {
            $0.top.equalTo(orangeImageView).offset(50)
            $0.centerX.equalTo(orangeImageView)
        }
        
        greenImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(637)
            $0.leading.equalToSuperview().offset(134)
            $0.width.equalTo(280)
        }
        
        greenDateLabel.snp.makeConstraints {
            $0.top.equalTo(greenImageView).offset(40)
            $0.centerX.equalTo(greenImageView)
        }
        
        yellowImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(375)
            $0.leading.equalToSuperview().offset(225)
            $0.width.equalTo(165)
        }
        
        yellowDateLabel.snp.makeConstraints {
            $0.top.equalTo(yellowImageView).offset(70)
            $0.centerX.equalTo(yellowImageView)
        }
        
        blueRectangleImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(657)
            $0.leading.equalToSuperview().offset(9)
            $0.width.equalTo(120)
        }
        
        blueRectangleDateLabel.snp.makeConstraints {
            $0.center.equalTo(blueRectangleImageView)
        }
        
        yellowTriangleImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(34)
            $0.leading.equalToSuperview().offset(100)
            $0.width.equalTo(242)
        }
        
        yellowTriangleDateLabel.snp.makeConstraints {
            $0.center.equalTo(yellowTriangleImageView)
        }
        
        greenStarImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(48)
            $0.trailing.equalToSuperview().inset(201)
            $0.width.equalTo(302)
        }
        
        greenStarDateLabel.snp.makeConstraints {
            $0.center.equalTo(greenStarImageView)
        }
    }
}

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = ArchiveViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
