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
    let baseImageUrl = "https://image.tmdb.org/t/p/w500"
}

enum APIURLs {
    
    static func popularMovies(page: Int) -> String {
    "https://api.themoviedb.org/3/movie/popular?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US&page=\(page)"
    }
    
    static func topRatedMovies(page: Int) -> String {
    "https://api.themoviedb.org/3/movie/top_rated?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US&page=\(page)"
    }
    
    static func latestMovies(page: Int) -> String {
      "https://api.themoviedb.org/3/movie/now_playing?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US&page=\(page)"
    }
}
