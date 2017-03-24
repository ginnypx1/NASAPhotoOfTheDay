//
//  ViewController.swift
//  NASAPhotoOfTheDay
//
//  Created by Ginny Pennekamp on 3/15/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    // MARK: - Outlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    // MARK: - Properties
    
    var photo: Photo?
    var client = NASAClient()
    
    // MARK: - download and unwrap Data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNASAData()
    }
    
    // MARK: - GET request
    
    func loadNASAData() {
        // calls taskForGETMethod to retrieve data, completion handler tells data to save as photo object
        client.taskForGETMethod(completionHandlerForGET: { (result: AnyObject?, error:NSError?) -> Void in
            
            if (error == nil) {
                /* GUARD: Are the correct keys in our result? */
                guard let results = result as? [String: AnyObject],
                      let _ = result?[NASARequest.ResponseKeys.imageURL] as? String,
                      let _ = result?[NASARequest.ResponseKeys.date] as? String,
                      let _ = result?[NASARequest.ResponseKeys.title] as? String,
                      let _ = result?[NASARequest.ResponseKeys.date] as? String else {
                    print("The correct keys were not found in the result")
                    return
                }
                // save as photo object
                self.photo = Photo(dictionary: results)
                print("photo saved as: \(self.photo)")
                // retrieve the photo for display
                if let imageURL = self.photo?.image {
                    self.extractPhoto(imageURL)
                } else {
                    print("There was an error in taskForGETMethod: \(error)")
                }
            } else {
                print("There was an error in taskForGETMethod: \(error)")
            }
        })
    }
    
    // MARK: - extract Photo
    
    func extractPhoto(_ photoUrl: String) {
        // calls taskForGetImage, then tells view controller what to do with data in completion handler
        client.taskForGETImage(photoUrl, completionHandlerForImage: { (imageData: Data?, error: NSError?) -> Void in
            
            if (error == nil) {
                if let image = UIImage(data: imageData!) {
                    print("image: \(image)")
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                } else {
                    print("There was a problem extracting the image data.")
                }
            } else {
                print("There was an error in taskForGETImage: \(error)")
            }
                
        })
    }
    
    // MARK: - See Photo Info
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            let controller = segue.destination as! InfoViewController
            controller.photo = self.photo
        }
    }
    
    // MARK: - Capture and Share Photo
    
    func generateShareImage() -> UIImage {
        // render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let shareImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return shareImage
    }
    
    @IBAction func sharePhoto(_ sender: Any) {
        // shares the daily photo
        
        let shareImage = generateShareImage()
        // define an instance of the ActivityViewController, pass the AVC a memed image as an activity item
        let controller = UIActivityViewController(activityItems: [shareImage], applicationActivities: [])
        self.present(controller, animated: true, completion: nil)
        
        // handler reads (activity, success, items, error)
        controller.completionWithItemsHandler = { (_, success, _, _) in
            if success {
                // dismiss activity view
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

}

