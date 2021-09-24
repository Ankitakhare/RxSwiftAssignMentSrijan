//
//  FieldViewModel.swift
//  Assignment
//
//  Created by ankita khare on 23/09/21.
//

import Foundation
// FieldViewModel
protocol VSFieldViewModel {
    var title: String { get}
    var errorMessage: String { get }

    // Observables
    var value: Variable<String> { get set }
    var errorValue: Variable<String?> { get}

    // Validation
    func validate() -> Bool
}

extension VSFieldViewModel {
    func validateSize(_ value: String, size: (min:Int, max:Int)) -> Bool {
        return (size.min...size.max).contains(value.count)
    }
    func validateString(_ value: String?, pattern: String) -> Bool {
        let test = NSPredicate(format:"SELF MATCHES %@", pattern)
        return test.evaluate(with: value)
    }
}
