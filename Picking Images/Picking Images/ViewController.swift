//
//  ViewController.swift
//  Picking Images
//
//  Created by Brahma Reddy Chilakala on 17/11/16.
//  Copyright © 2016 Brahma Reddy Chilakala. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imagePickerView: UIImageView!
    
    @IBAction func pickAnImage(_ sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let returnImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            imagePickerView.image = returnImage
        } else {
            print("something went wrong")
        }
        self.dismiss(animated: true, completion: nil)
    }


}

