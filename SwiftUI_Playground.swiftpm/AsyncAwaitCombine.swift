//
//  AsyncAwaitCombine.swift
//  SwiftUI_Playground
//
//  Created by Work on 29/07/2023.
//

import SwiftUI

enum MyError: Error {
    case noInternet
}

struct MyAPI {
    func getError() async throws -> String {
        throw MyError.noInternet
    }
    
    func getCategory() async throws -> String {
        return "this is data"
    }
}

class ViewModel: ObservableObject {
    
    @Published var category = String()
    
    func onAppear() async {
        do {
            category = try await MyAPI().getCategory()
        } catch {
            print(error)
        }
    }
}

struct AsyncAwaitCombine: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        Text("Data = \(vm.category)")
            .onAppear {
                Task {
                    await vm.onAppear()
                }
            }
    }
}

struct AsyncAwaitCombine_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitCombine()
    }
}
