//
//  ContentView.swift
//  swiftgen-samples
//
//  Created by Heonjin Ha on 2023/03/14.
//

import SwiftUI

struct ContentView: View {

    enum Constant {
        static let title = "Home"
    }

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text(S.body)
                    .padding(.bottom)
                VStack {
                    Text("Name")
                    Image(I.heon.name)
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Image")
                    Image(uiImage: I.heon.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }
            .padding()
            .navigationTitle(S.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
