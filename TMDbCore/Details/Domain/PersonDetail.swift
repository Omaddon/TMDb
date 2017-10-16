//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 16/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
//    let backdropPath: String?
    let identifier: Int64
    let overview: String?
    let posterPath: String?
    let birthday: String?
    let name: String
//    let credits: Credits?
    
    private enum CodingKeys: String, CodingKey {
//        case backdropPath = "backdrop_path"
        case identifier = "id"
        case overview = "biography"
        case posterPath = "profile_path"
        case birthday
        case name
//        case credits
    }
}
