//
//  TabsCoordinator.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 16/09/2023.
//

import SwiftUI
import Stinsen

final class TabsCoordinator: NavigationCoordinatable {
   
    var stack = NavigationStack(initial: \TabsCoordinator.start)
    @Root var start = makeStart
    
    func makeStart() -> some View {
        TabsView()
    }
}
