//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by  He on 2026/1/17.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't find \(file) in main bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("无法从资源包中加载\(file)文件")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("无法从资源包中解码\(file), 原因是缺少key: \(key) \(context)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("无法从资源包中解码\(file), 原因是类型不匹配: \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("无法从资源包中解码\(file), 原因是缺少\(type)类型的值--\(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("无法从资源包中解码\(file), 原因是该文件是无效的JSON格式")
        } catch {
            fatalError("无法从资源包中解码\(file)")
        }
    }
}
