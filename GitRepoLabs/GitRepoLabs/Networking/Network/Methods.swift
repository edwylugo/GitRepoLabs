//
//  Methods.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

enum Methods {
    case get
    case post
    case put
    case json
    case delete
    case patch
    
    func call() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .json:
            return "JSON"
        case .delete:
            return "DELETE"
        case .patch:
            return "PATCH"
        }
    }
}
