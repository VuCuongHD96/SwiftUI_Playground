//
//  NavigationViewFullColor.swift
//  SwiftUI_Playground
//
//  Created by Work on 14/09/2023.
//

import SwiftUI

struct NavigationViewFullColor: View {
    
    init() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .red
        let navigationBar = UINavigationBar.appearance()
        navigationBar.scrollEdgeAppearance = barAppearance
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach((1..<50), id:\.self) { _ in
                        NavigationLink {
                            Text("desti")
                        } label: {
                            Text("djkasdjaskd")
                                .navigationTitle("This is title")
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }
            }
        }
    }
}

struct NavigationViewFullColor_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewFullColor()
    }
}
