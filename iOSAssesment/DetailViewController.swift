//
//  DetailViewController.swift
//  iOSAssesment
//
//  Created by Zimble on 02/05/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    var detail:UserDetail! 
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = detail{
            self.titleLbl.text = "\(detail.id ?? 0) \(detail.title ?? "")"
            self.descLbl.text = detail.body
        }
    }
    

   

}
