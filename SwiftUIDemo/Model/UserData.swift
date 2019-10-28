//
//  UserData.swift
//  SwiftUIDemo
//
//  Created by admin on 2019/10/28.
//  Copyright © 2019 历山大亚. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
