//
//  HikeView.swift
//  ShapePath
//
//  Created by admin on 2019/10/29.
//  Copyright © 2019 历山大亚. All rights reserved.
//

import SwiftUI

struct HikeView: View {
    
    var hike:Hike
    @State private var showDetail = true
    
    var transition:AnyTransition{
        let insertion = AnyTransition.move(edge: .trailing)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    
    var body: some View {
        
        VStack{
            HStack {
                HikeGraph(hike: hike, path: \.pace).frame(width: 50, height: 30, alignment: .leading)
                VStack(alignment: .leading) {
                    Text(verbatim: hike.name).font(.headline)
                    Text(verbatim: hike.distanceText)
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }
            if showDetail {
                HikeDetail(hike: hike).transition(transition)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: hikeData[1]).padding()
            Spacer()
        }
    }
}
