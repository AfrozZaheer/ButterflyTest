//
//  OfflineNetwork.swift
//  ButterflyTest
//
//  Created by muhammad.afroz on 04/01/2024.
//

import Foundation
import Cache
import ObjectMapper

enum OfflineSaveDataKeys: String {
    case movieListKey
    case movieObjKey
}

class OfflineNetwork {
    
    private init() {
        setupCache()
    }
    static var shared = OfflineNetwork()
    
    private var storage: Storage<String, Data>!
    
    private func setupCache() {
        let diskConfig = DiskConfig(name: "UserCache")
        let memoryConfig = MemoryConfig(expiry: .never, countLimit: 10, totalCostLimit: 10)

        do {
            self.storage = try Storage(
                diskConfig: diskConfig,
                memoryConfig: memoryConfig,
                transformer: TransformerFactory.forData()
            )
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func saveItemToCache<T: Mappable>(item: T, key: String) {
        let jsonDic = item.toJSON()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            self.storage.async.setObject(jsonData, forKey: key) { _ in }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveListItemToCache<T: Mappable>(list: [T], key: String) {
        
        let jsonDic = list.toJSON()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            self.storage.async.setObject(jsonData, forKey: key) { _ in }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getListItemFromCache<T: Mappable>(key: String, success: @escaping ([T]?) -> ()) {
        self.storage.async.object(forKey: key) { result in
            if case .value(let data) = result {
                do {
                    let decoded = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dic = decoded as? [[String: Any]] {
                        let item = Mapper<T>().mapArray(JSONArray: dic)
                        success(item)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getItemFromCache<T: Mappable>(key: String) -> T? {
        var item: T? = nil
        self.storage.async.object(forKey: key) { result in
            if case .value(let data) = result {
                do {
                    let decoded = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dic = decoded as? [String: Any] {
                        item = Mapper<T>().map(JSON: dic)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        return item
    }
    
}
