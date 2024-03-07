//
//  ProfileView.swift
//  toDoList
//
//  Created by Mau on 26/2/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    // Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    // Info: Name, Email, Member since
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding()
                        
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding()
                        
                        HStack {
                            Text("Member Since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
                        }
                        .padding()
                    }
                    .padding()
                    
                    // Sing out
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .foregroundColor(Color(.red))
                    .padding()
                    
                    Spacer()
                }else {
                    Text("Loading Profile...")
                }
                
            }.navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
