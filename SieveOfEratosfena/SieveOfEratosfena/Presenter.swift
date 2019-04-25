//
//  Presenter.swift
//  SieveOfEratosfena
//
//  Created by Daniil G on 25/04/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation

final class Presenter {
    
    private let model: Model = Model()
    private let cell: Cell = Cell()
    
    func setRange (range: Int?) {
            model.range = range
    }
    
    func findNumbers() {
        updateArrayNumbersInModel()
        
        for index in 2 ..< model.numbers.count {
            var j = index * index
            if(model.numbers[index] == true) {
                while j < model.range! {
                    model.numbers[j] = false
                    j = j + index
                }
            }
        }
    }
    
    func numbersForView() {
        model.numbers[0] = false
        model.numbers[1] = false
        
        updateArrayOutNumbersInModel()
        
        var index = 0
        while index < model.numbers.count {
            if model.numbers[index] {
                model.outNumbers.append(String(index))
            }
            index = index + 1
        }
    }
    
    func returnNumbersCount() -> Int{
        return model.outNumbers.count
    }
    
    func setLabelTextForCell(index: Int) -> String{
        return model.outNumbers[index]
    }
    
    private func updateArrayNumbersInModel(){
        model.numbers = []
        model.numbers = Array(repeating: true, count: model.range!)
    }
    
    func updateArrayOutNumbersInModel(){
         model.outNumbers = []
    }
}
