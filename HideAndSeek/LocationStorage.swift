//
//  LocationStorage.swift
//  HideAndSeek
//
//  Created by Jonathan on 2019. 02. 17..
//  Copyright © 2019. Jonathan. All rights reserved.
//

import Foundation
import CoreLocation

class LocationsStorage {
    static let shared = LocationsStorage()
    
    private(set) var locations: [Location]
    private let fileManager: FileManager
    private let documentsURL: URL
    
    init() {
        let fileManager = FileManager.default
        documentsURL = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        self.fileManager = fileManager
        self.locations = []
    }
}
