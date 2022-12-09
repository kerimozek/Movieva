//
//  NetworkHelper.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import Foundation

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Invalid URL"
    case generalError = "An Error Happened"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    let baseUrl = "https://api.themoviedb.org/3/movie/"
    let apiKey = "fd24fe5ba58021d3f54a2a7c04297951"
    let baseImageUrl = "https://image.tmdb.org/t/p/w200"
    let baseBackImageUrl = "https://image.tmdb.org/t/p/w500"
}

let apiKey = "fd24fe5ba58021d3f54a2a7c04297951"

enum APIURLs {
    
    static func popularMovies(page: Int) -> String {
    "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=\(page)"
    }
    
    static func topRatedMovies(page: Int) -> String {
    "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)&language=en-US&page=\(page)"
    }
    
    static func latestMovies(page: Int) -> String {
      "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=en-US&page=\(page)"
    }
    
    static func upcomingMovies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&language=en-US&page=\(page)"
    }
    
    static func review(movieID: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(movieID)/reviews?api_key=\(apiKey)&language=en-US&page=1"
    }
    
    static func movieDetail(movieID: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(apiKey)&language=en-US"
    }
    
    static func cast(movieID: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(apiKey)&language=en-US"
    }
}
