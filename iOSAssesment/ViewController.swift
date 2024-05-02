//
//  ViewController.swift
//  iOSAssesment
//
//  Created by TJ on 01/05/24.
//

import UIKit
import SVProgressHUD
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var userData = [UserDetail]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetailServiceRequest()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController{
            detailVC.detail = sender as? UserDetail
        }
    }
    
    
    //MARK: WebServices
    func fetchDetailServiceRequest(){
        SVProgressHUD.show()
        ApiRequest().fetchData { response, error in
            SVProgressHUD.dismiss()
            if error == nil{
                self.userData = response!
                self.tableView.reloadData()
            }else{
                
            }
        }
    }
}
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.idLbl.text = "\(userData[indexPath.row].id ?? 0)"
        cell.titleLabel.text = userData[indexPath.row].title
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "detail", sender: userData[indexPath.row])
    }
}
