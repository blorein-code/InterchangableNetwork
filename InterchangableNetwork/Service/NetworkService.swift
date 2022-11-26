//
//  NetworkService.swift
//  InterchangableNetwork
//
//  Created by Berke Topcu on 26.11.2022.
//

import Foundation

protocol NetworkService {
    
    func download(_ resource: String) async throws -> [User]
    
    var type : String { get }
}
