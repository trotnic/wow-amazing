//
//  MajorTomTests.swift
//  MajorTomTests
//
//  Created by Uladzislau Volchyk on 26.01.22.
//

import XCTest
import Combine
@testable import MajorTom

class MajorTomTests: XCTestCase {

    var sut: ContentView.ContentViewModel!
    private var disposeBag = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
        disposeBag.removeAll()
    }

    func testTitleLoading() throws {
        let expectation = XCTestExpectation(description: #function)
        let expectedTitle = "Hello, World! 🌍"

        sut.loadContent()
        
        sut.$title
            .sink { title in
                if title == expectedTitle {
                    expectation.fulfill()
                }
            }
            .store(in: &disposeBag)
        
        wait(for: [expectation], timeout: 3)
    }
}
