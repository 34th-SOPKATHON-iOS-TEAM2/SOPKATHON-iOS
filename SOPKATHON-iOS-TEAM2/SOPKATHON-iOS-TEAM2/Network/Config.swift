//
//  Config.swift
//  SOPKATHON-iOS-TEAM2
//
//  Created by 한지석 on 5/16/24.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let metaId = "Meta_id"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist cannot found")
        }
        return dict
    }()
}

extension Config {
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration")
        }
        return key
    }()
    static let Meta_id: String = {
        guard let key = Config.infoDictionary[Keys.Plist.metaId] as? String else {
            fatalError("Meta ID is not set in plist for this configuration")
        }
        return key
    }()
}
