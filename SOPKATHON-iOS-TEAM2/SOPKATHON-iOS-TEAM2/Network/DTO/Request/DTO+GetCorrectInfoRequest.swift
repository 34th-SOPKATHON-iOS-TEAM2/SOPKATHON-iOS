//
//  DTO+GetCorrectInfoRequest.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

extension DTO {
    struct GetCorrectInfoRequest: Codable {
        let memberId: Int
        let date: String
    }
}
