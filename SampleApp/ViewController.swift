//
//  ViewController.swift
//  SampleApp
//
//  Created by Dmytro Kiro on 6/24/19.
//  Copyright © 2019 Dmytro Kiro. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var mealNameLabel: UILabel?
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField?.delegate = self
    }

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel?.text = "Default text"
    }
    
    @IBAction func selectImage(_ sender: UITapGestureRecognizer) {
        nameTextField?.resignFirstResponder()
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary

        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) ->Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel?.text = textField.text
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        DispatchQueue.main.async{
            self.photoImageView?.image = selectedImage
            self.photoImageView?.setNeedsDisplay()
        }
        dismiss(animated: true, completion: nil)

    }
    
}

