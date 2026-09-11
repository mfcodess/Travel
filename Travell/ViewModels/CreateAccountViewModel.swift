//
//  CreateAccountViewModel.swift
//  Travel
//
//  Created by Максим  on 02.09.2026.
//

import SwiftUI
import Combine

//ObservableObject и @Published используются для того, чтобы SwiftUI следил за изменениями данных:

class CreateAccountViewModel: ObservableObject {
    @Published var code1 = ""
    @Published var code2 = ""
    @Published var code3 = ""
    @Published var code4 = ""
    @Published var code5 = ""
    @Published var code6 = ""
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var number = ""
    
    @Published var isChecked = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    var isFormValid: Bool {
        !fullName.isEmpty && !email.isEmpty && !number.isEmpty && !password.isEmpty && isChecked
    }
    
    func validateForm() {
        
        if fullName.isEmpty {
            errorMessage = "Please enter your Name"
            showError = true
        } else if email.isEmpty {
            errorMessage = "Please e nter your email."
            showError = true
        } else if number.isEmpty {
            errorMessage = "Please enter your phone number."
            showError = true
        } else if password.isEmpty {
            errorMessage = "Please enter your password."
            showError = true
        } else if !isChecked {
            errorMessage = "Please accept Terms and Conditions."
            showError = true
        }
        
    }
}

//TextField
//   ↓
//viewModel.fullName изменился
//   ↓
//@Published сообщает SwiftUI:
//"Эй, значение изменилось!"
//   ↓
//View обновляется
