//
//  MovieDetails.swift
//  ChongtianZhang-Lab4
//
//  Created by Chongtian Zhang on 10/17/21.
//

import UIKit

class MovieDetails: UIViewController {
    
    @IBOutlet weak var Poster: UIImageView!
    @IBOutlet weak var Release: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var Runtime: UILabel!
    
    
    var tempPoster:UIImage!
    var tempRelease: String!
    var tempScore: String!
    var temptitle:String!
    var tempruntime: Int!
    var tempid:Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Poster.image=tempPoster
        if tempRelease != nil {
            Release.text="Release Date: \(tempRelease!)"
        }
        else{
            Release.text="Release Date: Not determined"
        }
        Score.text="Score: \(tempScore!)"
        Runtime.text="Runtime: \(tempruntime!)"
        self.navigationItem.title=temptitle
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressVideo(_ sender: Any) {
        initVC()
    }
    
    func initVC(){
        let videoVC=(storyboard?.instantiateViewController(identifier: "videoPAGE"))! as videoPAGE
        videoVC.tempID=tempid
        navigationController?.pushViewController(videoVC, animated: true)
    }

    
    @IBAction func addFav(_ sender: Any) {
        let defaults=UserDefaults.standard
        var array=defaults.array(forKey: "Movietitle") as? [String] ?? [String]()
        if !array.contains(temptitle) {
            array.append(temptitle)
            defaults.set(array, forKey: "Movietitle")
        }
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
