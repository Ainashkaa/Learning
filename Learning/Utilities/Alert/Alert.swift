//
//  Alert.swift
//  Learning
//
//  Created by Ainash Turbayeva on 28.11.2023.
//

import SwiftUI

struct AlertItem: Identifiable, Equatable {
    let id = UUID()
    let message: Text
}

struct AlertContext {
    static let invalidData      = AlertItem(message: Text("The data received from the server is invalid. Please contact support."))
    
    static let invalidResponse  = AlertItem(message: Text("Invalid response from the server. Please try again later or contact support."))
    
    static let invalidURL       = AlertItem(message: Text("There was an issue connecting to the server. If this persists, please contact support."))
    
    
    static let unableToComplete = AlertItem(message: Text("Unable to complete your requests at this time. Please check your internet connection."))
}
