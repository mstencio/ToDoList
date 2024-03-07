//
//  TLButton.swift
//  toDoList
//
//  Created by Mau on 27/2/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        
        
        Button {
            // Action
            action()
            
        }label: {
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color(.white))
                    .bold()
            }
        }.padding()
   
    }
}

#Preview {
    TLButton(title: "Button", background: .red){
        //Action
    }
}
