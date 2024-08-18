//
//  RequestProtocol.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/10/24.
//

import Foundation

// A struct that holds the logic to call APIs
struct Send<Model: Decodable> {
    /// Send a request to fetch one object
    func networkReq(_ request: URLRequest) async -> (Model?, ErrorModel?) {
        var localData: Data?
        let model: Model?
        let errModel: ErrorModel?
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            localData = data
            model = try JSONDecoder().decode(Model.self, from: localData ?? Data())
            return (model, nil)
        } catch {
            do {
                errModel = try JSONDecoder().decode(ErrorModel.self, from: localData ?? Data())
                return (nil, errModel)
            } catch {
                let err = error as NSError
                return (nil, ErrorModel(cod: "\(err.code)", message: "Something went bad \(err.domain)"))
            }
        }
    }

    /// This takes a closure does not use async / await
    func networkReq(_ request: URLRequest,
                 withCallBack: @escaping (Model?, ErrorModel?) -> Void) {
        URLSession.shared.dataTask(with: request) { data, res, err in
            let localData: Data
            let model: Model?
            let errModel: ErrorModel?
            do {
                if let data {
                    localData = data
                    model = try JSONDecoder().decode(Model.self, from: data)
                    withCallBack(model, nil)
                }
            } catch {
                do {
                    errModel = try JSONDecoder().decode(ErrorModel.self, from: localData)
                    withCallBack(nil, errModel)
                } catch {
                    let err = error as NSError
                    withCallBack(nil, ErrorModel(cod: "\(err.code)", message: "Something went bad \(err.domain)"))
                }
            }
        }.resume()
    }
    
    func fetchWeather(using zipOrCity: String) async -> (WeatherModel?, ErrorModel?) {
        var errorModel: ErrorModel?
        var weatherModel: WeatherModel?
        var zipCodeModel: ZipCodeModel?
        
        let url = Fetch.using(zipOrCity: zipOrCity)
        let request = URLRequest(url: url)
        
        switch zipOrCity.containsNumChars {
        case true:
            (zipCodeModel, errorModel) = await Send<ZipCodeModel>().networkReq(request)
            let lat = zipCodeModel?.lat ?? 0.0
            let lon = zipCodeModel?.lon ?? 0.0
            let urlGeneral = Fetch.using(lat: lat, lon: lon, reqType: .general)
            let requestG = URLRequest(url: urlGeneral)
            (weatherModel, errorModel) = await Send<WeatherModel>().networkReq(requestG)
            return (weatherModel, errorModel)
        case false:
            (weatherModel, errorModel) = await Send<WeatherModel>().networkReq(request)
            return (weatherModel, errorModel)
        }
    }
}
