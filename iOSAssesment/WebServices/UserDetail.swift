//
//  UserDetailModal.swift
//
//  Created on May 02, 2024
//
import Foundation

struct UserDetail {

    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?

    init(_ dict: [String: Any]) {
        userId = dict["userId"] as? Int
        id = dict["id"] as? Int
        title = dict["title"] as? String
        body = dict["body"] as? String
    }

    func toDictionary() -> [String: Any] {
        var jsonDict = [String: Any]()
        jsonDict["userId"] = userId
        jsonDict["id"] = id
        jsonDict["title"] = title
        jsonDict["body"] = body
        return jsonDict
    }

}
