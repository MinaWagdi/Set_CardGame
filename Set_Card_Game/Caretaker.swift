//
//  Caretaker.swift
//  Set_Card_Game
//
//  Created by Mina Wagdi  on 5/17/19.
//  Copyright © 2019 Mina Wagdi . All rights reserved.
//

import Foundation

class Caretaker{
    var mementoList = [Memento]()
    
    func add(memento : Memento){
        mementoList.append(memento)
    }
    
    func get(index: Int)->Memento{
        let memento = mementoList[index]
        return memento
    }
    
}
