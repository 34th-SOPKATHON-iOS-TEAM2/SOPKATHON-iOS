//
//  UILabel+.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by YOUJIM on 5/18/24.
//


import UIKit

extension UILabel {
    func setTextWithLineHeight(text: String?, lineHeight: CGFloat) {
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: (lineHeight - font.lineHeight) * 0.26
            ]
            
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
            self.textAlignment = .center
            self.numberOfLines = 2
        }
    }
    
    /// 특정 Label에 색상 주기
    func asColor(targetString: String, color: UIColor?) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        attributedText = attributedString
    }
    
    func asColors(targetStrings: [String], color: UIColor?) {
        guard let attributedText = attributedText else { return }
        
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedText)
        
        for targetString in targetStrings {
            let range = (mutableAttributedString.string as NSString).range(of: targetString)
            mutableAttributedString.addAttribute(.foregroundColor, value: color ?? textColor, range: range)
        }
        
        self.attributedText = mutableAttributedString
    }
    
    /// 특정 텍스트만 폰트를 다르게 주는 함수
    func asFont(targetString: String, font: UIFont) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.font, value: font, range: range)
        attributedText = attributedString
    }
    
    func asCustomFont(targetString: String, color: UIColor?, font: UIFont) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttribute(.font, value: font, range: range)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        
        attributedText = attributedString
    }
    
    /// 텍스트가 두 줄일 때 각 줄에 폰트, 색상을 다르게 주는 함수
    static func createTwoLineLabel(text: String, firstLineFont: UIFont, firstLineColor: UIColor, secondLineFont: UIFont, secondLineColor: UIColor) -> UILabel {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: text)
        
        let lines = text.components(separatedBy: "\n")
        let firstLineLength = lines.first?.count ?? 3
        
        // 첫 번째 줄 속성 적용
        attributedText.addAttribute(.font, value: firstLineFont, range: NSRange(location: 0, length: firstLineLength))
        attributedText.addAttribute(.foregroundColor, value: firstLineColor, range: NSRange(location: 0, length: firstLineLength))
        
        // 두 번째 줄 속성 적용
        attributedText.addAttribute(.font, value: secondLineFont, range: NSRange(location: firstLineLength, length: text.count - firstLineLength))
        attributedText.addAttribute(.foregroundColor, value: secondLineColor, range: NSRange(location: firstLineLength, length: text.count - firstLineLength))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.3
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        
        label.attributedText = attributedText
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }
    
    func labelWithImage(composition: NSAttributedString...) {
        let attributedString = NSMutableAttributedString()
        for i in composition {
            attributedString.append(i)
        }
        self.attributedText = attributedString
    }
}
