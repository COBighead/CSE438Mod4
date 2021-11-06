//
//  favoritePage.swift
//  ChongtianZhang-Lab4
//
//  Created by Chongtian Zhang on 10/20/21.
//

import UIKit

class favoritePage: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let defaults=UserDefaults.standard
    
    @IBOutlet weak var favTable: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array=defaults.array(forKey: "Movietitle") as? [String] ?? [String]()
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)
        let array=defaults.array(forKey: "Movietitle") as? [String] ?? [String]()
        cell.textLabel?.text=array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var array=defaults.array(forKey: "Movietitle") as? [String] ?? [String]()
            array.remove(at: indexPath.row)
            defaults.set(array,forKey: "Movietitle")
            favTable.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    

    
    func setuptableview(){
        favTable.dataSource=self
        favTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favTable.delegate=self
        setuptableview()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        favTable.delegate=self
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
