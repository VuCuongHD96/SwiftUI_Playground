//
//  MultiNavigationLink.swift
//  SwiftUI_Playground
//
//  Created by Work on 01/08/2023.
//

import SwiftUI

struct MultiNavigationLink: View {
    
    let array = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
    var body: some View {
        ForEach(array, id: \.self) { item in
            NavigationLink {
                Text("Nơi đến \(item)")
            } label: {
                Text(item)
            }
            .font(.title)
            
            // thêm cái này vào
            NavigationLink(destination: EmptyView()) {
                EmptyView()
            }
        }
    }
}

struct MultiNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        MultiNavigationLink()
    }
}
