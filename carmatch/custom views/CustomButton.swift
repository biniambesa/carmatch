//
//  CustomButton.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/25/22.
//

import SwiftUI

struct CustomButton: View {
    let foreground: Color
    let background: Color
    let fontSize: Int
    let icon: String
    var action: ()->Void
    
    var body: some View{
        Button{
            action()
        }
        label:{
            Image(systemName: icon)
                .foregroundColor(foreground)
                .background(background)
                .font(Font.custom("HelveticaNeue-Bold", size: CGFloat(fontSize)))
                .fontWeight(.light)
        }
    }
}


struct ViewChangeBtn_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(foreground: .red, background: .teal, fontSize: 54, icon: "egg", action: {print("hello")})
    }
}
