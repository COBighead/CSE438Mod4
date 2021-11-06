//
//  videoPAGE.swift
//  ChongtianZhang-Lab4
//
//  Created by Chongtian Zhang on 10/19/21.
//

import UIKit


class videoPAGE: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tempResult:VideoResults?
    var VideoList:[VideoDetail]=[]
    var tempID:Int!
    
    @IBOutlet weak var Videotable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VideoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videocell", for: indexPath)
        cell.textLabel?.text=VideoList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoVC = videoPlay()
        videoVC.videoKey=VideoList[indexPath.row].key
        navigationController?.pushViewController(videoVC, animated: true)
    }
    
    func setuptableview(){
        Videotable.dataSource=self
        Videotable.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getVideo()
        Videotable.delegate=self
        setuptableview()
        // Do any additional setup after loading the view.
    }
    
    func getVideo(){
        let source=URL(string: "https://api.themoviedb.org/3/movie/\(tempID!)/videos?api_key=ed69304b0441401b09492a2db536bdcd")
        let videoResult=try? Data(contentsOf: source!)
        tempResult=try? JSONDecoder().decode(VideoResults.self, from: videoResult ?? Data())
        VideoList=tempResult!.results
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
