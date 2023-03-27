//
//  PostModelView.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 22/02/23.
//

import SwiftUI
import PhotosUI

@MainActor class PickMediaModelView: ObservableObject {
    @Published var selectedImages = [UIImage]()
    @Published var images = [UIImage]()
    @Published var imageIsValid = false
    
    func isImageValid() {
        if(!images.isEmpty) {
            imageIsValid = true
        } else {
            imageIsValid = false
        }
    }
}
