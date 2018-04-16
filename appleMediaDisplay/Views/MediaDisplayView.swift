//
//  MediaDisplayView.swift
//  appleMediaDisplay
//
//  Created by Ashlee Krammer on 4/16/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class MediaDisplayView: UIView {

    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityInd = UIActivityIndicatorView()
        activityInd.activityIndicatorViewStyle = .gray
        return activityInd
    }()
    
    lazy var mediaTypeDisplayView: UIView = {
        let mediaTypeView = UIView()
        mediaTypeView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        return mediaTypeView
    }()
    
    lazy var mediaTypeLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Helvetica", size: 25)
        return lbl
    }()
    
    
    lazy var mediaTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        setUpActivityIndicator()
        setUpMediaTypeView()
        setUpMediaTypeLabel()
        setUpTableView()
    }
    
    private func setUpActivityIndicator() {
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func setUpMediaTypeView() {
        addSubview(mediaTypeDisplayView)
        mediaTypeDisplayView.translatesAutoresizingMaskIntoConstraints = false
        mediaTypeDisplayView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mediaTypeDisplayView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        mediaTypeDisplayView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        mediaTypeDisplayView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.12).isActive = true
    }
    
    private func setUpMediaTypeLabel() {
        mediaTypeDisplayView.addSubview(mediaTypeLabel)
        mediaTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        mediaTypeLabel.leadingAnchor.constraint(equalTo: mediaTypeDisplayView.leadingAnchor, constant: 5).isActive = true
        mediaTypeLabel.bottomAnchor.constraint(equalTo: mediaTypeDisplayView.bottomAnchor, constant: -5).isActive = true
    }
    
    
    private func setUpTableView() {
        addSubview(mediaTableView)
        mediaTableView.translatesAutoresizingMaskIntoConstraints = false
        mediaTableView.topAnchor.constraint(equalTo: mediaTypeDisplayView.bottomAnchor, constant: 2).isActive = true
        mediaTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        mediaTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        mediaTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }


}
