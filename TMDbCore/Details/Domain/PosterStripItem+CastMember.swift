//
//  PosterStripItem+CastMember.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 8/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation


extension PosterStripItem {
    
    init(castMember: Credits.CastMember) {
        identifier = castMember.identifier
        mediaType = .person
        title = castMember.name
        metadata = castMember.character
        posterPath = castMember.profilePath
    }
}
