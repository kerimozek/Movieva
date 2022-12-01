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
