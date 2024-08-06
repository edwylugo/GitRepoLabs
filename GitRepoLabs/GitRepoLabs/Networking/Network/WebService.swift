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
    private let timeout = 120
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
    }
    
    private func request(httpMethod: String, url: String) {
        
    }
    
    private func start(httpMethod: String, url: String) {
        self.request(httpMethod: httpMethod, url: url)
    }
}

extension WebService {
    
    func get(url: String) {
        self.start(httpMethod: Methods.get.call(), url: url)
    }
    
    // TODO: Implements others methods POST, PUT, JSON, DELETE, PATCH
}
