//
//  LocalService.swift
//  InterchangableNetwork
//
//  Created by Berke Topcu on 26.11.2022.
//

import Foundation

class LocalService : NetworkService {
    var type: String = "Localservice"
    
    
    
    func download(_ resource: String) async throws -> [User] {
        
        //dosyanın tipini ve geleceği yeri belirttik
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource not found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
    
        
        
    }
}
