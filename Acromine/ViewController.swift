//
//  ViewController.swift
//  Acromine
//
//  Created by Anand Yadav on 14/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var radioSF: UIButton!
    @IBOutlet weak var radioLF: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var typeSelected: Int = 0
    var acromine: Acromine? = []
    var viewModel: AcromineViewModel?
    var param:[String:Any]?
    // required when called from storyboard
    required init?(coder aDecoder: NSCoder) {
        viewModel = AcromineViewModel()
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.acromine?.first?.lfs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell
        cell.lblLF.text = self.acromine?.first?.lfs.first?.lf
        cell.lblFreq.text = String((self.acromine?.first?.lfs.first?.freq)!)
        cell.lblSince.text = String((self.acromine?.first?.lfs.first?.since)!)

        return cell
    }

    @IBAction func typeSelected(_ sender: Any) {
        let tag:Int = (sender as AnyObject).tag
        typeSelected = tag
        if (tag == 0) {
            radioSF.setBackgroundImage(UIImage(named: "radioOn"), for: UIControl.State.normal)
            radioLF.setBackgroundImage(UIImage(named: "radioOff"), for: UIControl.State.normal)
        } else {
            radioSF.setBackgroundImage(UIImage(named: "radioOff"), for: UIControl.State.normal)
            radioLF.setBackgroundImage(UIImage(named: "radioOn"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func btnSearchClicked(_ sender: Any) {
        if (txtSearch.text?.isEmpty == true) {
            let alert = UIAlertController(title: "ERROR", message: "Search string is empty!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        if typeSelected == 0 {
            param = ["sf":txtSearch.text! as Any]
        } else {
            param = ["lf":txtSearch.text! as Any]
        }
        AYProgressHUD.sharedInstance.showBlurView(withTitle: "Loading...")
        self.txtSearch.text = ""
        viewModel?.fetchAcromineData(param: param!, completion: { (acromine, error) in
            self.acromine = acromine
            if self.acromine!.count < 1 {
                let alert = UIAlertController(title: "ERROR", message: "Invalid Search string!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(alert, animated: true)
                AYProgressHUD.sharedInstance.hide()
                return
            }
            self.tableView.reloadData()
            AYProgressHUD.sharedInstance.hide()

        })
    }
    
}

