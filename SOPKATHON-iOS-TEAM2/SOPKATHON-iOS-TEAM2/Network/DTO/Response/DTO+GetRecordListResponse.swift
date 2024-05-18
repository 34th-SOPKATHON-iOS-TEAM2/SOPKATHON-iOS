//
//  DTO+GetRecordListResponse.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

extension DTO {
    struct GetRecordListResponse: Codable {
        let status: Int
    }
}

extension DTO.GetRecordListResponse {
    struct RecordList: Codable {
        let date: String
        let pass: Bool
    }
}
