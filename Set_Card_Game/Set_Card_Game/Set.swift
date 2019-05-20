//
//  Set.swift
//  Set_Card_Game
//
//  Created by Mina Wagdi  on 4/23/19.
//  Copyright © 2019 Mina Wagdi . All rights reserved.
//

import Foundation

struct Set{
    var card1: (card:Card?,IndexOfCardInGameCardArray:Int?)
    var card2: (card:Card?,IndexOfCardInGameCardArray:Int?)
    var card3: (card:Card?,IndexOfCardInGameCardArray:Int?)
    
    func isSet()-> Bool{
        if Card.AllSameOrDifferentColor(card1: self.card1.card!, card2: self.card2.card!, card3: self.card3.card!) && Card.AllSameOrDifferentShape(card1: self.card1.card!, card2: self.card2.card!, card3: self.card3.card!) && Card.AllSameOrDifferentShading(card1: self.card1.card!, card2: self.card2.card!, card3: self.card3.card!) && Card.AllSameOrDifferentNumberOfShapes(card1: self.card1.card!, card2: self.card2.card!, card3: self.card3.card!){
            
            return true
        }
        return false
    }
    
    mutating func CancelCard(card: Card, index: Int){
        if(card == card1.card && index == card1.IndexOfCardInGameCardArray){
            card1.card = nil
            card1.IndexOfCardInGameCardArray=nil
        }else if card == card2.card{
            card2.card = nil
            card2.IndexOfCardInGameCardArray=nil
        }else if card == card3.card{
            card3.card=nil
            card3.IndexOfCardInGameCardArray=nil
        }
    }
    
    mutating func CancelAllCardsinSet(){
        card1.card = nil
        card1.IndexOfCardInGameCardArray=nil
        card2.card = nil
        card2.IndexOfCardInGameCardArray=nil
        card3.card=nil
        card3.IndexOfCardInGameCardArray=nil
    }
    
    mutating func addCard(card:Card, index: Int){
        if card1.card==nil && card1.IndexOfCardInGameCardArray==nil{
            card1.card=card
            card1.IndexOfCardInGameCardArray=index
        }else if card2.card==nil && card2.IndexOfCardInGameCardArray==nil{
            card2.card=card
            card2.IndexOfCardInGameCardArray=index
        }else if card3.card==nil && card3.IndexOfCardInGameCardArray==nil{
            card3.card=card
            card3.IndexOfCardInGameCardArray=index
        }else{
            print("Cannot put card in set, All cards in set are not equal to nil")
        }
    }
    
    
}
