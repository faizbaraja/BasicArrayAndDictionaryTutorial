//
//  ViewController.swift
//  SwiftTableView
//
//  Created by faiz baraja on 2/6/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableTest:UITableView!
    var numbers:[String] = []
    var arrayDict:[[String:Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableTest.dataSource = self
        tableTest.delegate = self
        
        initializeData()
        tableTest.reloadData()
        
        tableTest.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCell")
        // Do any additional setup after loading the view.
    }
    
    private func initializeData() {
        for n in 0...10 {
            numbers.append("Number \(n)")
        }
        
        for n in 0...10 {
            var dictData:[String:Any] = [:]
            dictData["number"] = "Data awal \(n)"
            dictData["timesTwo"] = "Data akhir \(n * 2)"
            
            arrayDict.append(dictData)
        }
    }
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "CountryCell")
        cell.textLabel?.text = arrayDict[indexPath.row]["number"] as? String
        cell.detailTextLabel?.text = arrayDict[indexPath.row]["timesTwo"] as? String
        return cell
    }
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = arrayDict[indexPath.row]["number"] as? String
    //        let alertView = UIAlertController(title: "Test", message: selectedData, preferredStyle: .alert)
    //        // Create the actions
    //        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
    //            UIAlertAction in
    //            alertView.dismiss(animated: true, completion: nil)
    //        }
    //        alertView.addAction(okAction)
    //        self.present(alertView, animated: true, completion: nil)
        let secondVC = SecondViewController()
        secondVC.selectedData = arrayDict[indexPath.row]
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}


extension UILabel {
    func setRedLabel() {
        self.textColor = .red
        self.font = UIFont(name: "AmericanTypewriter", size: 16.0)
        self.textAlignment = .left
    }
    
    func setBlueLabel() {
        self.textColor = .blue
        self.font = UIFont(name: "TrebuchetMS", size: 16.0)
    }
}
