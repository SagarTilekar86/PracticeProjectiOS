//
//  API.swift
//  API
//

import Foundation

protocol API {
    init(session: URLSessionProtocol)

    func fetchUsers(excludingUserWithID: String?, success: @escaping (UsersList) -> Void, failure: @escaping (FetchError) -> Void)
}

extension API {
//    static func make() -> API {
//        // TODO: -
//    }
}

// TODO: Create a data type representing users-list (according to expected JSON response)
// (See the JSON response at: https://jsonplaceholder.typicode.com/users)
//


typealias UsersList = [UsersListElement]

// TODO (Bonus): Create a more specific error type.
// This can help identify the nature of a particular failure case.
// e.g. network timeout, badly formatted request or failing to decode/deserialize
// a response could cause failure in a network request.
//
//typealias FetchError = Any
enum FetchError: Error {
    case connectivity
    case invalidData
}

enum URLs {
    static let getUsers = URL(string: "https://jsonplaceholder.typicode.com/users")!
}

//ServiceManager Class
final class ServiceManager: API {
    private let session: URLSessionProtocol
    
    required init(session: URLSessionProtocol) {
        self.session = session
    }
    
    //API call for Users List
    func fetchUsers(excludingUserWithID: String?, success: @escaping (UsersList) -> Void, failure: @escaping (FetchError) -> Void) {
        
        session.data(with: URLs.getUsers) { data,response,error in
            guard let data = data, error == nil else {
                failure(.connectivity)
                return
            }
            do {
                let usersList = try JSONDecoder().decode([UsersListElement].self, from: data)
                success(usersList)
            } catch {
                failure(.invalidData)
            }
            
        }.resume()
    }
}

//For Writing API TestCases
protocol URLSessionProtocol {
    func data(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

//For Writing API TestCases
extension URLSession: URLSessionProtocol {
    func data(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        dataTask(with: url, completionHandler: completion)
    }
}

//For Writing API TestCases
protocol URLSessionDataTaskProtocol {
    func resume()
}

//For Writing API TestCases
extension URLSessionDataTask: URLSessionDataTaskProtocol {}
