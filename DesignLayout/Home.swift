//
//  Home.swift
//  DesignLayout
//
//  Created by admin on 2019/11/12.
//  Copyright © 2019 历山大亚. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    var featured:[Landmark] {
        landmarkData.filter({$0.isFeatured})
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    var profileButton : some View {
        Button(action: {
            self.showingProfile.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
            .accessibility(label: Text("User Profile"))
            .padding()
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                FeatureLandmarks(landmarks: featured)
                .scaledToFill()
                    .frame(height: CGFloat(200))
                .clipped()
                .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }.listRowInsets(EdgeInsets())
                NavigationLink(destination: LandmarkList { LandmarkDetail(landmark: $0) }) {
                    Text("See All")
                }
            }.navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
                .sheet(isPresented: $showingProfile) {
                    ProfileHost().environmentObject(self.userData)
            }
        }
    }
}

struct FeatureLandmarks: View {
    var landmarks:[Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
    
    
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(UserData())
    }
}
