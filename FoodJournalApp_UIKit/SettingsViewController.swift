//
//  SettingsViewController.swift
//  FoodJournalApp_UIKit
//
//  Created by IACD 05 on 2022/11/24.
//

import UIKit


struct SettingsOption{
    let title: String
    let handler: (() -> Void)
}


class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var darkModeSwitch: UISwitch = {
        var _switch = UISwitch()
        _switch.onTintColor = .systemGreen
        return _switch
    }()
    var settingOptions: [SettingsOption] = [
        SettingsOption(title: "Darkmode", handler: {
            print("Toggle Darkmode")
        })
    ]
    var settingsTableView: UITableView = {
        let newTable = UITableView(frame: .zero, style: .insetGrouped)
        newTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return newTable
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Settings"
        self.view.tintColor = .systemYellow
        
        view.addSubview(settingsTableView)
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.frame = view.bounds
    }
    
    
    @objc func switchValueDidChange(_ sender: UISwitch) {
        if sender.isOn == true{
            view.window?.overrideUserInterfaceStyle = .dark
        }
        else{
            view.window?.overrideUserInterfaceStyle = .light
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let option = settingOptions[indexPath.row]
        
        cell.textLabel?.text = option.title
        cell.selectionStyle = .none
        darkModeSwitch.center.x = cell.frame.width - 10
        darkModeSwitch.center.y = cell.frame.height / 2
        darkModeSwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        cell.addSubview(darkModeSwitch)
        
        return cell
    }
    
}
