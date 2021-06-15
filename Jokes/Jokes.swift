//
//  Jokes.swift
//  Jokes
//
//  Created by Matteo on 15/06/2021.
//

import Foundation

struct Jokes: Codable {
    var jokes: [Joke]
}

struct Joke: Codable, Identifiable {
    let id: Int
    let setup: String
    let delivery: String
    
}
