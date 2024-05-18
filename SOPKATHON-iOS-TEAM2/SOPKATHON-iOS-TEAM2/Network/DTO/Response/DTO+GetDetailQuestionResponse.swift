//
//  DTO+GetDetailQuestionResponse.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

extension DTO {
    struct GetDetailQuestionResponse: Codable {
        let status: Int
//        let data
    }
}

extension DTO.GetDetailQuestionResponse {
    struct DetailQuestion: Codable {
        let type: Int
        let question: String
        let options: [Choice]
        let nextQuestionId: Int
    }
}

extension DTO.GetDetailQuestionResponse.DetailQuestion {
    struct Choice: Codable {
        let option: String
        let isAnswer: Bool
    }
}
