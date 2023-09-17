//
//  ContentView.swift
//  PlenyInterviewTask
//
//  Created by Afnan Hassan on 17/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
    }
    
    init(title: String) {
        self.title = title
    }
}
