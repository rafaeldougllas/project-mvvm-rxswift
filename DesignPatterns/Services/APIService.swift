//
//  APIService.swift
//  DesignPatterns
//
//  Created by Rafael Douglas on 07/07/21.
//

import Foundation

class APIService :  NSObject {
    
    func apiToGetEmployeeData(completion : @escaping (Employees) -> ()){
        guard let url = URL(string: "http://dummy.restapiexample.com/public/api/v1/employees") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if error != nil || data == nil {
                    print("Client error!")
                    return
                }

                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }

                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }
                // we have good data – go back to the main thread
                DispatchQueue.main.async {
                    // update our UI
                    do {
                        let empData = try! JSONDecoder().decode(Employees.self, from: data!)
                        completion(empData)
                    } catch {
                        print("JSON error: \(error.localizedDescription)")
                    }
                }
        }
        task.resume()
    }
}

