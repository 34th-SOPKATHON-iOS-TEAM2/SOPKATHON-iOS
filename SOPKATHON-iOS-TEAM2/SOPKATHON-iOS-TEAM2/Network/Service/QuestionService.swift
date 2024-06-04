//
//  QuestionService.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 이지희 on 6/5/24.
//

import Foundation

import Moya

// MARK: Qusetion
class QuestionsNetworkService: NetworkService<APITarget.Questions> {
    func getQuestions(completion: @escaping (Result<DTO.GetQuestionsResponse, Error>) -> Void) {
        request(.getQuestions, completion: completion)
    }

    func getDetailQuestions(requestDTO: DTO.GetDetailQuestionRequest,
                            completion: @escaping (Result<DTO.GetDetailQuestionResponse, Error>) -> Void) {
        request(.getDetailQuestions(requestDTO), completion: completion)
    }

    func getQuestionDescription(requestDTO: DTO.GetQuestionDescriptionRequest, completion: @escaping (Result<DTO.GetQuestionDescriptionResponse, Error>) -> Void) {
        request(.getQuestionDescrption(requestDTO), completion: completion)
    }
}
