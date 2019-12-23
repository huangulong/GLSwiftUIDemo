//
//  ContentView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by admin on 2019/12/23.
//  Copyright © 2019 历山大亚. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList { WatchLandmarkDetail(landmark: $0)}.environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
