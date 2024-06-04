//
//  BaseNetwork.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 이지희 on 6/5/24.
//

import Foundation

import Moya

protocol Networkable {
    var provider: MoyaProvider<MultiTarget> { get }
    func request<T: Decodable>(_ target: TargetType, completion: @escaping (Result<T, Error>) -> Void)
}
