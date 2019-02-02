//
//  APIClient.swift
//  week4
//
//  Created by 蔡佳宣 on 2019/2/2.
//  Copyright © 2019年 蔡佳宣. All rights reserved.
//

import Foundation

class StationAPIClient {
   
    let decoder = JSONDecoder()
    let session: URLSession
    
    init(configuration: URLSessionConfiguration){
        self.session = URLSession(configuration: configuration)
    }
    convenience init() {
        self.init(configuration: .default)
    }
    typealias StationCompletionHandler = (Information?, Error?) -> Void
    typealias CurrentStationCompletionHandler = (Information?, Error?) -> Void
    
   func getStation(completionHandler completion: @escaping StationCompletionHandler) {
        
        guard let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json") else {
            completion(nil, StationError.invalidUrl)
            return
        }
    
        let request = URLRequest(url: url)
        
    let task = session.dataTask(with: request) {data, response, error in
        DispatchQueue.main.async {
            if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                    completion(nil, StationError.requestFailed)
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    do {
                        let station = try self.decoder.decode(Information.self, from: data)
                        completion(station, nil)
                      
                    } catch let error {
                        
                        completion(nil, error)
                    }
                } else {
                    completion(nil, StationError.invalidData)
                    
                }
            } else if let error = error {
                completion(nil, error)
            }
        }
    }
    
    task.resume()
    }

}


