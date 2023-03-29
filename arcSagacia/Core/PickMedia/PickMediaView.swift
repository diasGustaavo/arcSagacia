//
//  PickMediaView.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 27/03/23.
//

import SwiftUI
import PhotosUI

struct PickMediaView: View {
    @ObservedObject var viewModel: HomeModelView
    
    @State private var showCamera = false
    @State private var showPhotos = false
    
    var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            
            Button(action: {
                showCamera = true
            }, label: {
                Image(systemName: "camera")
                
                Text("Câmera")
            })
            .font(.system(size: 20))
            .padding(.bottom, 40)
            .padding(.top, 20)
            
            Spacer()
            
            Button {
                showPhotos = true
            } label: {
                Image(systemName: "photo.stack")
                
                Text("Galeria")
            }
            .font(.system(size: 20))
            .padding(.bottom, 40)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.theme.foregroundColor)
        .foregroundColor(.white)
        .cornerRadius(20)
        // CAMERA VIEW
        .sheet(isPresented: $showCamera, onDismiss: {
            processPhotoDismiss()
        }) {
            ImagePicker(sourceType: .camera, selectedImages: $viewModel.selectedImages)
        }
        // PHOTOS VIEW
        .sheet(isPresented: $showPhotos, onDismiss: {
            processPhotoDismiss()
        }) {
            PhotoPicker(images: $viewModel.selectedImages)
        }
    }
    
    func processPhotoDismiss() {
        if !viewModel.selectedImages.isEmpty {
            viewModel.images = viewModel.selectedImages
            viewModel.isImageValid()
        }
    }
}

struct PickMediaView_Previews: PreviewProvider {
    static var previews: some View {
        PickMediaView(viewModel: HomeModelView())
    }
}
