//
//  BrewSelectionViewModel.swift
//  Brew Snob
//
//  Created by India Doria on 4/8/23.
//

import Foundation
class BrewSelectionViewModel: ObservableObject {
    @Published var brewSelection: Bool = true
    
var beverages: [BrewMethod] {
    if brewSelection {
        return coffees
    } else {
        return teas
    }
}
}
