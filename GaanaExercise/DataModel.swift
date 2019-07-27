//
//  DataModel.swift
//  GaanaExercise
//
//  Created by Manisha Sharma on 27/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import Foundation


public struct SectionItem {
    public var headerTitle: String
    public var itemArray: [[String: String]]
    public var rowCount: Int {
        return itemArray.count
    }
    public init(headerTitle: String, itemArray: [[String: String]]) {
        self.headerTitle = headerTitle
        self.itemArray = itemArray
    }
}

public struct AlbumItem {
    public var title: String
    public var imageURL: String
    public var id: String
}
