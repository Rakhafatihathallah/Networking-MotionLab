//
//  HomeView.swift
//  Networking-MotionLab
//
//  Created by Rakha Fatih Athallah on 14/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                switch viewModel.users {
                case .success:
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.users.value ?? [], id:\.id) { user in
                            userRow(user)
                        }
                    }
                case .loading:
                    ProgressView()
                default:
                    EmptyView()
                }
            }
            .refreshable {
                Task {
                    await viewModel.getAllUser()
                }
            }
            .onAppear {
                Task {
                    await viewModel.getAllUser()
                }
            }
        }
    }
}

extension HomeView {
    @ViewBuilder
    func userRow(_ user: User) -> some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: user.avatar ?? "https://reqres.in/img/faces/7-image.jpg")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    }
                }
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(alignment: .leading) {
                    Text(user.fullName)
                        .font(.headline)
                        .foregroundColor(.primary)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
