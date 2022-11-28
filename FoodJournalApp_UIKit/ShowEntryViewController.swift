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
    
    var imageViewDisp:UIImage?
    var descriptOut:String = ""
    var journalItemEntry: JournalItem = .init(decription: "", date: .now, imageName: UIImage())
        

    override func viewDidLoad() {
        super.viewDidLoad()

        displayEntry()
    }
    
    
    func displayEntry() {
        
        journalItemEntry = Utilities.selectedEntry
        print(journalItemEntry.decription)
        imageView.image = journalItemEntry.imageName
        textViewOut.text = journalItemEntry.decription
    }
    
    
    @IBAction func doneBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
}
