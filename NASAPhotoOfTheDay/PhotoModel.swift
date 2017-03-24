//
//  PhotoModel.swift
//  NASAPhotoOfTheDay
//
//  Created by Ginny Pennekamp on 3/15/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

struct Photo {
    var image: String?
    var date: String?
    var title: String?
    var description: String?
    
    // construct a NASAPhoto from a dictionary
    init(dictionary: [String:AnyObject]) {
        if let imageURLString = dictionary[NASARequest.ResponseKeys.imageURL] as? String, imageURLString.isEmpty == false {
            image = imageURLString
        }
        if let dateString = dictionary[NASARequest.ResponseKeys.date] as? String, dateString.isEmpty == false {
            date = dateString
        } else {
            date = ""
        }
        if let titleString = dictionary[NASARequest.ResponseKeys.title] as? String, titleString.isEmpty == false {
            title = titleString
        } else {
            title = ""
        }
        if let descriptionString = dictionary[NASARequest.ResponseKeys.description] as? String, descriptionString.isEmpty == false {
            description = descriptionString
        } else {
            description = ""
        }
    }

}
