//
//  CustomClasses.swift
//  ChongtianZhang-Lab4
//
//  Created by Chongtian Zhang on 10/17/21.
//

import UIKit

struct APIResults:Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
}

struct VideoResults:Decodable{
    let results:[VideoDetail]
}

struct Movie: Decodable {
    let id: Int!
    let poster_path: String?
    let title: String
    let release_date: String?
    let vote_average: Double
    let overview: String
    let vote_count:Int!
}

struct MovieDetail: Decodable{
    let runtime:Int?
}

struct VideoDetail:Decodable{
    let name:String!
    let key:String!
}

class theMovieCell: UICollectionViewCell{
    @IBOutlet weak var Poster: UIImageView!
    @IBOutlet weak var Title: UILabel!
    
}
