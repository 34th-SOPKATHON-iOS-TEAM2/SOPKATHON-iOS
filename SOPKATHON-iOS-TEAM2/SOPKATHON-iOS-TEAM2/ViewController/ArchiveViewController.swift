//
//  ArchiveViewController.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by YOUJIM on 5/19/24.
//

import UIKit

import Then


final class ArchiveViewController: UIViewController {

    private let scrollView: UIScrollView = UIScrollView()
    
    private let contentView: UIView = UIView()
    
    private let backgroundImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let firstDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let firstImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let secondDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let secondImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let thirdDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let thirdImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let fourthDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let fourthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let fifthDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let fifthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let sixthDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let sixthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let seventhDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let seventhImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let eighthDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let eighthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let ninthDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let ninthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let tenthDateLabel: UILabel = UILabel().then {
        $0.text = "mm/dd"
        $0.textColor = .black
        // $0.font =
    }
    
    private let tenthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setConstraint()
    }
    
    private func setHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [
            firstDateLabel,
            firstImageView,
            secondDateLabel,
            secondImageView,
            thirdDateLabel,
            thirdImageView,
            fourthDateLabel,
            fourthImageView,
            fifthDateLabel,
            fifthImageView,
            sixthDateLabel,
            sixthImageView,
            seventhDateLabel,
            seventhImageView,
            eighthDateLabel,
            eighthImageView,
            ninthDateLabel,
            ninthImageView,
            tenthDateLabel,
            tenthImageView
        ].forEach() {
            contentView.addSubview($0)
        }
    }
    
    private func setConstraint() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
    }
}
