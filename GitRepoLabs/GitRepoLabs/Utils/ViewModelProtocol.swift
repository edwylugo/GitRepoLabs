//
//  ViewModelProtocol.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
}
