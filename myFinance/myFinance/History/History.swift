//
//  History.swift
//  myFinance
//
//  Created by Dhan Moti on 16/11/24.
//

import SwiftUI

struct History: View {
    @StateObject private var viewModel = HistoryViewModel()
    @State private var showingAddExpenseView = false

    var body: some View {
        NavigationView {
            List(viewModel.expenses) { expense in
                VStack(alignment: .leading) {
                    Text("\(expense.amount, specifier: "%.2f")")
                        .font(.headline)
                    Text(expense.date, style: .date)
                    Text(expense.category.description)
                    Text(expense.description)
                }
            }
            .navigationTitle("Expense History")
            .navigationBarItems(trailing: Button(action: {
                showingAddExpenseView = true
            }) {
                Image(systemName: "plus.app")
                    .imageScale(.large)
            })
            .sheet(isPresented: $showingAddExpenseView) {
                AddExpenseView(viewModel: AddExpenseViewModel(expenseRepository: viewModel.expenseRepository))
            }
            .onAppear {
                viewModel.fetchExpenses()
            }
        }
        
        
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
