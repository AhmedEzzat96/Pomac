//
//  Constants.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import Foundation

// Storyboards
struct Storyboards {
    static let master = "Master"
    static let detail = "Detail"
}

// ViewControllers
struct ViewControllers {
    static let masterVC = "MasterVC"
    static let detailsVC = "DetailsVC"
}

// Urls
struct URLs {
    static let base = "https://api.nytimes.com"
    static let scienceStories = "/svc/topstories/v2/science.json"
}

// HeaderKeys
struct HeaderKeys {
    static let accept = "Content-Type"
    static let acceptLanguage = "Accept-Language"
}

// HeaderValues
struct HeaderValues {
    static let appJSON = "application/json"
}

// Parameters Keys
struct ParameterKeys {
    static let apiKey = "api-key"
}

// Cells
struct Cells {
    static let masterCell = "MasterCell"
}
