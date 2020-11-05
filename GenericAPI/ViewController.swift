//
//  ViewController.swift
//  GenericAPI
//
//  Created by Ebrahim  Mo Gedamy on 10/23/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api : UsersAPIProtocol = UserApi()
        api.didLogined { (response) in
            switch response {
            case .success(let data):
                guard let users = data?.data else { return }
                print("data : \(users)")
            case .failure(_):
                print("ERROR")
            }
        }
        //        fetchData(url: "https://jsonplaceholder.typicode.com/users", responseClass: [UserModel].self) { (response) in
        //            switch response {
        //            case .success(let users):
        //                guard let users = users else { return }
        //                for user in users {
        //                    print("userName -> \(user.userName ?? "soma")")
        //                }
        //            case .failure(_):
        //                print("ERROR")
        //            }
        //        }
    }
}


func fetchData <T:Codable>(url:String,responseClass: T.Type ,completion:@escaping (Result<T?, NSError>) -> Void) {
    guard let url = URL(string: url) else { return }
    AF.request(url, method: .get, parameters: [:], headers: [:]).responseJSON { (response) in
        guard let statusCode = response.response?.statusCode else { return }
        if statusCode == 200 { // Success
            guard let jsonResponse = try? response.result.get() else { return }
            guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else { return }
            guard let responseObj = try? JSONDecoder().decode(T.self, from: theJSONData) else { return }
            completion(.success(responseObj))
        }
    }
}


