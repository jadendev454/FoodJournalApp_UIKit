//
//  AddEntryViewController.swift
//  FoodJournalApp_UIKit
//
//  Created by IACD 05 on 2022/11/27.
//

import UIKit
import Foundation

class AddEntryViewController: UIViewController {

    
    @IBOutlet weak var addItemBtn: UIButton!
    
    @IBOutlet weak var imageViewOut: UIImageView!
    
    @IBOutlet weak var textBoxOut: UITextView!
    
    
    //Vars
    var isAddFoodItemView:Bool = false
    var entryDecription:String = ""

    private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    private var selectedImage: UIImage?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        optioNavBarItem()
        
        tabBarController?.tabBar.isHidden = true
        
        view.tintColor = .systemYellow
        textBoxOut.layer.borderWidth = 1
        textBoxOut.layer.cornerCurve = .continuous
        textBoxOut.layer.cornerRadius = 10
        
        addItemBtn.layer.shadowColor = UIColor.systemYellow.cgColor
        addItemBtn.layer.shadowOpacity = 1
        addItemBtn.layer.shadowOffset = .zero
        addItemBtn.layer.shadowRadius = 10
    }
    
    
    @IBAction func addItemActionBtn(_ sender: UIButton) {
        addItem()
    }
    
    
    //Methods
    func addItem() {
        
        entryDecription = textBoxOut.text
        selectedImage = imageViewOut.image
        
        Utilities.addEntry(JournalItem(decription: entryDecription, date: Date.now, imageName: selectedImage!))
        
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isAddFoodItemView.toggle()
        }
    }
    
    
    func optioNavBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "camera.badge.ellipsis"), style: .done, target: self, action: #selector(cameraSegue))
        navigationItem.rightBarButtonItem?.tintColor = .systemYellow
    }
    
    
    
    @objc func cameraSegue(){
        ImagePickerManager().pickImage(self) { _image in
            // Image should be in here.....lets hope
            self.imageViewOut.image = _image
        }
    }
}
