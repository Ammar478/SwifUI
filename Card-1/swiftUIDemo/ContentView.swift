
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemOrange).edgesIgnoringSafeArea(.all)
            VStack{
                Image("ammar").resizable().aspectRatio(contentMode: .fit).frame(width: 200,height: 150).clipShape(Circle()).overlay(Circle().stroke(Color.black,lineWidth: 0.4 ))
                Text("Ammar Ahmed").font(Font.custom("Pacifico-Regular", size: 41)).bold()
                Text("Full Stuck Developer")
                Divider()
                InfoView(text: "0555998328", icon: "phone.fill")
                InfoView(text: "amar.aa32@gmail.com", icon: "envelope.fill")
                                
            }
           
        }
        
    }
}

#Preview {
    ContentView()
}

