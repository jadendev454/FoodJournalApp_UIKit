//
//  HomeViewController.swift
//  FoodJournalApp_UIKit
//
//  Created by IACD 05 on 2022/11/24.
//

import UIKit
import Foundation


class HomeViewController: UIViewController {

    var journalEntries:[JournalItem] = Utilities.journalEntries
    var popCount:Int = 0
    
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var addEntryBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layoutGuide = view.bounds;
        
        self.title = "My Food Journal"
        self.view.tintColor = .systemYellow
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addEntryBtn.frame = CGRect(x: (layoutGuide.width / 2) - 40, y: layoutGuide.height - 160, width: 80, height: 80)
        
        addEntryBtn.layer.shadowColor = UIColor.systemYellow.cgColor
        addEntryBtn.layer.shadowOpacity = 1
        addEntryBtn.layer.shadowOffset = .zero
        addEntryBtn.layer.shadowRadius = 10
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        journalEntries = Utilities.journalEntries
        tableView.reloadData()
        tabBarController?.tabBar.isHidden = false
        
        updateHelperUI()
    }
    
    
    @IBAction func addEntryAction(_ sender: UIButton) {
        //self.show(AddEntryViewController(), sender: self)
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
    
    
    
    func updateHelperUI() {
        if journalEntries.isEmpty{
            
            let layoutGuide = view.bounds;
            
            let viewCentre = view.center
            let viewMargins = view.layoutMarginsGuide.layoutFrame
            
            let helperTextView = UITextView(frame: CGRect(x: (layoutGuide.width / 2) - layoutGuide.width / 2, y: (layoutGuide.height / 2) - 150, width: layoutGuide.width, height: (layoutGuide.height / 2) - 150))
            helperTextView.text = "\"Looks Empty in here\".....why not add something?"
            helperTextView.font = .systemFont(ofSize: 30, weight: .heavy)
            helperTextView.textColor = .systemGray
            helperTextView.textAlignment = .center
            helperTextView.backgroundColor = .clear
            helperTextView.isEditable = false
            helperTextView.tag = 100
            
            view.addSubview(helperTextView)
        }
        else{
            let _view = view.viewWithTag(100)
            _view?.removeFromSuperview()
        }
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
        cell.backgroundColor = .systemYellow
        cell.layer.cornerRadius = 15
        cell.layer.cornerCurve = .continuous
        cell.frame = view.bounds
        /*
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 1.0
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 100
        */
        
        updateHelperUI()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = journalEntries[indexPath.row]
        
        Utilities.selectedEntry = entry
        //show(ShowEntryViewController(), sender: self)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ShowEntry") as! ShowEntryViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            journalEntries.remove(at: indexPath.row)
            Utilities.journalEntries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
}
