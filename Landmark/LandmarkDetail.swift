//
//  LandmarkDetail.swift
//  SwiftUIDemo
//
//  Created by admin on 2019/10/28.
//  Copyright © 2019 历山大亚. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int{
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    
    var body: some View {
        VStack{
            MapView(coordinate: landmark.locationCoordinate).edgesIgnoringSafeArea(.top).frame(height:300)
                
            CircleImage().offset(y: -130).padding(.bottom,-130)
            VStack(alignment: .leading){
                HStack{
                    Text(verbatim: landmark.name).font(.title).foregroundColor(.green)
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star").foregroundColor(.gray)
                        }
                    }
                }
                HStack(alignment:.top){
                    Text(landmark.park).font(.subheadline).foregroundColor(.red)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
            }.padding()
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LandmarkDetail(landmark: userData.landmarks[0]).environmentObject(userData)
    }
}
