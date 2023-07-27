//
//  PushOrNavigate.swift
//  SwiftUI_Playground
//
//  Created by Work on 27/07/2023.
//

import SwiftUI


struct PushOrNavigate: View {
    
    @State var showModal = false
    
    var body: some View {
        VStack {
            Text("Hello, world!")
            Button {
                showModal = true
            } label: {
                Text("Present DetailView")
            }
            
            NavigationLink(destination: DetailView()) {
                Text("Go to detail view")
            }
        }
        .navigationTitle("ABC")
        .sheet(isPresented: $showModal, content: {
            DetailView()
        })
    }
}

struct PushOrNavigate_Previews: PreviewProvider {
    static var previews: some View {
        PushOrNavigate()
    }
}

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Detail view")
            .onAppear {
                if presentationMode.wrappedValue.isPresented {
                    print("This view was Present")
                } else {
                    print("This view was navigated to")
                }
            }
            .background(Color.red)
    }
}
