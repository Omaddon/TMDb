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
    
    init(taggedImages: TaggedImages.Images) {
        identifier = taggedImages.identifier
        mediaType = .movie
        title = taggedImages.media.original_title
        metadata = taggedImages.media.original_title
        posterPath = taggedImages.media.posterPath
    }
}
