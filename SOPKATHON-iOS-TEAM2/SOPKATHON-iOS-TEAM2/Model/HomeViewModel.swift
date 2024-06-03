//
//  HomeViewModel.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 이지희 on 6/4/24.
//

import SwiftUI

import Moya


class HomeViewModel: ObservableObject {
    @State var homeQuestions: [DTO.GetQuestionsResponse.Question] = []
    
    func getQuestionHome() {
        Providers.questionProvier.request(.getQuestions) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(DTO.GetQuestionsResponse.self, from: response.data)
                    self.homeQuestions = response.data
                } catch {
                    print("Decoding error: \(error)")
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
