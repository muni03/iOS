//
//  ViewController.swift
//  MemeGen
//
//  Created by pmuniz on 5/2/18.
//  Copyright © 2018 Peter Muniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var textTop: UITextField!
    @IBOutlet weak var textBot: UITextField!
    
    //nav & toolbar
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    
    
    let textDelegate = TopBottomTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.isEnabled = false
        
        
        self.textTop.delegate = textDelegate
        self.textBot.delegate = textDelegate
        
        
        
        let memeGenAttributes:[String: Any] = [
            NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
            NSAttributedStringKey.foregroundColor.rawValue: UIColor.white,
            NSAttributedStringKey.font.rawValue: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedStringKey.strokeWidth.rawValue: 5.0]
        
        textTop.defaultTextAttributes = memeGenAttributes
        textBot.defaultTextAttributes = memeGenAttributes
        
        textTop.textAlignment = .center
        textBot.textAlignment = .center
        textTop.text = "TOP"
        textBot.text = "BOTTOM"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribeToKeyboardNotfications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromKeyboardNotifications()
    }
    

    @IBAction func pickImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true, completion: nil)
        shareButton.isEnabled = true
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.image = image
        }else {
            print("error")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if textBot.isEditing{
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    func subscribeToKeyboardNotfications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    struct Meme {
        let topText: String
        let bottomText: String
        let originalImage: UIImage
        let memedImage: UIImage
        
    }
    
    func generateMemedImage() -> UIImage {
        
        //hide nav and toolbar
        toolBar.isHidden = true
        navigationBar.isHidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        //show nav & toolbar
        toolBar.isHidden = false
        navigationBar.isHidden = false
        
        
        
        return memedImage
    }
    
        // Create the meme
        lazy var meme = Meme(topText: textTop.text!, bottomText: textBot.text!, originalImage: imagePickerView.image!, memedImage: generateMemedImage())
    
    
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        let shareImg = [generateMemedImage()]
        let activityViewController = UIActivityViewController(activityItems: shareImg, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}


