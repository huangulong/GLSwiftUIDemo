//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by admin on 2019/10/21.
//  Copyright © 2019 历山大亚. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MapView().frame(height:300)
                .edgesIgnoringSafeArea(.top)
            CircleImage().offset(y: -130).padding(.bottom,-130)
            VStack(alignment: .leading){
                Text("Hello Lexandera").font(.title).foregroundColor(.green)
                HStack(alignment:.top){
                    Text("huang gu long").font(.subheadline).foregroundColor(.red)
                    Spacer()
    //                Spacer(minLength: 320)
                    Text("zheng").font(.subheadline)
                }
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
