//
//  Color-Theme.swift
//  Moonshot
//
//  Created by  He on 2026/1/17.
//

import SwiftUI

extension ShapeStyle where Self == Color {//当 ShapeStyle 的具体类型是 Color 的时候，给它加这些静态属性
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
