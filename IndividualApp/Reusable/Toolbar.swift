//
//  Toolbar.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 04/12/24.
//

import SwiftUI

struct Toolbar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var dimBackButtom : CGFloat = 70
    
    var onDone: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            headerSection
            Divider()
        }
    }
    
    var headerSection : some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.purple)
                    Text("Back")
                        .font(.system(size: 18))
                        .foregroundStyle(.purple)
                }
                .frame(maxWidth: dimBackButtom)
            }
            
            Spacer()
            
            Text("")
                .bold()
                .font(.system(size: 18))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            if onDone != nil {
                Button(action: onDone ?? {}) {
                    Text("Done")
                        .font(.system(size: 18))
                }
                .frame(maxWidth: dimBackButtom)
            } else {
                Spacer()
                    .frame(maxWidth: dimBackButtom) // Larghezza del pulsante "Back" per bilanciare
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 30)
        .padding(.horizontal, 10)
        
    }
}

#Preview {
    Toolbar()
}

