//
//  ContentView.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 27/03/23.
//

import SwiftUI

struct Homeview: View {
    @StateObject var viewModel = HomeModelView()
    
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
                
                if viewModel.isLoading {
                    VStack {
                        Spacer()
                        
                        Spinner(lineWidth: 5, height: 60, width: 60)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Text("Analyzing photo")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Spacer()
                    }
                } else {
                    if viewModel.imageIsValid {
                        ScrollView {
                            Image(uiImage: viewModel.images[0])
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
                                .clipped()

                            Text("\(viewModel.imageClass)")
                                .font(.system(size: 35, weight: .bold))
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(Color.theme.basicTextColor)

                            Text("\(viewModel.imageDescription)")
                                .font(.system(size: 18, weight: .regular))
                                .padding(.all)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(Color.theme.basicTextColor)
                        }
                        .transition(.move(edge: .bottom))
                    } else {
                        ScrollView {
                            Image("copan")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
                                .clipped()

                            Text("Modernista")
                                .font(.system(size: 35, weight: .bold))
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(Color.theme.basicTextColor)

                            Text("\(viewModel.arcDescriptions[2])")
                                .font(.system(size: 18, weight: .regular))
                                .padding(.all)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(Color.theme.basicTextColor)
                        }
                    }
                }
                
                Spacer()
                    
                PickMediaView(viewModel: viewModel)
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
