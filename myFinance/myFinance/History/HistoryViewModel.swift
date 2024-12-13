//
//  HistoryViewModel.swift
//  myFinance
//
//  Created by Dhan Moti on 13/12/24.
//

import Foundation

class HistoryViewModel: ObservableObject {
    @Published var expenses: [Expense] = []

    let expenseRepository = ExpenseRepository()

    init() {
        fetchExpenses()
    }

    func fetchExpenses() {
        expenses = expenseRepository.fetchExpenses()
    }
}
