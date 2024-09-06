//
//  NavigationModel.swift
//  Hr
//
//  Created by Omar Yousef on 06/09/2024.
//

import Foundation



struct NavigationModel: Hashable {
    let destination: Destination
    let data: Any?
    
    // Implementing Equatable
    static func == (lhs: NavigationModel, rhs: NavigationModel) -> Bool {
        return lhs.destination == rhs.destination && lhs.areEqual(lhs.data, rhs.data)
    }
    
    // Implementing Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(destination)
        hasher.combine(ObjectIdentifier(type(of: data)))
        // Hashing logic for `data` if it's a known type
    }
    
    private func areEqual(_ lhs: Any, _ rhs: Any) -> Bool {
        // Custom equality logic depending on the actual types you expect
        // Example:
        if let lhsInt = lhs as? Int, let rhsInt = rhs as? Int {
            return lhsInt == rhsInt
        } else if let lhsString = lhs as? String, let rhsString = rhs as? String {
            return lhsString == rhsString
        }
        // Add more cases for other types as needed
        return false
    }
}


enum Destination{
    case homeScreen
}
