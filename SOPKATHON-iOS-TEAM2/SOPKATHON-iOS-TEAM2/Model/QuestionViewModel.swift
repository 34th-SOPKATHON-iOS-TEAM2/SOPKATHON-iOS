//
//  SolvedViewModel.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 이지희 on 6/5/24.
//

import Foundation

struct Question {
    let type: Int
    let question: String
    let answer: [Option]
    let nextQuestionID: Int
}

struct Option {
    let option: String
    let isCorrect: Bool
}


final class QuestionViewModel: ObservableObject {
    private let networkService: QuestionsNetworkService
    
    var questions: [Question] = []
    var questionDescription: String = ""
    var errorMessage: String?
    
    init(networkService: QuestionsNetworkService = QuestionsNetworkService()) {
        self.networkService = networkService
    }

    /// 질문 상세 정보 가져오기
    func fetchDetailQuestion(questionId: Int, completion: @escaping () -> Void) {
        let request = DTO.GetDetailQuestionRequest(questionId: questionId)
        networkService.getDetailQuestions(requestDTO: request) { [weak self] result in
            switch result {
            case .success(let response):
                let data = response.data
                let options = data.options.map { option in
                    Option(option: option.option, isCorrect: option.isAnswer)
                }
                self?.questions.append(Question(type: data.type,
                                                question: data.question,
                                                answer: options,
                                                nextQuestionID: data.nextQuestionID))
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
            completion()
        }
    }
}
