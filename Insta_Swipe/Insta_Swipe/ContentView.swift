//
//  ContentView.swift
//  Insta_Swipe
//
//  Created by Adrian Suryo Abiyoga on 21/01/25.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {

        NavigationView{
     
            GeometryReader{proxy in

                MainView(edges: proxy.safeAreaInsets)
                    .ignoresSafeArea()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
