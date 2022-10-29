//
//  extensions.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/25/22.
//

import Foundation
import SwiftUI

extension Color {
    static let darkPink = Color(red: 134 / 255, green: 45 / 255, blue: 208 / 255)
}
extension View {
    func underlineTextField() -> some View {
        self
//            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.darkPink)
            .padding(10)
//            .border(.red, width: 3)df
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
