//
//  ViewController.swift
//  AlamofirePracticeOne
//
//  Created by ADMIN on 05/09/2020.
//  Copyright © 2020 ADMIN. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alamofireRequest()
    }

    func alamofireRequest() {
        AF.request("https://api.themoviedb.org/3/discover/movie?api_key=d8fd16e131618860a80cb75f720d694c").responseJSON { jsonResponse in
            do {
                let decoded = try JSONDecoder().decode(DiscoverMoviesWrapper.self, from: jsonResponse.data!)
                let results = decoded.results
                results.forEach { movie in
                    print(movie.title)
                }
            } catch {
                print(error)
            }
        }
    }
}

