//
//  ScienceStoryResponse.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import Foundation

struct ScienceStoryResponse: Codable {
    let status: String?
    let results: [ScienceStory]?
}

struct ScienceStory: Codable {
    let section: String
    let title: String
    let abstract: String
    let byline: String
    let published_date: String
    let multimedia: [ScienceMedia]
}

struct ScienceMedia: Codable {
    let url: String
    let type: String
    let caption: String
}
