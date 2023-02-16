//
//  NetworkUtil.swift
//  iDesserts
//
//  Created by Andy Wu on 2/15/23.
//

import Foundation

func fetch<T:Codable>(from urlString: String, onSuccess: @MainActor @escaping (T) -> Void) async -> Void {
    guard let url = URL(string: urlString) else {
        print("Invalid URL: \(urlString)")
        return
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
    
        await onSuccess(decodedData)
    } catch {
        print(error.localizedDescription)
    }
}

