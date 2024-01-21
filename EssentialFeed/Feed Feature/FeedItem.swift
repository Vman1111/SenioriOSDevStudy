//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Vytautas Sapranavicius on 05/01/2024.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
