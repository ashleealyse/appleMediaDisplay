//
//  MediaDetailViewController.swift
//  appleMediaDisplay
//
//  Created by Ashlee Krammer on 4/16/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class MediaDetailViewController: UIViewController {

    let mediaDetailView = MediaDetailView()
    
    private var result: Result!
    
    init(result: Result, image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.result = result
        mediaDetailView.configureDetailedView(result: result, image: image)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mediaDetailView)
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissView()
    }

}
