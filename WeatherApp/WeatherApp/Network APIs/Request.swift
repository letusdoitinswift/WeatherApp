//
//  RequestProtocol.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/10/24.
//

import Foundation

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
                print("Request which has the issues: \(Model.self) :\(request)")
                print("Something went wrong in an object request: \(error)")
                return (nil, errModel)
            } catch {
                print("Request which has the issues: \(Model.self) :\(request)")
                print("Something went wrong in an object request: \(error)")
            }
        }
        return (nil, nil)
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
                    print("Request which has the issues: \(Model.self) :\(request)")
                    print("Something went wrong in an object request: \(error)")
                    withCallBack(nil, errModel)
                } catch {
                    print("Request which has the issues: \(Model.self) :\(request)")
                    print("Something went wrong in an object request: \(error)")
                }
            }
        }.resume()
    }
}
