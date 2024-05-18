//
//  APITarget+Questions.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/19/24.
//

import Foundation

import Moya

extension APITarget {
    enum Questions {
        case getQuestions
        case getDetailQuestions(DTO.GetDetailQuestionRequest)
        case getQuestionDescrption(DTO.GetQuestionDescriptionRequest)
    }
}

extension APITarget.Questions: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }

    var path: String {
        switch self {
        case .getQuestions:
            "/questions"
        case .getDetailQuestions:
            "/questions"
        case .getQuestionDescrption(let getQuestionDescriptionRequest):
            "/questions/\(getQuestionDescriptionRequest.questionId)/solution"
        }

    }

    var method: Moya.Method {
        return .get
    }

    var task: Moya.Task {
        switch self {
        case .getQuestions:
            return .requestPlain
        case .getDetailQuestions(let getDetailQuestionRequest):
            return .requestParameters(
                parameters: ["questionId": getDetailQuestionRequest.questionId],
                encoding: URLEncoding.default
            )
        case .getQuestionDescrption:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        switch self {
        case .getQuestions:
            return ["Content-Type": "application/json"]
        case .getDetailQuestions:
            return ["Content-Type": "application/json"]
        case .getQuestionDescrption(let getQuestionDescriptionRequest):
            return [
                "Content-Type": "application/json",
                "memberId": "\(getQuestionDescriptionRequest.memberId)"
            ]
        }

    }
}
