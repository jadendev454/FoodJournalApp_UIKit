//
//  Utilities.swift
//  FoodJournalApp_UIKit
//
//  Created by IACD 05 on 2022/11/28.
//

import Foundation
import SwiftUI
import UIKit


struct JournalItem: Identifiable{
    var id: UUID = UUID()
    
    let decription:String
    let date:Date
    let imageName:UIImage
}


public class Utilities{
    static var journalEntries:[JournalItem] = []
    static var popCount:Int = 0
    static var selectedEntry:JournalItem = .init(decription: "", date: .now, imageName: UIImage())
    
    
    static func adjustJournalEntries(_ entry:[JournalItem]){
        journalEntries = entry
    }
    
    
    static func addEntry(_ entry: JournalItem) {
        journalEntries.append(entry)
    }
    
    
    // For Testing Only
    func popDemoEntries(_ amount:Int) {
        
        if Utilities.popCount > 0 {
            return
        }
        
        Utilities.popCount += 1
        
        var _newEntryList:[JournalItem] = []
        
        for i in 0...amount{
            let entry = JournalItem.init(decription: "Food description eodjeojfoeofjeofoejfojefoejfoejfojejfooejfooejfojeofejofjoejfjfeofjeof eodjeodjoedoejoejdoedjoejdoeekdokeodoek", date: .now + TimeInterval(i), imageName: UIImage(named: "placeholder_Image")!)
            
            _newEntryList.append(entry)
        }
        
        Utilities.adjustJournalEntries(_newEntryList)
        
        print("\(Utilities.journalEntries.count)")
    }
}
