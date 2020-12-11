//
//  BoredObject.swift
//  JaeWon_TaskMe WatchKit Extension
//
//  Created by Raphael Park on 2020-12-11.
//

import Foundation

struct BoredObject : Decodable {
    var activity : String = ""
    
    init() {
        activity = ""
    }
    
    enum CodingKeys: String, CodingKey {
        case activity = "activity"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.activity = try container.decodeIfPresent(String.self, forKey: .activity) ?? ""
    }
    
    func encode(to encoder: Encoder) throws {
    }
    
}
