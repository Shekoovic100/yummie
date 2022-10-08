//
//  NetworkService.swift
//  Yammie
//
//  Created by sherif on 13/09/2022.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    
    func fetchAllCategories(completion:@escaping(Result<AllDishes,Error>)-> Void){
        
        Request(route: .fetchAllCategories, method: .get, completion: completion)
    }
    
    func placeOrder(dishId:String,name:String,completion:@escaping(Result<Orders,Error>)-> Void){
        let params = ["name":name]
        Request(route: .placeOrder(dishId), method: .post, parameters: params, completion: completion)
    }
    
    func fetchCategoryDishes(categoryId :String,completion:@escaping(Result<[Dish],Error>)-> Void){
    
        Request(route: .FetchDishesbyCategory(categoryId), method: .get,completion: completion)
    }
    
    func fetchOrders(completation:@escaping(Result<[Orders],Error>)-> Void){
        
        Request(route: .FetchOrders, method: .get, completion: completation)
    }
    
    
    private func Request<T:Decodable>(route:Route,
                                    method:Method,
                                    parameters:[String:Any]? = nil,
                                    completion: @escaping(Result<T,Error>)->Void){
        guard let request = createUrl(route: route, method: method, parameters: parameters)else{
            completion(.failure(AppError.unknownError))
            return
        }
        URLSession.shared.dataTask(with: request) { data, resposne , error in
            
            var result:Result<Data,Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "The data could Be saginified"
                print("The response is :\(responseString)")
            }else if let error = error {
                result = .failure(error)
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
        
    }
    
    // func to handle result and decoded data using the native way
    private func handleResponse<T:Decodable>(result:Result<Data,Error>?
                                             ,completion:(Result<T,Error>)->Void){
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result{
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data)else{
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
            }
            if let decodedData = response.data {
                completion(.success(decodedData))
            }else{
                completion(.failure(AppError.errorDecoding))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    /// To create UrlRequest url session (Native way )
    /// - Parameters:
    ///   - route: An Enum for Route that contain base url and is also path to resources
    ///   - method: An Enum that contain type of mthod you will used
    ///   - parameters: that if func like post data from server take data
    /// - Returns: our wanted url request
    
    private func createUrl(route:Route,
                           method:Method,
                           parameters:[String:Any]? = nil)->URLRequest?{
        
        let urlString = Route.baseUrl + route.decription
        guard let url = urlString.asUrl else {return nil}
        var  urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map({ URLQueryItem(name: $0, value: "\($1)")})
                urlRequest.url  = urlComponent?.url
            case .post,.delete,.patch:
                let serverData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = serverData
            }
        }
                
        return urlRequest
    }
    
    
}
