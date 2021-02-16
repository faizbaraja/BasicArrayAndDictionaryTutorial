//
//  SecondViewController.swift
//  SwiftTableView
//
//  Created by faiz baraja on 2/6/21.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var labelDataAwal:UILabel!
    @IBOutlet var labelDataAkhir:UILabel!
    
    var selectedData:[String:Any] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.hidesBarsOnTap = true
        setupLabel(selectedData: selectedData)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupLabel(selectedData:[String:Any]) {
        labelDataAwal.text = selectedData["number"] as? String
        labelDataAkhir.text = selectedData["timesTwo"] as? String
        
        labelDataAwal.setRedLabel()
        labelDataAkhir.setBlueLabel()
    }
}
