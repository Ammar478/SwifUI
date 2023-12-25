

import SwiftUI

struct ContentView: View {
    
    @State private var users:Users?
    var body: some View {
        VStack {
            List{
                ForEach(users?.users ?? [],id:\.id){ user in
                    HStack{
                        Text(user.fullName).bold()

                    }
                    .padding()
                    .hoverEffect(.lift)
                    
                   
                }
            }
        }
        .task {
            do{
                users =  try await getUsers()
            }catch UserError.invalidData{
                print("Error InvalidDate")
            }catch UserError.invalidResponse{
                print ("Error Invalid Response")
            }catch UserError.invalidURL{
                print("Error Invalid Url")
            }catch{
                print("Unexpected error")
            }
         
        }
    }
}

#Preview {
    ContentView()
}
