//
//  SolvedViewModel.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 이지희 on 6/5/24.
//

import Foundation

final class SolvedViewModel {
    var questionTitle: String = "" {
        didSet {
            self.onUpdate?()
        }
    }
    var answerText: String = "" {
        didSet {
            self.onUpdate?()
        }
    }
    var questionDescription: String = "" {
        didSet {
            self.onUpdate?()
        }
    }
    
    var onUpdate: (() -> Void)?
    
    private let networkService: QuestionsNetworkService
    
    init(networkService: QuestionsNetworkService, questionId: Int) {
        self.networkService = networkService
        let memberId = UserDefaults.standard.integer(forKey: "memberID") 
        print(memberId)
        fetchQuestionDescription(questionId: questionId, memberId: memberId)
    }
    
    func fetchQuestionDescription(questionId: Int, memberId: Int) {
        let request = DTO.GetQuestionDescriptionRequest(memberId: memberId, questionId: questionId)
        networkService.getQuestionDescription(requestDTO: request) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    let data = response.data
                    self?.questionTitle = data.question
                    self?.answerText = data.answer
                    self?.questionDescription = data.solution
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
