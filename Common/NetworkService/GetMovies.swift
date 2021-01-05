//
//  GetMovies.swift
//  apiAPI
//
//  Created by Азат Киракосян on 21.11.2020.
//

import Foundation


final class ApiService {
    
    // MARK: - Private properties
    
    private var dataTask: URLSessionDataTask?
    
    // MARK: - Public methods
    
    
    func getMovies(api: String, completion: @escaping (NetworkData) -> Void) {
        let urlString = api
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { ( data, _, error ) in
            guard let data = data else { return }
            guard error == nil else { return }

            do {
                let results = try JSONDecoder().decode(NetworkData.self, from: data)

                DispatchQueue.main.async {
                    completion(results)
                }
            } catch {
                print("Json Error")
            }
        } .resume()
    }

}


