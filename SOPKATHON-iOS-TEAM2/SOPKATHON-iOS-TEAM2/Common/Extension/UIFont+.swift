//
//  UIFont+.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by YOUJIM on 5/19/24.
//

import UIKit
import SwiftUI


enum FontName: String {
    case pretendardExtraBold = "Pretendard-ExtraBold"
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"

    case slowFonts = "NanumNeuRisNeuRisCe"

    case applegothicRegular = "AppleSDGothicNeo-Regular"
    case applegothicThin = "AppleSDGothicNeo-Thin"
    case applegothicLight = "AppleSDGothicNeo-Light"
    case applegothicMedium = "AppleSDGothicNeo-Medium"
    case applegothicSemibold = "AppleSDGothicNeo-SemiBold"
    case applegothicBold = "AppleSDGothicNeo-Bold"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: style.rawValue, size: size)
        else {
            print("Failed to load the \(style.rawValue) font. Return system font instead.")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
}

extension Font {
    static func custom(_ style: FontName, ofSize size: CGFloat) -> Font {
        return custom(style.rawValue, size: size)
    }
}

