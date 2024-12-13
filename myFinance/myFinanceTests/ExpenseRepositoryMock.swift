//
//  ExpenseRepositoryMock.swift
//  myFinanceTests
//
//  Created by Dhan Moti on 13/12/24.
//

import Foundation
@testable import myFinance

class ExpenseRepositoryMock: ExpenseRepository {
    var expenses: [Expense] = []
    var didFetchExpenses = false
    var didAddExpense = false

    override func fetchExpenses() -> [Expense] {
        didFetchExpenses = true
        return expenses
    }

    override func addExpense(expense: Expense) {
        didAddExpense = true
        expenses.append(expense)
    }
}

