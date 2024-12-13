//
//  AddExpenseView.swift
//  myFinance
//
//  Created by Dhan Moti on 13/12/24.
//

import SwiftUI

struct AddExpenseView: View {
    @StateObject var viewModel: AddExpenseViewModel

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Enter Spending Details")) {
                        TextField("Amount", text: $viewModel.amount)
                            .keyboardType(.decimalPad)

                        DatePicker("Date", selection: $viewModel.date, displayedComponents: [.date, .hourAndMinute])

                        Picker("Category", selection: $viewModel.category) {
                            ForEach(viewModel.categories, id: \.self) { category in
                                Text(category.description)
                            }
                        }

                        TextField("Description", text: $viewModel.description)
                    }

                    HStack {
                        Button(action: viewModel.addExpense) {
                            Text("Add")
                        }
                        Spacer()
                        Button(action: viewModel.clearFields) {
                            Text("Clear")
                        }
                    }
                    
                }

                List(viewModel.expenses) { expense in
                    VStack(alignment: .leading) {
                        Text("\(expense.amount, specifier: "%.2f")")
                            .font(.headline)
                        Text(expense.date, style: .date)
                        Text(expense.category.description)
                        Text(expense.description)
                    }
                }
            }
            .navigationTitle("Expense Tracker")
        }
    }
}
