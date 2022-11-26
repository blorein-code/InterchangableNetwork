//
//  WebService.swift
//  InterchangableNetwork
//
//  Created by Berke Topcu on 26.11.2022.
//

import Foundation

class Webservice : NetworkService {
    var type: String = "Webservice"
    
    
    enum NetworkError : Error {
        case invalidUrl
        case invalidServerResponse
    }
    
    //func ismi localservice ve webservice de olsa aynı çünkü protocolde bu isimde bir function istedik.
    func download(_ resource: String) async throws -> [User] {
        
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        /*
         Http response alabiliyorsak ve bu response.status code == 200 ise  devam et, değilse hata ver.
         */
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
             
                throw NetworkError.invalidServerResponse
            
        }
        
        return try JSONDecoder().decode([User].self, from: data)
        
    }
    
}
