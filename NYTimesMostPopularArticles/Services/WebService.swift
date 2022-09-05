//
//  WebService.swift
//  NYTimesMostPopularArticles
//
//  Created by Syed Faraz Haider Zaidi on 05/09/2022.
//

import Foundation


protocol WebServiceProtocol {
    func fetchArticleList(completion: @escaping ([Article]?) -> Void)
}


class WebService : WebServiceProtocol{
    
    func fetchArticleList(completion: @escaping ([Article]?) -> Void) {
        loadData({ articles in
            completion(articles)
        })
    }
    
    private func loadData(_ completion: @escaping ([Article]?) -> Void) {
        
         let url = "\(APIConstants.baseUrl)\(APIConstants.most_popular_url)7.json"
        
        guard var components = URLComponents(string: url) else {
            print("Error: cannot create URLCompontents")
            return
        }
        components.queryItems = [URLQueryItem(name: "api-key", value: APIConstants.api_key)]

        guard let url = components.url else {
            print("Error: in URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(request.description)
        URLSession.shared.dataTask(with: request){ (data, _, _) in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let articles = try? JSONDecoder().decode(ArticleResponse.self, from: data) else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(articles.articles)
            }
            
        }.resume()
    }
    
}
