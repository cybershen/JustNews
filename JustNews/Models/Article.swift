//
//  Article.swift
//  JustNews
//
//  Created by Назар Жиленко on 10.02.2023.
//

import Foundation

struct ArticlesList: Decodable {
    var articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
