//
//  WebService.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 05/08/24.
//

import Foundation

protocol WsDelegate: AnyObject {
    func wsFinishedWithSuccess(identifier: Identifiers,
                               sender: NSDictionary,
                               status: WsStatus,
                               jsonResult: NSMutableArray)
    func wsFinishedWithError(identifier: Identifiers,
                             sender: NSDictionary,
                             error: String,
                             status: WsStatus,
                             code: Int)
}

class WebService: NSObject, URLSessionDelegate {
    weak var delegate: WsDelegate?
    var identifier: Identifiers = .nothing
    private let timeout = 120.0
    private var params = [String]()
    private var values = [String]()
    private var dataValue = [NSData]()
    private var dataFormat = [String]()
    private var data = [String]()
    private var status = -1
    private var header = [String]()
    private var headerValue = [String]()
    var json: NSDictionary?
    
    override init() {
        super.init()
        if !API.tokenGit().isEmpty {
            self.addHeader(name: "Authorization", value: "Bearer \(API.tokenGit())")
            self.addHeader(name: "Cache-Control", value: "private, no-cache, no-store")
        }
    }
    
    private func request(httpMethod: String, url: String) {
        guard let encodedURLString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let requestURLString = encodedURLString
        
        guard let url = URL(string: requestURLString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.timeoutInterval = timeout
        
        print("#######################################################\n")
        print(" ☎️ - REQUEST:\n")
        print(" 🤖 PATH: \(url)")
        print(" 🚀 METHOD: \(httpMethod)")
        print(" 🌐 URL: \(API.baseURL())")
        
        
        if self.header.count > 0 {
            print(" 🎯 HEADERS: ")
            for headerIndex in 0 ..< self.header.count {
                print("    \(self.header[headerIndex]) -> \(self.headerValue[headerIndex])")
                request.addValue(self.headerValue[headerIndex], forHTTPHeaderField: self.header[headerIndex])
            }
        }
        
        request = configRequest(httpMethod: httpMethod, request: &request)
        
        print("\n 📝 - RESPONSE:\n")
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        let session = URLSession.init(configuration: configuration, delegate: self, delegateQueue: nil)
        let conn = session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            URLCache.shared.removeAllCachedResponses()
            
            if let response = response as? HTTPURLResponse {
                self.status = response.statusCode
            }
            
            if error == nil {
                do {
                    if let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        
                        if let theJSONData = try? JSONSerialization.data(
                            withJSONObject: jsonResult,
                            options: .prettyPrinted) {
                            if let jsonText = String(data: theJSONData,
                                                     encoding: .ascii) {
                                DispatchQueue.main.async {
                                    print(jsonText)
                                }
                            } else {
                                DispatchQueue.main.async {
                                    print(jsonResult)
                                }
                            }
                        } else {
                            DispatchQueue.main.async {
                                print(jsonResult)
                            }
                        }
                        
                        DispatchQueue.main.async {
                            if self.getStatus() == .success {
                                print("\n ✅  - Finished With Success\n")
                                self.delegate?.wsFinishedWithSuccess(
                                    identifier: self.identifier,
                                    sender: jsonResult,
                                    status: self.getStatus(), jsonResult: .init())
                            } else {
                                print(" ❌ - Finished With Error")
                                self.delegate?.wsFinishedWithError(
                                    identifier: self.identifier,
                                    sender: jsonResult,
                                    error: "\(self.getStatus())",
                                    status: self.getStatus(),
                                    code: self.getCode(self.getStatus())
                                )
                                print(" 🚦- Status Server: ")
                                print("  Message Error: \(error?.localizedDescription ?? "")")
                                print("  Status Server: \(self.getStatus()) ")
                                print("  Code: \(self.getCode(self.getStatus())) ")
                            }
                        }
                    } else {
                        if let jsonResult: NSMutableArray = try JSONSerialization.jsonObject(
                            with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSMutableArray {
                            let dict = NSMutableDictionary.init()
                            dict.setValue(jsonResult, forKey: "result")
                            
                            DispatchQueue.main.async {
                                if let jsonString = try? JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted) {
                                    if let theJSONText = String(data: jsonString,
                                                                encoding: .ascii) {
                                        print(theJSONText)
                                    }
                                }
                                print("\n ✅  - Finished With Success\n")
                                self.delegate?.wsFinishedWithSuccess(
                                    identifier: self.identifier,
                                    sender: dict,
                                    status: self.getStatus(), jsonResult: jsonResult)
                            }
                        }
                    }
                } catch let error as NSError {
                    print(" ❌ - Finished With Error")
                    DispatchQueue.main.async {
                        if response == nil {
                            self.delegate?.wsFinishedWithError(
                                identifier: self.identifier,
                                sender: NSDictionary(),
                                error: error.localizedDescription,
                                status: self.getStatus(),
                                code: self.getCode(self.getStatus()))
                        }
                    }
                }
            } else {
                if let error = error as NSError? {
                    print(" ❌ - Finished With Error")
                    DispatchQueue.main.async {
                        if error.code == NSURLErrorNotConnectedToInternet {
                            self.delegate?.wsFinishedWithError(
                                identifier: self.identifier,
                                sender: NSDictionary(),
                                error: "Sua conexão parece estar desativada, por favor verifique e tente novamente.",
                                status: WsStatus.noInternet,
                                code: -1)
                        } else {
                            self.delegate?.wsFinishedWithError(
                                identifier: self.identifier,
                                sender: NSDictionary(),
                                error: error.localizedDescription,
                                status: self.getStatus(),
                                code: -1)
                            print(" 🚦🚦🚦- Status Server: ")
                            print("  Message Error: \(error.localizedDescription)")
                            print("  Status Server: \(self.getStatus()) ")
                            print("  Code: \(-1) ")
                        }
                    }
                }
            }
        }
        conn.resume()
    }
    
    private func start(httpMethod: String, url: String) {
        self.request(httpMethod: httpMethod, url: url)
    }
    
    private func configRequest(httpMethod: String, request: inout URLRequest) -> URLRequest {
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        // TODO: Prepare requests and return for httpMethod
        return request
    }
}

extension WebService {
    
    func get(url: String) {
        self.start(httpMethod: Methods.get.call(), url: url)
    }
    
    // TODO: Implements others methods POST, PUT, JSON, DELETE, PATCH
}

extension WebService {
    /// Get Status and return Type
    private func getStatus() -> WsStatus {
        switch self.status {
        case 200: return .success
        case 201: return .created
        case 202: return .accepted
        case 204: return .noContent
        case 304: return .notModified
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 405: return .methodNotAllowed
        case 408: return .requestTimeOut
        case 500: return .internalServerError
        case 409: return .conflict
        default: return .undefined
        }
    }
    /// Get code and return Int
    private func getCode(_ status: WsStatus) -> Int {
        switch status {
        case .success: return 200
        case .created: return 201
        case .accepted: return 202
        case .noContent: return 204
        case .notModified: return 304
        case .badRequest: return 400
        case .unauthorized: return 401
        case .forbidden: return 403
        case .notFound: return 404
        case .methodNotAllowed: return 405
        case .requestTimeOut: return 408
        case .internalServerError: return 500
        case .noInternet: return -1
        case .conflict: return 409
        case .undefined: return 99
        }
    }
}

extension WebService {
    func addParam(name: String, value: String) {
        params.append(name)
        values.append(value)
    }
    func addData(name: String, data: NSData, format: String) {
        self.data.append(name)
        dataValue.append(data)
        dataFormat.append(format)
    }
    func addHeader(name: String, value: String) {
        self.header.append(name)
        self.headerValue.append(value)
    }
}
