//
//  CarMatch.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/28/22.
//

import Foundation
struct CarMatch<CarContent>{
    private(set) var cards: Array<Card>
    private(set) var carsLoved: Array<String> = []
    private(set) var carsNotLoved: Array<String> = []
    
    mutating func update(_ card: Card,notLoved:Bool, loved:Bool, faceUp:Bool){
       let selectedIdx = index(of: card)
        cards[selectedIdx].isLoved = loved
        cards[selectedIdx].isNotLoved = notLoved
        cards[selectedIdx].isFaceUp = faceUp
    }
    
    
    func index(of card:Card)->Int{
        for idx in cards.indices{
            if cards[idx].id == card.id{
                return idx
            }
        }
        return 0 //weird
    }
    
    init(numOfCars: Int,createCarContent: (Int) -> CarContent ){
        cards = Array<Card>()
        for idx in 0..<numOfCars {
            let content = createCarContent(idx)
            cards.append(Card(isFaceUp: true, content: content, id: idx))
        }
    }
    
    
    struct Card:Identifiable{
        var isFaceUp: Bool = true
        var isLoved : Bool = false
        var isNotLoved : Bool = false
        let content : CarContent
        let id: Int
    }
    
    
    mutating func flipCard(_ card: Card){
        let idx = index(of: card)
       cards[idx].isFaceUp.toggle()
    }
}
