//
//  PictureViewController.swift
//  Seamus Snap
//
//  Created by Seamus MacIsaac on 2017-05-02.
//  Copyright © 2017 Seamus MacIsaac. All rights reserved.
//

import UIKit
import Firebase

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    // ACTIONS
    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        nextButton.isEnabled = false
        
        let imagesFolder = FIRStorage.storage().reference().child("images")
        
        let imageData = UIImagePNGRepresentation(imageView.image!)!
        
        imagesFolder.child("images.png").put(imageData, metadata: nil, completion: {(metadata,error) in
            print("we tried to upload")
            if error != nil {
                print("We had an error \(error)")
            } else{
                print("Upload successful!")
                self.performSegue(withIdentifier: "selectUserSegue", sender: nil)
            }
            
        })
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
