//
//  FeedView.swift
//  Insta_Swipe
//
//  Created by Adrian Suryo Abiyoga on 21/01/25.
//

import SwiftUI

struct FeedView: View {
    @Binding var currentTab: String
    var edges: EdgeInsets
    var body: some View {
        
        VStack{
            
            HStack{
                
                NavigationLink(destination: Text("Destination")) {
                    
                    Image(systemName: "plus.app")
                        .font(.title)
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                Button(action: {
                    currentTab = "Direct"
                }, label: {
                    Image(systemName: "paperplane")
                        .font(.title)
                        .foregroundColor(.primary)
                })
            }
            .padding()
            .overlay(
            
                Text("Instagram")
                    .font(.title2)
                    .fontWeight(.bold)
            )
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    HStack(spacing: 15){
                        
                        Button(action: {}, label: {
                            
                            Image("applelogo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                        })
                            .overlay(
                            
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                    .background(Color.white.clipShape(Circle()))
                                    .offset(x: 8, y: 5)
                                
                                ,alignment: .bottomTrailing
                            )
                    }
                    .padding()
                    
                })
                
                Divider()
                    .padding(.horizontal,-15)
                
                VStack(spacing: 0){
                    
                    // Posts...
                    
                    ForEach(posts){post in
                        
                        // Post View....
                        
                        PostCardView(post: post)
                    }
                }
                .padding(.bottom,65)
            })
        }
        .padding(.top,edges.top)
    }
}



struct PostCardView: View {
    
    var post: Post
    @State var comment = ""
    
    var body: some View{
        
        VStack(spacing: 8){
            
            HStack(spacing: 15){
                
                Image(post.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                Text(post.user)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.primary)
                })
            }
            
            Image(post.postImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 300)
                .cornerRadius(15)
            
            HStack(spacing: 15){
                
                Button(action: {}, label: {
                    Image(systemName: "suit.heart")
                        .font(.system(size: 25))
                })
                
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .font(.system(size: 25))
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 25))
                })
            }
            .foregroundColor(.primary)
            
            (
            
                // Binding Two Texts...
                
                Text("\(post.user)  ")
                    .fontWeight(.bold)
                
                +
                
                    Text(post.postTitle)
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(4)
            
            Button(action: {}, label: {
                Text("View All Comments")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading,4)
            
            HStack(spacing: 15){
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                TextField("Add a comment....", text: $comment)
            }
            .padding(.leading,4)
            
            Text(post.time)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,4)
        }
        .padding()
    }
}

