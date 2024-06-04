//
//  HomeViewModel.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 이지희 on 6/4/24.
//

import SwiftUI

import Moya


final class HomeViewModel: ObservableObject {
    @State var homeQuestions: [DTO.GetQuestionsResponse.Question] = []
    private let networkService: QuestionsNetworkService
    
    init(networkService: QuestionsNetworkService = QuestionsNetworkService()) {
        self.networkService = networkService
        self.fetchQuestions(completion: {  })
    }

    
    /// 질문 목록 가져오기
    func fetchQuestions(completion: @escaping () -> Void) {
        networkService.getQuestions { [weak self] result in
            switch result {
            case .success(let response):
                response.data.forEach { question in
                    
                }
            case .failure(let error):
                print(error)
            }
            completion()
        }
    }
}
