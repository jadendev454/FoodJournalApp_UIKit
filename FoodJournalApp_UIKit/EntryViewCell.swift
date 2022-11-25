//
//  EntryViewCell.swift
//  FoodJournalApp_UIKit
//
//  Created by IACD 05 on 2022/11/25.
//

import UIKit

class EntryViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var entryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    
    func setEntryCell(journalEntry: JournalItem) {
        
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "HH:mm E, d MMM y"
        
        imageViewCell.image = journalEntry.imageName
        entryLabel.text = journalEntry.decription
        dateLabel.text = formatter3.string(from: journalEntry.date)
    }
}
