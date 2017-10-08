//
//  FeaturedPresenterTest.swift
//  TMDbCoreTests
//
//  Created by MIGUEL JARDÓN PEINADO on 8/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import XCTest
@testable import TMDbCore

class FeaturedPresenterTest: XCTestCase {
    
    // Sut = System Under Testing
    var sut: FeaturedPresenter!
    
    // Collaborators
    var detailNavigatorMock: DetailNavigatorMock!
    var featuredRepositoryMock: FeaturedRepositoryMock!
    
    
    override func setUp() {
        super.setUp()
        
        detailNavigatorMock = DetailNavigatorMock()
        featuredRepositoryMock = FeaturedRepositoryMock()
        sut = FeaturedPresenter(detailNavigator: detailNavigatorMock,
                                repository: featuredRepositoryMock)
    }
    
    func testFeaturedPresenter_didSelectShow_navigatesToShow() {
        // Given
        let show = Show(identifier: 42,
                        title: "Test",
                        posterPath: nil,
                        backdropPath: nil,
                        firstAirDate: nil,
                        genreIdentifiers: nil)
        
        // When
        sut.didSelect(show: show)
        
        // Then
        XCTAssertTrue(detailNavigatorMock.showDetailCalled)
        
        let (identifier, mediatype) = detailNavigatorMock.showDetailParameters!
        XCTAssertEqual(42, identifier)
        XCTAssertEqual(.show, mediatype)
        XCTAssertNotEqual(.movie, mediatype)
    }
}


























