//
//  ContentView.swift
//  swfitDemo2
//
//  Created by Admin on 2020/9/3.
//  Copyright © 2020 Admin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(0 ..< 10) {
            Text("第\($0)行")
                .font(Font.system(size: 20))
                .foregroundColor(Color(UIColor.green))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
