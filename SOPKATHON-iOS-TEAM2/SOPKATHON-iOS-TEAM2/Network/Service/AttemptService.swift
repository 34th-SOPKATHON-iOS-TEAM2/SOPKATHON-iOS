//
//  AttemptService.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 이지희 on 6/5/24.
//

import Foundation

import Moya

// MARK: Attempt
class AttemptNetworkService: NetworkService<APITarget.Attempts> {
    
    func posetCorrectInfo(requestDTO: DTO.PostCorrectInfoRequest, completion: @escaping (Result<DTO.PostCorrectInfoResponse, Error>) -> Void) {
        request(.postCorrectInfo(requestDTO), completion: completion)
    }

    
    func getCorrectInfo(requestDTO: DTO.GetCorrectInfoRequest, completion: @escaping (Result<DTO.GetCorrectInfoResponse, Error>) -> Void) {
        request(.getCorrectInfo(requestDTO),completion: completion)
    }
    
    func getRecordList(requestDTO: DTO.GetRecordListRequest, completion: @escaping (Result<DTO.GetRecordListResponse, Error>) -> Void) {
        request(.getRecordList(requestDTO), completion: completion)
    }
}

