//
//  PickMediaView.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 27/03/23.
//

import SwiftUI
import PhotosUI

struct PickMediaView: View {
    @ObservedObject var viewModel: PickMediaModelView
    
    @State private var showCamera = false
    @State private var showPhotos = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Button(action: {
                    showCamera = true
                }, label: {
                    HStack {
                        Image(systemName: "camera")
                        
                        Text("Camera")
                    }
                    .padding(.top, 10)
                })
                
                Divider()
                    .background(Color.theme.accentTextColor)
                
                Button {
                    showPhotos = true
                } label: {
                    HStack {
                        Image(systemName: "photo.stack")
                        
                        Text("Photos")
                    }
                    .padding(.bottom, 10)
                }
                
            }
            .padding(.horizontal)
            .frame(maxWidth: 130)
            .background(Color.theme.foregroundColor)
            .foregroundColor(Color.theme.accentTextColor)
            .cornerRadius(16)
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
            
            Spacer()
                .frame(height: 50)
        }
        .transition(.move(edge: .bottom))
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
        PickMediaView(viewModel: PickMediaModelView())
    }
}
