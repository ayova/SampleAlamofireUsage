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
    
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        alamofireJsonRequest()
//        alamofireRequest()
        alamofireSimpleImageRequest()
    }

    func alamofireJsonRequest() {
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
    
    func alamofireRequest() {
        AF.request("https://api.themoviedb.org/3/discover/movie?api_key=d8fd16e131618860a80cb75f720d694c").response { response in
            do {
                let decoded = try JSONDecoder().decode(DiscoverMoviesWrapper.self, from: response.data!)
                //same as above, just using response instead
                print(decoded)
            } catch {
                print(error)
            }
        }
    }
    
    func alamofireSimpleImageRequest() {
        AF.request("https://image.tmdb.org/t/p/w500/uOw5JD8IlD546feZ6oxbIjvN66P.jpg").responseData { imageData in
            let image = UIImage(data: imageData.data!)
            self.photo.image = image!
        }
    }
}

