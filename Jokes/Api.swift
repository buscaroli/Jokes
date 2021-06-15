//
//  Api.swift
//  Jokes
//
//  Created by Matteo on 15/06/2021.
//

import Foundation

class Api {
    func getJokes(completion: @escaping ([Joke]) -> ()) {
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=twopart&amount=5") else { return }
        
        var jokes = [Joke]()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching the Jokes: \(error).")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error connecting to the Server.")
                return
            }
            
            if let data = data {
                do {
                    let jokesContainer = try JSONDecoder().decode(Jokes.self, from: data)
                    jokes = jokesContainer.jokes
                    
                    DispatchQueue.main.async {
                        completion(jokes)
                    }
                } catch let jsonError as NSError {
                    print("Error decoding JSON: \(jsonError.localizedDescription).")
                }
            }
            
        }
        .resume()
    }
}
