//
//  ContentView.swift
//  Matched-Geo
//
//  Created by Farangis on 6/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isProfileExpanded = false
    @Namespace private var profileAnimation

    var body: some View {
        VStack {
            if isProfileExpanded {
                expandedProfileView
            } else {
                collapsedProfileView
            }
            videoList
        }
    }

    var collapsedProfileView: some View {
        HStack {
            profileImage
                .matchedGeometryEffect(id: "Image", in: profileAnimation)
                .frame(width: 60, height: 60)

            VStack(alignment: .leading) {
                Text("Farangis Makh")
                    .font(.title).bold()
                    .matchedGeometryEffect(id: "Name", in: profileAnimation)

                Text("iOS Developer")
                    .foregroundColor(.secondary)
                    .matchedGeometryEffect(id: "Job", in: profileAnimation)
            }

            Spacer()
        }
        .padding()
    }

    var expandedProfileView: some View {
        VStack {
            profileImage
                .matchedGeometryEffect(id: "Image", in: profileAnimation)
                .frame(width: 130, height: 130)

            VStack {
                Text("Farangis Makh")
                    .font(.title).bold()
                    .matchedGeometryEffect(id: "Name", in: profileAnimation)

                Text("iOS Developer")
                    .foregroundColor(.pink)
                    .matchedGeometryEffect(id: "Job", in: profileAnimation)

                Text("I went full-time professional iOS developing in March of 2022. I am committed to continuous learning and follow the latest trends in iOS development to keep up to date with new features and technologies.")
                    .lineLimit(10)
                    .padding()
            }
        }
        .padding()
    }

    var profileImage: some View {
        Image("farangis-avatar")
            .resizable()
            .clipShape(Circle())
            .onTapGesture {
                withAnimation(.spring()) {
                    isProfileExpanded.toggle()
                }
            }
    }

    var videoList: some View {
        List {
            ForEach(0...10, id: \.self) { _ in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 180)
                        .foregroundColor(.gray.opacity(0.2))

                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .opacity(0.3)
                }
                .padding(.vertical)

            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
