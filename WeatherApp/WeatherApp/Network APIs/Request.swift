//
//  Request.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import Foundation

/// Defines basic guidelines for a request object to follow
protocol RequestProtocol {
    associatedtype Model
    func send<Model: Decodable>(_ request: URLRequest) async -> Model?
    func send<Model: Decodable>(_ request: URLRequest) async -> [Model]?
    var headers: [String: String] { get set }
}

extension RequestProtocol {
    /// This is a generic request used when we want to fetch one object
    /// - Parameter request: Parameter that is passed with the headers
    /// - Returns: Fetches an object of data expected from the request
    func send<Model: Decodable>(_ request: URLRequest) async -> Model? {
        do {
            let (data, resp) = try await URLSession.shared.data(for: request)
            let model = try JSONDecoder().decode(Model.self, from: data)
            return model
        } catch {
            //TODO: Handle errors
#if DEBUG
            print("This is what went wrong in an object request: \(error)")
#endif
        }
        
        return nil
    }
    
    ///  This is a generic request used when we want an array of data compared to one object
    /// - Parameter request: Parameter that is passed with the headers
    /// - Returns: Fetches array of data expected from the request
    func send<Model: Decodable>(_ request: URLRequest) async -> [Model]? {
        do {
            let (data, resp) = try await URLSession.shared.data(for: request)
            let model = try JSONDecoder().decode([Model].self, from: data)
            return model
        } catch {
            //TODO: Handle errors
#if DEBUG
            print("This is what went wrong in an array of object request: \(error)")
#endif
        }
        
        return nil
    }
}
