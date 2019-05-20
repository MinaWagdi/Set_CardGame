//
//  NumberOfShapes.swift
//  Set_Card_Game
//
//  Created by Mina Wagdi  on 4/23/19.
//  Copyright © 2019 Mina Wagdi . All rights reserved.
//

import Foundation

enum NumberOfShapes: Int{
    case one = 1
    case two = 2
    case three = 3
    
    static func all () -> [NumberOfShapes]{
        return [.one, .two, .three]
    }
}

enum Shape: String{
    case triangle = " ⃤"
    case circle = " ⃝"
    case rectangle = "⬜️"
    
    static func all () -> [Shape]{
        return [.triangle, .circle, .rectangle]
    }
}

enum Shading{
    case solid
    case shaded
    case open
    
    static func all () -> [Shading]{
        return [.solid, .shaded, .open]
    }
}

enum Color: String{
    case green
    case red
    case blue
    
    static func all () -> [Color]{
        return [.green, .red, .blue]
    }
}
