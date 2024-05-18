//
//  DTO+GetCorrectInfoResponse.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

extension DTO {
    struct GetCorrectInfoResponse: Codable {
        let status: Int
        let data: [CorrectInfo]
    }
}

extension DTO.GetCorrectInfoResponse {
    struct CorrectInfo: Codable {
        let questionId: Int
        let question: String
        let isCorrect: Bool
    }
}
