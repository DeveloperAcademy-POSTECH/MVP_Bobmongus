//
//  clearButton.swift
//  bobmongus
//
//  Created by Park Kangwook on 2022/04/11.
//

import SwiftUI

struct ClearButton: ViewModifier {
    
    @Binding var text: String
    
    //Why public?
    public func body(content: Content) -> some View {
        
        ZStack(alignment: .trailing) {
            
            content
            
            if !text.isEmpty {
                Button {
                    self.text = ""
                } label: {
                    // Image(systemName: "delete.left")
                    // .foregroundColor(.secondary)
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                    
                }
                .padding(.trailing, 10)
            }
        }
    }
}
