//
//  Transaction.swift
//  myFinance
//
//  Created by Dhan Moti on 24/11/24.
//

import Foundation

struct Transaction
{
    var amount: Double
    var type: TransactionType
    var datetime: Date
    var description: String?
    var category: TCategory
}

