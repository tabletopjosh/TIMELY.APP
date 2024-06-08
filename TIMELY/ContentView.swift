import SwiftUI

struct ContentView: View {
    @State private var currentView: String? = "home"
    
    var body: some View {
        NavigationView {
            VStack {
                if currentView == "home" {
                    HomeView(currentView: $currentView)
                } else {
                    ZStack {
                        // Set the background color to black
                        Color.black.edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            Spacer()
                            
                            // Welcome text on top of the image
                            Text("Welcome")
                                .font(.custom("Poppins-Black", size: 24))
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                                            
                            // Image in the middle
                            Image("Roam")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 400, height: 400)
                                .padding(.bottom, 20)

                            
                            // NavigationLink for the button
                            Button(action: {
                                currentView = "home"
                            }) {
                                Text("Continue")
                                    .font(.custom("Poppins-Black", size: 18))
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 200) // Make the button a bit wider
                                    .background(Color.white)
                                    .cornerRadius(10)
                                
                            }
                            .buttonStyle(PlainButtonStyle()) // Ensure the button behaves like a button
                            
                            Spacer()
                        }
                    }
                    .navigationBarHidden(true)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
