//
//  InfoViewController.swift
//  NASAPhotoOfTheDay
//
//  Created by Ginny Pennekamp on 3/15/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let photo = photo {
            titleLabel.text = photo.title
            dateLabel.text = photo.date
            aboutLabel.text = photo.description
        }
    }

}
