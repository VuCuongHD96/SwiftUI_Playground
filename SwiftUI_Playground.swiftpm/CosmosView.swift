//
//  CosmosView.swift
//  SwiftUI_Playground
//
//  Created by Work on 27/07/2023.
//

import SwiftUI

struct CosmosView: View {
    
    struct Constant {
        static let squareEdge: CGFloat = 50
    }
    
    @State var rating: Double = 3.0
    var starSpacing: CGFloat = 10
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "plus.viewfinder")
                    .onTapGesture {
                        rating -= 0.1
                    }
                Text("rating = \(rating)")
                Image(systemName: "minus.circle")
                    .onTapGesture {
                        rating += 0.1
                    }
            }
            Slider(value: $rating, in: 0...5, step: 0.1)
            starsView
                .overlay(overlayView)//.mask(starsView))
        }
    }
    
    var starsView: some View {
        HStack(spacing: starSpacing) {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: Constant.squareEdge, height: Constant.squareEdge)
            }
        }
    }
    
    var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: calculateWidth())
            }
        }
    }
    
    func calculateWidth() -> CGFloat {
        let naturalParts = Int(rating)
        let decimalPart = rating - Double(naturalParts)
  
        let result1: CGFloat = CGFloat(naturalParts) * Constant.squareEdge
        let result2: CGFloat = CGFloat(naturalParts) * starSpacing
        print("---- debug ------- result2 = ", result2)

        let result3: CGFloat = decimalPart * Constant.squareEdge
        print("---- debug ------- result3 = ", result3)

        return result1 + result2 + result3
    }
}

struct CosmosView_Previews: PreviewProvider {
    
    static var previews: some View {
        CosmosView()
    }
}
