//
//  UserView.swift
//  GitHub_V2_Test
//
//  Created by jointree on 2024/02/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserView: View {
    let user: Item
    
    var body: some View {
        VStack {
            //AsyncImage(url: URL(string: user.avatar_url))
            WebImage(url: URL(string: user.avatar_url))
            Text("Name : " + user.login)
            Text("Id : " + "\(user.id)")
            Text("Bio : " + user.subscriptions_url.description)
            Text("Following : " + "\(user.following_url.count)")
            Text("Follower : " + "\(user.followers_url.count)")
        }
    }
}
