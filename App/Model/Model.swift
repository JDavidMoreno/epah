//
//  Model.swift
//  Epah
//
//  Created by David Moreno on 7/10/22.
//

import Foundation


class Model: ObservableObject {
    @Published var producers: [Producer] = []
    
    private func fileURL(_ model: String) throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appending(component: "\(model).data")
    }
    
    func load<T: Codable>(_ model: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let modelName = String(describing: T.self).lowercased()
                let fileURL = try self.fileURL(modelName)
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                
                let records = try JSONDecoder().decode([T].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(records))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func save<T: Codable>(_ records: [T], completion: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let modelName = String(describing: T.self).lowercased()
                let fileURL = try self.fileURL(modelName)
                let data = try JSONEncoder().encode(records)
                try data.write(to: fileURL)
                
                DispatchQueue.main.async {
                    completion(.success(records.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    
}
