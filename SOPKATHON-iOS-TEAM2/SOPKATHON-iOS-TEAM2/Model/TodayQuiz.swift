//
//  TodayQuiz.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

struct TodayQuiz {
    let question: String
    let answer: String
    let isCorrect: Bool
}

extension TodayQuiz {
    static func mock() -> [TodayQuiz] {
        [
            TodayQuiz(question: "모집인원 0명의 뜻은", answer: "1-9명", isCorrect: true),
            TodayQuiz(question: "명일의 뜻은", answer: "오늘", isCorrect: false),
            TodayQuiz(question: "사료하다의 뜻은", answer: "사물을...", isCorrect: false),
            TodayQuiz(question: "심심한 사과의 뜻은", answer: "진심을...", isCorrect: false),
            TodayQuiz(question: "바야흐로의 뜻은", answer: "1-9명", isCorrect: false)
        ]
    }
}
