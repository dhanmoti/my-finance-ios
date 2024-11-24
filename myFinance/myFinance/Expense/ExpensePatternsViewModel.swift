//
//  ExpensePatternsViewModel.swift
//  myFinance
//
//  Created by Dhan Moti on 24/11/24.
//

import Foundation
import CoreML

class ExpensePatternsViewModel {
    
    private var transactions: [Transaction]
    init(transactions: [Transaction]) {
        self.transactions = transactions
    }
    
    func analysePatterns() {
        guard !transactions.isEmpty else {
            print("No transactions available for analysis.")
            return
        }
        
        do {
            let model = try KMeansClassifier(configuration: MLModelConfiguration())
            
            // Process each transaction (if you only want one, pick transactions[0])
            for t in transactions {
                // Prepare the input as MLMultiArray
                let inputValue = try MLMultiArray(shape: [3], dataType: .float32)
                inputValue[0] = NSNumber(value: Float(t.amount))
                inputValue[1] = NSNumber(value: Float(t.category.rawValue))
                inputValue[2] = NSNumber(value: Float(t.type.rawValue))
                
                // Create the input object for the model
                let input = KMeansClassifierInput(input: inputValue)
                
                // Make a prediction
                let prediction = try model.prediction(input: input)
                
                // Access the cluster prediction
                print("Transaction \(t) is in Cluster: \(prediction.classLabel)")
            }
        } catch {
            print("Error making prediction: \(error)")
        }
    }
}
