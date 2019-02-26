//
//  BeneficiaryListData.swift
//  smartremit
//
//  Created by Shajedul Islam on 24/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import Foundation

class Benificiary{
    var name: String
    var no_of_trns: Int
    var sent: Double
    
    init(name: String, no_of_trns: Int, sent: Double) {
        self.name = name
        self.no_of_trns = no_of_trns
        self.sent = sent
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getNoOfTrns() -> Int {
        return self.no_of_trns
    }
    
    func getSent() -> Double {
        return self.sent
    }
    
    
}

func getBenList() -> [Benificiary] {
    let myBen1 = Benificiary(name: "Ema", no_of_trns: 1, sent: 3.99)
    let myBen2 = Benificiary(name: "Shila", no_of_trns: 2, sent: 4.92)
    let myBen3 = Benificiary(name: "Neela", no_of_trns: 3, sent: 5.67)
    let myBen4 = Benificiary(name: "Mim", no_of_trns: 4, sent: 7.32)
    
    
    let benfList : [Benificiary] = [myBen1, myBen2, myBen3, myBen4]
    return benfList
}
