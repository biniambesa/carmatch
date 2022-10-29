//
//  CarMatchVM.swift
//  carmatch
//
//  Created by Sogah Mainib on 10/28/22.
//

import Foundation
import SwiftUI
class CarMatchVM: ObservableObject {
    @Published var viewToBePresented : CurrentView = .IMGVIEW //viewToBePresented
    @Published var idxOfCarShowing = 0
    @Published private var model: CarMatch<Car> = createCarContent()
    @Published var chosenImg = 0
    @Published var offset = CGSize.zero
    @Published var currCardIsLoved = false
    @Published var currCardIsNotLoved = false
    
    static let SampleCars: [Car] = [
        Car(
            id: 0,
            vin: "asfjlaskjflsdfslj",
            year: 1965,
            make: "chevy",
            model: "corvair",
            trim: "Corsa",
            miles: 125000,
            price: 49995,
            sellerID: 00,
            imgs:[
                "Corvair-back-main",
                "Corvair-driver-front",
                "Corvair-back",
                "Corvair-front",
                "Corvair-driver-inside",
                "Corvair-driver-inside",
                "Corvair-front-angle",
                "Corvair-back-driver",
                "Corvair-right"
            ]
        ),
        
        Car(
            id: 1,
            vin:"asdfjodlsjflsdfjkldsf",
            year: 2012,
            make: "ford",
            model: "mustang",
            trim: "convertable",
            miles: 90000,
            price: 12995,
            sellerID: 01,
            imgs:[
                "Ford0",
                "Ford2",
                "Ford3",
                "Ford4"
            ]
        ),
        Car(
            id: 2,
            vin:"asdfjodlsjfdsfadflsdfjkldsf",
            year: 2019,
            make: "lincoln",
            model: "mkz",
            trim: "hybrid select",
            miles: 60000,
            price: 29995,
            sellerID: 002,
            imgs:[
                "MKZ0",
                "MKZ1",
                "MKZ2"
            ]
        ),]
    
    
    static func createCarContent() -> CarMatch<Car>{
        CarMatch<Car>(numOfCars: SampleCars.count){idx in SampleCars[idx]}
    }
    
    
   
    
    var cards:Array<CarMatch<Car>.Card>{
        model.cards
    }
    
//    MARK :-  Intentions
    func manageVerticalSwipes(_ card:CarMatch<Car>.Card, swipeDirecion:Swipes ){
        self.chosenImg = 0
        if(swipeDirecion == .UP){
            model.update(card, notLoved: true, loved: false, faceUp: true)
        }
        if(swipeDirecion == .DOWN){
            model.update(card, notLoved: false, loved: true, faceUp: true)
        }
        self.idxOfCarShowing = idxOfCarShowing == CarMatchVM.SampleCars.count - 1 ? 0: idxOfCarShowing + 1
        print("loved: \(currCardIsLoved)_ notLoved: \(currCardIsNotLoved)")
        // :-TODO //remove this later 
//        model.update(cards[idxOfCarShowing], notLoved: false, loved: false, faceUp: true)
    }
  
    
    func manageSwipes(_ card:CarMatch<Car>.Card, swipeDirecion:Swipes){
        if(swipeDirecion == .LEFT){
            self.chosenImg = chosenImg == 0 ? card.content.imgs.count-1 : chosenImg - 1
        }
        if(swipeDirecion == .RIGHT){
            print("IMG SWIPE \(swipeDirecion)")
            self.chosenImg = chosenImg == card.content.imgs.count-1 ? 0 : chosenImg + 1
        }
        if(swipeDirecion == .UP){
            manageVerticalSwipes(card, swipeDirecion: .UP)
        }
        if(swipeDirecion == .DOWN){
            manageVerticalSwipes(card, swipeDirecion: .DOWN)
        }
        
        currCardIsLoved = false  ///theres got to be a cleaner way of doing this
        currCardIsNotLoved = false///theres got to be a cleaner way of doing this
    }
    
    func flip(_ card:CarMatch<Car>.Card){
        model.flipCard(card)
    }
    
    
    
}
