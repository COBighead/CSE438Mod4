//
//  videoPlay.swift
//  ChongtianZhang-Lab4
//
//  Created by Chongtian Zhang on 10/19/21.
//

import UIKit
import WebKit

class videoPlay: UIViewController {
    
    var videoKey:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.white
        let layer=self.view.bounds
        let videoView=WKWebView(frame: layer)
        let videoURL=URL(string: "https://www.youtube.com/embed/\(videoKey!)")
        videoView.load(URLRequest(url: videoURL!))
        view.addSubview(videoView)
        // Do any additional setup after loading the view.
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
