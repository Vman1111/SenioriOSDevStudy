//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vytautas Sapranavicius on 05/01/2024.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
