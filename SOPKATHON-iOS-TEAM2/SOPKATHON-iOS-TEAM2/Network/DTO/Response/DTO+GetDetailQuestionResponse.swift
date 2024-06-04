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
        let data : DetailQuestion
    }
}

extension DTO.GetDetailQuestionResponse {
    struct DetailQuestion: Codable {
        let type: Int
        let question: String
        let options: [Option]
        let nextQuestionID: Int

        enum CodingKeys: String, CodingKey {
            case type, question, options
            case nextQuestionID = "nextQuestionId"
        }
    }
}

extension DTO.GetDetailQuestionResponse.DetailQuestion {
    struct Option: Codable {
        let option: String
        let isAnswer: Bool
    }
}
