//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Vytautas Sapranavicius on 06/01/2024.
//

import XCTest


class RemoteFeedLoader {

}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }

}
