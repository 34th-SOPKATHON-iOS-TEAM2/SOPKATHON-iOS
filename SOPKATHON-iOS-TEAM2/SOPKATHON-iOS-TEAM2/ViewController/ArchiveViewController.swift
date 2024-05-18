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
    
    private let firstImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let secondImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let thirdImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let fourthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let fifthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let sixthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let seventhImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let eighthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
    }
    
    private let ninthImageView: UIImageView = UIImageView().then {
        // $0.image =
        $0.contentMode = .scaleAspectFill
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
            firstImageView,
            secondImageView,
            thirdImageView,
            fourthImageView,
            fifthImageView,
            sixthImageView,
            seventhImageView,
            eighthImageView,
            ninthImageView,
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
