//
//  ShowEntryViewController.swift
//  FoodJournalApp_UIKit
//
//  Created by IACD 05 on 2022/11/28.
//

import UIKit

class ShowEntryViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textViewOut: UITextView!
    
    @IBOutlet weak var dateTextViewOut: UITextView!
    
    @IBOutlet weak var doneBtn: UIButton!
    
    
    var imageViewDisp:UIImage?
    var descriptOut:String = ""
    var journalItemEntry: JournalItem = .init(decription: "", date: .now, imageName: UIImage())
        

    override func viewDidLoad() {
        super.viewDidLoad()

        displayEntry()
        
        textViewOut.layer.borderWidth = 0.5
        textViewOut.layer.cornerCurve = .continuous
        textViewOut.layer.cornerRadius = 10
        
        
        doneBtn.layer.shadowColor = UIColor.systemYellow.cgColor
        doneBtn.layer.shadowOpacity = 1
        doneBtn.layer.shadowOffset = .zero
        doneBtn.layer.shadowRadius = 10
    }
    
    
    func displayEntry() {
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "HH:mm E, d MMM y"
        
        journalItemEntry = Utilities.selectedEntry
        imageView.image = journalItemEntry.imageName
        textViewOut.text = journalItemEntry.decription
        dateTextViewOut.text = formatter3.string(from: journalItemEntry.date)
    }
    
    
    @IBAction func doneBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
}
