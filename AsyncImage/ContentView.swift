//
//  ContentView.swift
//  AsyncImage
//
//  Created by Sarath P on 06/07/22.
//

import SwiftUI

extension Image {
    
    func adjustImage() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func adjustIconImage() -> some View {
        self
            .adjustImage()
            .foregroundColor(.purple)
            .frame(maxWidth: 250)
            .opacity(0.5)
    }
    
}

struct ContentView: View {
    
    private let imageURL = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
        //MARK: -BASICS
        
//        AsyncImage(url: URL(string: imageURL))
        
        //MARK: -SCALE
//        AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        //MARK: -PLACEHOLDER
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image
//                .adjustImage()
//
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .adjustIconImage()
//        } .padding()
//
        //MARK: - PHASE
//        AsyncImage(url: URL(string: imageURL))  { phase in
//
//                //Success
//            if let image = phase.image {
//                image
//                    .adjustImage()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill")
//                    .adjustIconImage()
//            } else {
//                Image(systemName: "photo.circle.fill")
//                    .adjustIconImage()
//            }
////
////
//        }
        
        //MARK: -ANIMATION
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.adjustImage()
//                    .transition(.move(edge: .top))
//                    .transition(.slide)
                    .transition(.scale)
            case.failure(_):
                Image(systemName: "ant.circle.fill").adjustIconImage()
            case.empty:
                Image(systemName: "photo.circle.fill").adjustIconImage()
            @unknown default:
                ProgressView()
            }
        } .padding(40)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 mini")
    }
}
