//
//  Expense.swift
//  myFinance
//
//  Created by Dhan Moti on 13/12/24.
//

import Foundation

struct Expense: Identifiable, Codable, Equatable {
    var id = UUID()
    var amount: Double
    var date: Date
    var category: TCategory
    var description: String
}
