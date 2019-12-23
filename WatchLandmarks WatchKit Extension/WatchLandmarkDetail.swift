//
//  WatchLandmarkDetail.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by admin on 2019/12/23.
//  Copyright © 2019 历山大亚. All rights reserved.
//

import SwiftUI

struct WatchLandmarkDetail: View {
    
    @EnvironmentObject var userData:UserData
    var landmark: Landmark
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView{
            VStack{
                CircleImage(image: self.landmark.image.resizable()).scaledToFit()
                Text(self.landmark.name).font(.headline).lineLimit(0)
                Toggle(isOn: $userData.landmarks[self.landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                Divider()
                Text(self.landmark.park).font(.caption).bold().lineLimit(0)
                Text(self.landmark.state).font(.caption)
                Divider()
                WatchMapView(landmark: self.landmark).scaledToFit().padding()
            }.padding(16)
        }.navigationBarTitle("Landmarks")
    }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        WatchLandmarkDetail(landmark: UserData().landmarks[0])
    }
}
