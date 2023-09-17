//
//  UIApplication+Extension.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 17/09/2023.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
