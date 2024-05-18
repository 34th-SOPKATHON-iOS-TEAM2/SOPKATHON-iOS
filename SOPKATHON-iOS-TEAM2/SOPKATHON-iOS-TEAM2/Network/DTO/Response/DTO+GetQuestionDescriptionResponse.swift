//
//  DTO+GetQuestionDescriptionResponse.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

extension DTO {
    struct GetQuestionDescriptionResponse: Codable {
        let status: Int
    }
}

extension DTO.GetQuestionDescriptionResponse {
    struct Description: Codable {
        let question: String
        let answer: String
        let solution: String
    }
}
