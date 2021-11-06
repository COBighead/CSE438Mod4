//
//  ViewController.swift
//  ChongtianZhang-Lab4
//
//  Created by Chongtian Zhang on 10/13/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var SearchKey: UITextField!
    @IBOutlet weak var movieTable: UICollectionView!
    var keyword:String?
    var theData: [Movie] = []
    var theImageCache: [UIImage] = []
    var tempResult: APIResults?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTable.delegate = self
        getTrend()
        cacheImage()
        setupCollectionView()
    }

    @IBAction func Search(_ sender: Any) {
        theImageCache=[]
        let check = SearchKey.text?.replacingOccurrences(of: " ", with: "")
        if check != ""{
            let tempword=SearchKey.text
            keyword = tempword?.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            fetchData()
            cacheImage()
            setupCollectionView()
        }
        else{
        }
    }
    
    @IBAction func Trend(_ sender: Any) {
        theImageCache=[]
        getTrend()
        cacheImage()
        setupCollectionView()
    }
    
    @IBAction func discover_Pop(_ sender: Any) {
        theImageCache=[]
        getPop()
        cacheImage()
        setupCollectionView()
    }
    
    @IBAction func discover_Date(_ sender: Any) {
        theImageCache=[]
        getDate()
        cacheImage()
        setupCollectionView()
    }
    
    @IBAction func discover_Rating(_ sender: Any) {
        theImageCache=[]
        getRating()
        cacheImage()
        setupCollectionView()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return theData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! theMovieCell
        cell.backgroundView = UIImageView( image: theImageCache[indexPath.row])
        cell.Title.text=theData[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC=storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetails
        let defaults=UserDefaults.standard
        var array=defaults.array(forKey: "History") as? [String] ?? [String]()
        if !array.contains(theData[indexPath.row].title){
            array.append(theData[indexPath.row].title)
            defaults.set(array, forKey: "History")
        }
        
        detailVC.tempPoster = theImageCache[indexPath.row]
        detailVC.tempScore = String(theData[indexPath.row].vote_average)
        detailVC.tempRelease = theData[indexPath.row].release_date
        detailVC.temptitle = theData[indexPath.row].title
        let currentMovie=furtherData(movieID: theData[indexPath.row].id)
        detailVC.tempruntime=currentMovie.runtime
        detailVC.tempid=theData[indexPath.row].id
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func setupCollectionView(){
        movieTable.dataSource = self
        movieTable.reloadData()
    }
    

    func fetchData(){
        let source=URL(string: "https://api.themoviedb.org/3/search/movie?api_key=ed69304b0441401b09492a2db536bdcd&query=\(keyword!)")
        let searchResult = try? Data(contentsOf: source!)
        tempResult = try? JSONDecoder().decode(APIResults.self, from: searchResult ?? Data())
        theData = tempResult!.results
    }
    
    func getTrend(){
        let source = URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=ed69304b0441401b09492a2db536bdcd")
        let result = try? Data(contentsOf: source!)
        tempResult = try? JSONDecoder().decode(APIResults.self, from: result ?? Data())
        theData = tempResult!.results
    }
    
    func getPop(){
        let source = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=ed69304b0441401b09492a2db536bdcd&sort_by=popularity.desc&include_adult=false&include_video=false&with_watch_monetization_types=flatrate")
        let result = try? Data(contentsOf: source!)
        tempResult = try? JSONDecoder().decode(APIResults.self, from: result ?? Data())
        theData = tempResult!.results
    }
    
    func getDate(){
        let source = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=ed69304b0441401b09492a2db536bdcd&sort_by=release_date.desc&include_adult=false&include_video=false&with_watch_monetization_types=flatrate")
        let result = try? Data(contentsOf: source!)
        tempResult = try? JSONDecoder().decode(APIResults.self, from: result ?? Data())
        theData = tempResult!.results
    }
    
    func getRating(){
        let source = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=ed69304b0441401b09492a2db536bdcd&sort_by=vote_average.desc&include_adult=false&include_video=false&with_watch_monetization_types=flatrate")
        let result = try? Data(contentsOf: source!)
        tempResult = try? JSONDecoder().decode(APIResults.self, from: result ?? Data())
        theData = tempResult!.results
    }
    
    
    func furtherData(movieID: Int) -> MovieDetail{
        let source = URL(string:"https://api.themoviedb.org/3/movie/\(movieID)?api_key=ed69304b0441401b09492a2db536bdcd")
        let detailList = (try? Data(contentsOf: source!))!
        let detailResult=(try? JSONDecoder().decode(MovieDetail.self, from: detailList))!
        return detailResult
    }
    
    
    func cacheImage(){
        for item in theData{
            if item.poster_path != nil {
                let picLink = URL(string: "https://image.tmdb.org/t/p/original\(item.poster_path!)")
                let data = try? Data(contentsOf: picLink!)
                let poster = UIImage(data: data!)
                theImageCache.append(poster!)
            }
            else{
                theImageCache.append(UIImage())
            }
        }
    }
}

