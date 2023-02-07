//
//  SharedSingleton.swift
//  sociomile-sdk-ios
//
//  Created by Meynisa on 01/02/23.
//

import Foundation
import Combine

class SharedSingleton: ObservableObject {
    @Published var fcm: String = ""
    @Published var notif: NSDictionary?
    public init() {
        self.fcm = fcm
    }
}

struct BMI{
    let value: Float
    let advice: String
    let color: String
}

import UIKit

class Dataku{
    var notif: NSDictionary = NSDictionary()
    
    func addFCM(data: NSDictionary){
        self.notif = data
//        showNotification(fcm: data)
    }
}

struct CalculatorBMI{
    var bmi: BMI?
    
    func getBMIValue() -> String{
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(_ weight: Float, _ height: Float) {
            let bmiValue = weight / pow(height, 2)

            if bmiValue < 18.5 {
                bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: "blue")
            } else if bmiValue < 24.9 {
                bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: "green")
            } else {
                bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: "pink")
            }
        }
}

//class NewsModel: ObservableObject {
//  @Published private(set) var notif: NSDictionary?
//
//  func add(_ items: NSDictionary) {
//      self.notif = items
//  }
//}
//
//extension NewsModel {
//  static let shared = mockModel()
//  private static func mockModel() -> NewsModel {
//    let newsModel = NewsModel()
////      newsModel.notif
//    return newsModel
//  }
//}
