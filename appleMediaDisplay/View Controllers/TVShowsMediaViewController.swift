//
//  TVShowsMediaViewController.swift
//  appleMediaDisplay
//
//  Created by Ashlee Krammer on 4/16/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class TVShowsMediaViewController: UIViewController {
    
    let mediaDisplayView = MediaDisplayView()
    
    var appleMediaShows = [Result]() {
        didSet {
            mediaDisplayView.mediaTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mediaDisplayView)
        loadShows()
        self.view.backgroundColor = .white
        self.mediaDisplayView.mediaTableView.delegate = self
        self.mediaDisplayView.mediaTableView.dataSource = self
        self.mediaDisplayView.mediaTypeLabel.text = " Shows"
        self.mediaDisplayView.mediaTableView.register(MediaTableViewCell.self, forCellReuseIdentifier: "MediaCell")
    }
    
    @objc  func loadShows(){
        
        let urlStr = "https://rss.itunes.apple.com/api/v1/us/tv-shows/top-tv-episodes/all/100/explicit.json"
        
        let completion = {(onlineBooks: [Result]) in
            self.appleMediaShows = onlineBooks
        }
        
        let errorHanlder: (AppError) -> Void = {(error: AppError) in
            switch error{
            case .noInternetConnection:
                print("No internet connection")
            case .couldNotParseJSON:
                print("Could Not Parse")
            case .badStatusCode:
                print("Bad Status Code")
            case .badURL:
                print("Bad URL")
            case .invalidJSONResponse:
                print("Invalid JSON Response")
            case .noDataReceived:
                print("No Data Received")
            case .notAnImage:
                print("No Image Found")
            default:
                print("Other error")
            }
        }
        MediaAPIClient.manager.getMedia(from: urlStr, completionHandler: completion, errorHandler: errorHanlder)
    }
}

extension TVShowsMediaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = appleMediaShows[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! MediaTableViewCell
        let cellImage = cell.mediaImg.image
        let detailedViewController = MediaDetailViewController(result: result, image: cellImage!)
        detailedViewController.modalPresentationStyle = .overCurrentContext
        detailedViewController.modalTransitionStyle = .crossDissolve
        present(detailedViewController, animated: true, completion: nil)
    }
}

extension TVShowsMediaViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appleMediaShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaTableViewCell
        let aShow = appleMediaShows[indexPath.row]
        cell.mediaTitle.text = aShow.name
        cell.artistNameLabel.text = aShow.artistName
        cell.mediaTypeLabel.text = aShow.kind
        
        let imageUrlStr = aShow.artworkUrl100
        
        let completion: (UIImage) -> Void = {(onlineImage: UIImage) in
            cell.mediaImg.image = onlineImage
        }
        
        ImageAPIClient.manager.loadImage(from: imageUrlStr, completionHandler: completion, errorHandler: {print($0)})
        
        return cell
    }
}
