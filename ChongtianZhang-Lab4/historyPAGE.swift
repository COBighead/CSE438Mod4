//
//  historyPAGE.swift
//  ChongtianZhang-Lab4
//
//  Created by Chongtian Zhang on 10/26/21.
//

import UIKit

class historyPAGE: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var historyTable: UITableView!
    let defaults=UserDefaults.standard
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array=defaults.array(forKey: "History") as? [String] ?? [String]()
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "histCell", for: indexPath)
        let array=defaults.array(forKey: "History") as? [String] ?? [String]()
        cell.textLabel?.text=array[indexPath.row]
        return cell
    }
    
    @IBAction func clearHist(_ sender: Any) {
        let array:[String]=[]
        defaults.set(array, forKey: "History")
        historyTable.reloadData()
    }
    
    func setuptableview(){
        historyTable.dataSource=self
        historyTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.delegate=self
        setuptableview()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        historyTable.delegate=self
        setuptableview()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
