//
//  HomeViewController.swift
//  FoodJournalApp_UIKit
//
//  Created by IACD 05 on 2022/11/24.
//

import UIKit
import Foundation


class HomeViewController: UIViewController {

    var journalEntries:[JournalItem] = []
    var popCount:Int = 0
    
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var addEntryBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layoutGuide = view.bounds;
        
        self.title = "My Food Journal"
        self.view.tintColor = .systemYellow
        
        popDemoEntries(8)
        tableView.delegate = self
        tableView.dataSource = self
        
        addEntryBtn.frame = CGRect(x: (layoutGuide.width / 2) - 40, y: layoutGuide.height - 160, width: 80, height: 80)
    }
    
    
    func adjustJournalEntries(_ entry:[JournalItem]){
        journalEntries = entry
    }
    

    func popDemoEntries(_ amount:Int) {
        
        if popCount > 0 {
            return
        }
        
        popCount += 1
        
        var _newEntryList:[JournalItem] = []
        
        for i in 0...amount{
            let entry = JournalItem.init(decription: "Food description eodjeojfoeofjeofoejfojefoejfoejfojejfooejfooejfojeofejofjoejfjfeofjeof eodjeodjoedoejoejdoedjoejdoeekdokeodoek", date: .now + TimeInterval(i), imageName: UIImage(named: "placeholder_Image")!)
            
            _newEntryList.append(entry)
        }
        
        adjustJournalEntries(_newEntryList)
        
        print("\(journalEntries.count)")
    }

}



extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = journalEntries[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell") as! EntryViewCell
        
        
        cell.setEntryCell(journalEntry: entry)
        
        return cell
    }
    
    
    
}
