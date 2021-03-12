//
//  CameraViewController.swift
//  InstagramClone
//
//  Created by Manny Reyes on 3/11/21.
//

import UIKit
import Parse
//import AlamofireImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate { //allows for image

    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    
    @IBAction func onSubmitButton(_ sender: Any) {
        
        let post = PFObject(className: "Posts")
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()!
        
        let imageData = ImageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        post["image"] = file
        
        post.saveInBackground{
            (sucess, error) in
            if sucess {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            }else{
                print("error!")
            }
        }
    }
    @IBOutlet weak var commentField: UITextField!
    
    
    @IBOutlet weak var onSubmitButton: UIButton!
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true  //doesnt allow for custom view
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else{
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
     func imagePrickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
       // let size = CGSize(width: 300, height: 300)
        //let scaledImage = image.af_imageScaled(to:size)
        
        //ImageView.image = scaledImage
        
        //dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
