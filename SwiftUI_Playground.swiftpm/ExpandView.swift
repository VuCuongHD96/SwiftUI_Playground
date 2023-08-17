//
//  ExpandView.swift
//  SwiftUI_Playground
//
//  Created by Work on 17/08/2023.
//

import SwiftUI

protocol SubItemType {
    
    associatedtype ItemType
    
    var array: [ItemType] { get set }
}

struct ColorList: SubItemType {
    typealias ItemType = Color
    
    var array: [ItemType]
    
    init() {
        self.array = [.blue, .black, .red, .gray, .green]
    }
}

struct ColorListView: View {
    
    let list = ColorList()
    
    var body: some View {
        HStack {
            ForEach(list.array, id: \.self) { value in
                Circle()
                    .fill(value)
            }
        }
    }
}

struct CityList: SubItemType {
    typealias ItemType = String
    
    var array: [ItemType]
    
    init() {
        self.array = ["Tokyo", "ABC"]
    }
}

struct CityListView: View {
    
    let list = CityList()
    
    var body: some View {
        VStack {
            ForEach(list.array, id: \.self) { value in
                Text(value)
            }
        }
    }
}

struct ExpandableItem: Identifiable {
    let id = UUID()
    let title: String
    var expand: Bool
    let subItems: any SubItemType
}

struct ExpandView: View {
    
    // Sample data
    @State var items = [
        ExpandableItem(title: "Item 1", expand: true,
                       subItems: ColorList()),
        ExpandableItem(title: "Item 2", expand: false,
                       subItems: CityList()),
    ]

    var body: some View {
        ScrollView {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                VStack {
                    Text(item.title)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            items[index].expand.toggle()
                        }
                    if item.expand {
                        switch item.subItems {
                        case is ColorList:
                            ColorListView()
                        case is CityList:
                            CityListView()
                        default:
                            EmptyView()
                        }
                    }
                }
            }
        }
    }
}

struct ExpandView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandView()
    }
}
