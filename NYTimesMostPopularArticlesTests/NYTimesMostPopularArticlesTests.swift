//
//  NYTimesMostPopularArticlesTests.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Syed Faraz Haider Zaidi on 03/09/2022.
//

import XCTest
@testable import NYTimesMostPopularArticles

class NYTimesMostPopularArticlesTests: XCTestCase {

    func testSuccessFetchData() {
        let expectedList = [Article.with()!]
        let service = MockService(mockData: (expectedList))
        
        let viewModel = ArticlesViewModel(service: service)
        
        
        viewModel.loadData(finished: {})
        
        XCTAssertEqual(viewModel.articleList.count, 1)
    }
    
    func testEmptyData() {
        let expectedList = [Article]()
        let service = MockService(mockData: expectedList)
        
        let viewModel = ArticlesViewModel(service: service)
        
        
        viewModel.loadData(finished: {
        })
        
        XCTAssertEqual(viewModel.articleList.count, 0)
    }
    
    func testNilData() {
        let expectedList: [Article]? = nil
        let service = MockService(mockData: expectedList)
        let viewModel = ArticlesViewModel(service: service)
        viewModel.loadData(finished: {
        })
    

        XCTAssertEqual(viewModel.articleList.count, 0)
    }


}
