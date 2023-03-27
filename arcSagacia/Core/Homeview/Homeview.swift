//
//  ContentView.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 27/03/23.
//

import SwiftUI

struct Homeview: View {
    @StateObject var photoModel = PickMediaModelView()
    
    var body: some View {
        VStack {
            Spacer()
            
            if photoModel.imageIsValid {
                Image(uiImage: photoModel.images[0])
            }
            
            Text("This is a Neogothic building 🏛️")
                
            PickMediaView(viewModel: photoModel)
        }
        .padding()
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
