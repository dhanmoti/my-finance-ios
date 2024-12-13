//
//  AddExpenseViewModelTests.swift
//  myFinanceTests
//
//  Created by Dhan Moti on 13/12/24.
//

import XCTest
import Combine
@testable import myFinance

final class AddExpenseViewModelTests: XCTestCase {
    var viewModel: AddExpenseViewModel!
    var mockRepository: ExpenseRepositoryMock!

    override func setUp() {
        super.setUp()
        mockRepository = ExpenseRepositoryMock()
        viewModel = AddExpenseViewModel(expenseRepository: mockRepository)
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    func testFetchExpenses() {
        // Given
        let expenses = [
            Expense(amount: 100.0, date: Date(), category: .shopping, description: "Shoes"),
            Expense(amount: 50.0, date: Date(), category: .food, description: "Dinner")
        ]
        mockRepository.expenses = expenses

        // When
        viewModel.fetchExpenses()

        // Then
        XCTAssertTrue(mockRepository.didFetchExpenses)
        XCTAssertEqual(viewModel.expenses, expenses)
    }

    func testAddExpense() {
        // Given
        viewModel.amount = "200"
        viewModel.date = Date()
        viewModel.category = .transport
        viewModel.description = "Taxi"

        // When
        viewModel.addExpense()

        // Then
        XCTAssertTrue(mockRepository.didAddExpense)
        XCTAssertEqual(mockRepository.expenses.count, 1)
        XCTAssertEqual(mockRepository.expenses.first?.amount, 200.0)
        XCTAssertEqual(mockRepository.expenses.first?.category, .transport)
        XCTAssertEqual(mockRepository.expenses.first?.description, "Taxi")
    }

    func testClearFields() {
        // Given
        viewModel.amount = "200"
        viewModel.date = Date()
        viewModel.category = .transport
        viewModel.description = "Taxi"

        // When
        viewModel.clearFields()

        // Then
        XCTAssertEqual(viewModel.amount, "")
        XCTAssertEqual(viewModel.date.timeIntervalSince1970, Date().timeIntervalSince1970, accuracy: 1.0)
        XCTAssertEqual(viewModel.category, .shopping)
        XCTAssertEqual(viewModel.description, "")
    }
}
