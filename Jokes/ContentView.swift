//
//  ContentView.swift
//  Jokes
//
//  Created by Matteo on 15/06/2021.
//
// Learning how to connect to an API and update a View.
// Learning how to decode nested JSON data.
//
//

import SwiftUI

struct ContentView: View {
    @State var listOfJokes: [Joke] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("10 Jokes for You")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.yellow)
                
                List(listOfJokes) { joke in
                    VStack(spacing: 10) {
                        Text(joke.setup)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Text(joke.delivery)
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Api().getJokes { jokes in
                            self.listOfJokes = jokes
                        }
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            
                    }
                }
            }
            
        }
        .onAppear {
            Api().getJokes { jokes in
                self.listOfJokes = jokes
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
