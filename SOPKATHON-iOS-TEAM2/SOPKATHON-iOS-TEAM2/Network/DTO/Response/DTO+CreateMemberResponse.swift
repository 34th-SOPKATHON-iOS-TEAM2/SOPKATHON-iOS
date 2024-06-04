//
//  DTO+CreateMemberResponse.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

extension DTO {
    struct CreateMemberResponse: Codable {
        let status: Int
        let data: MemberInfo
    }
}

extension DTO.CreateMemberResponse {
    struct MemberInfo: Codable {
        let id: Int
        let name: String
    }
}
