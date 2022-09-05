//
//  MockService.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Syed Faraz Haider Zaidi on 05/09/2022.
//

import Foundation
@testable import NYTimesMostPopularArticles

class MockService : WebServiceProtocol {
    
    func fetchArticleList(completion: @escaping ([Article]?) -> Void) {
        completion(mockData)
    }
    
    let mockData: [Article]?
    
    init(mockData: [Article]?) {
        self.mockData = mockData
    }
    
}
