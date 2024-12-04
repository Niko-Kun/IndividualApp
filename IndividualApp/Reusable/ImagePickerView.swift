//
//  ImagePickerView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 04/12/24.
//


import SwiftUI
import PhotosUI

struct ImagePickerView: View {
    @State private var selectedImage: UIImage?
    @State private var isPickerPresented = false
    
    var body: some View {
        VStack {
            Button(action: {
                isPickerPresented = true
            }) {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(width: 300, height: 300)
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 100, height: 100)
                        
                }
            }
            .sheet(isPresented: $isPickerPresented) {
                PhotoPicker(selectedImage: $selectedImage)
            }
        }
    }
}

#Preview {
    ImagePickerView()
}
