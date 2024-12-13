//
//  ExpenseRepository.swift
//  myFinance
//
//  Created by Dhan Moti on 13/12/24.
//

import Foundation

class ExpenseRepository {
    private var expenses: [Expense] = []

    func fetchExpenses() -> [Expense] {
        return expenses
    }

    func addExpense(expense: Expense) {
        expenses.append(expense)
    }
}
