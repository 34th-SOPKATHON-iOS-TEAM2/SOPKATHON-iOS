//
//  APITarget+Attempts.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

import Moya

extension APITarget {
    enum Attempts {
        case postCorrectInfo(DTO.PostCorrectInfoRequest)
        case getCorrectInfo(DTO.GetCorrectInfoRequest)
        case getRecordList(DTO.GetRecordListRequest)
    }
}

extension APITarget.Attempts: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .postCorrectInfo:
            return "/attempts"
        case .getCorrectInfo:
            return "/attempts"
        case .getRecordList:
            return "/attempts/logs"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postCorrectInfo:
            return .post
        case .getCorrectInfo:
            return .get
        case .getRecordList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        // 얘 헤더에 멤버 아이디 넣어야 함 1 넣을게 ~
        case .postCorrectInfo(let postCorrectInfoRequest):
            return .requestJSONEncodable(postCorrectInfoRequest)
        case .getCorrectInfo(let getCorrectInfoRequest):
            return .requestParameters(
                parameters: ["date": getCorrectInfoRequest.date],
                encoding: URLEncoding.default
            )
        case .getRecordList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postCorrectInfo:
            return [
                "Content-Type": "application/json",
                "memberId": "1"
            ]
        case .getCorrectInfo(let getCorrectInfoRequest):
            return [
                "Content-Type": "application/json",
                "memberId": "\(getCorrectInfoRequest.memberId)"
            ]
        case .getRecordList(let getRecordListRequest):
            return [
                "Content-Type": "application/json",
                "memberId": "\(getRecordListRequest.memberId)"
            ]
        }
    }
    
}
