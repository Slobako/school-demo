//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func findRandomIndexForMaxValue(sampleArray: [Int]) {
    
    var maxCount = 0
    var maxValue = 0
    for i in 0..sampleArray.count {
        if sampleArray[i] > maxValue {
            maxValue = sampleArray[i]
            maxCount = 1
        } else if sampleArray[i] == maxValue {
            maxCount += 1
        }
    }
    
}
