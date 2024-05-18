//
//  DTO+GetDetailQuestionRequest.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

extension DTO {
    struct GetDetailQuestionRequest: Codable {
        /// Path parameter
        let questionId: Int
    }
}
