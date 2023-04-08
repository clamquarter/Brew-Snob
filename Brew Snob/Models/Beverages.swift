//
//  Coffees.swift
//  Brew Snob
//
//  Created by India Doria on 12/15/22.
//

import Foundation
import SwiftUI

//the struct CoffeeMethod will be the basis for all coffee brewing instructions. i chose struct so that each instance could remain independent. water temp

struct BrewMethod: Identifiable {
    let name: String
    let image: String
    let waterTemp: Int //water temp will be Celsius by default and later converted for Imperial system losers. *ahem, users.
    var waterRatio: Double //waterRatio is the amount of tea or coffee grounds to water in grams. for coffee, this will be water. for tea, this will be amount of tea in grams.
    var time: Int //time will be measured in seconds and displayed to the user in minutes
    var grindSize: GrindSize?
    var teaAmount: Double? //tea amount is the amount of tea per 8 oz/227 g
    var id = UUID()
}

//the GrindSize enum is the setup for a future feature where the app will give grind size suggestions for users that are grinding their own beans.
enum GrindSize {
    case fine, medium, coarse
}

//the methods array is an array of CoffeeMethod instances.
var coffees = [
    BrewMethod(name: "french press", image: "frenchpress", waterTemp: 93, waterRatio: 12, time: 240), BrewMethod(name: "moka pot", image: "mokapot", waterTemp: 100, waterRatio: 12, time: 300)
    //the below instances are simply testing the lazy grid
, BrewMethod(name: "test", image: "mokapot", waterTemp: 93, waterRatio: 12, time: 300), BrewMethod(name: "test", image: "mokapot", waterTemp: 93, waterRatio: 12, time: 300), BrewMethod(name: "test", image: "frenchpress", waterTemp: 93, waterRatio: 12, time: 300), BrewMethod(name: "test", image: "mokapot", waterTemp: 93, waterRatio: 12, time: 300)]

var teas = [
    BrewMethod(name: "chai", image: "chai", waterTemp: 100, waterRatio: 2.3, time: 600)
    //the below instances are simply testing the lazy grid
    , BrewMethod(name: "test", image: "chai", waterTemp: 93, waterRatio: 12, time: 300), BrewMethod(name: "test", image: "chai", waterTemp: 93, waterRatio: 12, time: 300), BrewMethod(name: "test", image: "chai", waterTemp: 93, waterRatio: 12, time: 300), BrewMethod(name: "test", image: "chai", waterTemp: 93, waterRatio: 12, time: 300), BrewMethod(name: "test", image: "chai", waterTemp: 93, waterRatio: 12, time: 300)]
