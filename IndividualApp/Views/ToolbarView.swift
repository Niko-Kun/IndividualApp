//
//  ToolbarView.swift
//  IndividualApp
//
//  Created by Nicolò Amabile on 03/12/24.
//


import SwiftUI

struct ToolbarView: View {
    var body: some View {
        VStack {
            TabView(selection: .constant(0)) {
                EmptyView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("")
                    }
                EmptyView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("")
                    }
                EmptyView()
                    .tabItem {
                        Image(systemName: "plus")
                        Text("")
                    }
            }
        }
    }
}

#Preview {
    ToolbarView()
}
