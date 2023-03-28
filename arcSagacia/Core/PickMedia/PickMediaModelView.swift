//
//  PostModelView.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 22/02/23.
//

import SwiftUI
import PhotosUI
import CoreImage

@MainActor class PickMediaModelView: ObservableObject {
    @Published var selectedImages = [UIImage]()
    @Published var images = [UIImage]()
    @Published var imageIsValid = false
    @Published var imageClass = ""
    
    func isImageValid() {
        if(!images.isEmpty) {
            imageIsValid = true
            guard let ciImage = CIImage(image: images[0]) else { return }
            if let labelReceived = ArchitectureClassifierScript.detect(ciImage: ciImage) {
                imageClass = labelReceived
            }
        } else {
            imageIsValid = false
        }
    }
}
