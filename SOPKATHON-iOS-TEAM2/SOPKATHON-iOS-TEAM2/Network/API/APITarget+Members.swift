//
//  APITarget+Members.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

import Moya

extension APITarget {
    enum Members {
        case createMember(DTO.CreateMemberRequest)
    }
}

extension APITarget.Members: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL + "/members")!
    }
    
    var path: String {
        ""
    }
    
    var method: Moya.Method {
        .post
    }
    
    var task: Moya.Task {
        switch self {
        case .createMember(let createMemberRequest):
            return .requestJSONEncodable(createMemberRequest)
        }
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
