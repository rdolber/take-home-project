//
//  ErrorMessage.swift
//  Project-Take-Home
//
//  Created by Ray Dolber on 8/27/22.
//

import Foundation

enum ErrorMessage: String {
    case invalidUsername        = "This username created an invalid request. Please Try Again."
    case unableToComplete       = "Unable to complete your request. Please check your internet connection."
    case invalidResponse        = "Invalid response from the server. Please try again."
    case invalidData            = "The data received from the server was invalid. Please Try Again."
}
