//
//  Category.swift
//  myFinance
//
//  Created by Dhan Moti on 24/11/24.
//

import Foundation
enum TCategory: Int, Codable, CaseIterable{
    case shopping = 1
    case transport = 2
    case food = 3
    case other = 4
    
    var description: String {
        switch self {
            case .shopping: return "Shopping"
            case .transport: return "Transport"
            case .food: return "Food"
            case .other: return "Other"
        }
    }
}
