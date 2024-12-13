//
//  AddExpenseViewModel.swift
//  myFinance
//
//  Created by Dhan Moti on 13/12/24.
//

import Foundation

import Foundation

class AddExpenseViewModel: ObservableObject {
    @Published var amount: String = ""
    @Published var date = Date()
    @Published var category: TCategory = .shopping
    @Published var description: String = ""
    @Published var expenses: [Expense] = []

    private let expenseRepository: ExpenseRepository

    init(expenseRepository: ExpenseRepository) {
        self.expenseRepository = expenseRepository
        fetchExpenses()
    }

    func fetchExpenses() {
        expenses = expenseRepository.fetchExpenses()
    }

    func addExpense() {
        guard let amount = Double(amount) else { return }
        let newExpense = Expense(amount: amount, date: date, category: category, description: description)
        expenseRepository.addExpense(expense: newExpense)
        fetchExpenses()
        clearFields()
    }

    func clearFields() {
        amount = ""
        date = Date()
        category = .shopping
        description = ""
    }

    var categories: [TCategory] { TCategory.allCases }
}

