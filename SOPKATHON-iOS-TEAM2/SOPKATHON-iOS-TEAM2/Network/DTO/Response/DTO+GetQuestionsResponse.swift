//
//  DTO+GetQuestionsResponse.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

extension DTO {
    struct GetQuestionsResponse: Codable {
        let statusCode: Int
        let data: [Question]
    }
}

extension DTO.GetQuestionsResponse {
    struct Question: Codable {
        let questionId: Int
        let question: String
    }
}
