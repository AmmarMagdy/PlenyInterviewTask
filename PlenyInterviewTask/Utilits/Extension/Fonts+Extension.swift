//
//  Fonts+Extension.swift
//  PlenyInterviewTask
//
//  Created by Ammar.M on 14/09/2023.
//

import SwiftUI

extension Font {
    
    enum SFProDisplay {
        case regular
        case medium
        case bold
        
        var value: String {
            switch self {
            case .regular:
                return "SFProDisplay-Regular"
            case .medium:
                return "SFProDisplay-Medium"
            case .bold:
                return "SFProDisplay-Bold"
            }
        }
    }
    
    static func sfProDisplay(_ type: SFProDisplay, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
}
