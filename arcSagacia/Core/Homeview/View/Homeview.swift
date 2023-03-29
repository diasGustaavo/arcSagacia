//
//  ContentView.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 27/03/23.
//

import SwiftUI

struct Homeview: View {
    @StateObject var photoModel = HomeModelView()
    
    var body: some View {
        ZStack {
            Color(UIColor(Color.theme.backgroundColor)).ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("arcSagacia")
                    .padding(.top, 40)
                    .padding(.bottom, 10)
                    .font(.system(size: 35, weight: .bold))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.theme.foregroundColor)
                    .foregroundColor(.white)
                
                if photoModel.imageIsValid {
                    ScrollView {
                        Image(uiImage: photoModel.images[0])
                            .resizable()
                            .frame(height: 300)

                        Text("\(photoModel.imageClass)")
                            .font(.system(size: 35, weight: .bold))
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Color.theme.basicTextColor)

                        Text("\(photoModel.imageDescription)")
                            .font(.system(size: 22, weight: .regular))
                            .padding(.all)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Color.theme.basicTextColor)
                    }
                } else {
                    ScrollView {
                        Image("copan")
                            .resizable()
                            .frame(height: 300)

                        Text("Modernista")
                            .font(.system(size: 35, weight: .bold))
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Color.theme.basicTextColor)

                        Text("\(photoModel.arcDescriptions[2])")
                            .font(.system(size: 22, weight: .regular))
                            .padding(.all)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(Color.theme.basicTextColor)
                    }
                }
                
                Spacer()
                    
                PickMediaView(viewModel: photoModel)
            }
            .ignoresSafeArea()
        }
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
