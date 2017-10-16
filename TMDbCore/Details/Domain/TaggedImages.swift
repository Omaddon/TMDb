//
//  TaggedImages.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 16/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImages: Decodable {
    struct Images: Decodable {
        struct Media: Decodable {
            let posterPath: String?
            let backdropPath: String?
            let original_title: String
            
            private enum CodingKeys: String, CodingKey {
                case posterPath = "poster_path"
                case backdropPath = "backdrop_path"
                case original_title
            }
            
        }
        
        let aspect: Float?
        let identifier: Int64
        let filePath: String?
        let media: Media
        
        private enum CodingKeys: String, CodingKey {
            case aspect = "aspect_ratio"
            case identifier = "id"
            case filePath = "file_path"
            case media
        }
    }
    
    let results: [Images]
}
