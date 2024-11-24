//
//  ExpensePatterns.swift
//  myFinance
//
//  Created by Dhan Moti on 16/11/24.
//

import SwiftUI

struct ExpensePatterns: View {
    let vm = ExpensePatternsViewModel(transactions: [Transaction(amount: 1.4, type: .debit, datetime: Date(), category: .transport)])
    
    var body: some View {
        VStack {
            Text("Here we will use CoreML to do unsupervised learning of expense data")
        }
        .onAppear {
            vm.analysePatterns()
        }
    }
}

struct ExpensePatterns_Previews: PreviewProvider {
    static var previews: some View {
        ExpensePatterns()
    }
}
