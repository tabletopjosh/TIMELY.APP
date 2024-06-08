import SwiftUI

struct HomeView: View {
    @State private var currentTab: String = "house.fill"
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, World!")
                .foregroundColor(.white)
            Spacer()
            TabBar(currentTab: $currentTab)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct TabBar: View {
    @Binding var currentTab: String
    
    var body: some View {
        HStack {
            Spacer()
            TabBarButton(systemImage: "square.fill.text.grid.1x2", destination: AnyView(TimeChartView()), currentTab: $currentTab)
            Spacer()
            TabBarButton(systemImage: "bubble.left.and.text.bubble.right.fill", destination: AnyView(ChatView()), currentTab: $currentTab)
            Spacer()
            TabBarButton(systemImage: "house.fill", destination: AnyView(HomeView()), currentTab: $currentTab)
            Spacer()
            TabBarButton(systemImage: "person.2.fill", destination: AnyView(FriendsView()), currentTab: $currentTab)
            Spacer()
            TabBarButton(systemImage: "person.circle", destination: AnyView(ProfileView()), currentTab: $currentTab)
            Spacer()
        }
        .padding()
    }
}

struct TabBarButton: View {
    var systemImage: String
    var destination: AnyView
    @Binding var currentTab: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            Image(systemName: systemImage)
                .font(.title)
                .foregroundColor(currentTab == systemImage ? .white : .gray.opacity(0.7))
        }
        .onTapGesture {
            currentTab = systemImage
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

struct TimeChartView: View {
    var body: some View {
        Text("Time Chart View")
    }
}

struct ChatView: View {
    var body: some View {
        Text("Chat View")
    }
}

struct FriendsView: View {
    var body: some View {
        Text("Friends View")
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
