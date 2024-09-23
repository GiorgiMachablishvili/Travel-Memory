//
//  ImagePickerUtility.swift
//  Travel Memory
//
//  Created by Irakli Kochua on 23.09.24.
//

import Foundation
import UIKit

class ImagePickerUtility: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private var completion: ((UIImage?) -> Void)?
    
    init(presentationController: UIViewController) {
        self.pickerController = UIImagePickerController()
        super.init()
        
        self.presentationController = presentationController
        
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }
    
    func present(completion: @escaping (UIImage?) -> Void) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Take photo", style: .default) { [unowned self] _ in
                self.pickerController.sourceType = .camera
                self.presentationController?.present(self.pickerController, animated: true)
            }
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default) { [unowned self] _ in
                self.pickerController.sourceType = .photoLibrary
                self.presentationController?.present(self.pickerController, animated: true)
            }
            alertController.addAction(photoLibraryAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        self.completion = completion
        self.presentationController?.present(alertController, animated: true)
    }
    
    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true) {
            self.completion?(image)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
}
