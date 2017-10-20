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
    
    init(taggedImages: TaggedImages) {
        switch taggedImages.media {
        case .movie(let movie):
            mediaType = .movie
            identifier = movie.identifier
            title = movie.title
            metadata = movie.title
            posterPath = movie.backdropPath
        case .show(let show):
            mediaType = .show
            identifier = show.identifier
            title = show.name
            metadata = show.name
            posterPath = show.backdropPath
        }
    }
    
    /*
    init(taggedImages: TaggedImages.Images) {
        identifier = taggedImages.identifier
        mediaType = .movie
        title = taggedImages.media.original_title
        metadata = taggedImages.media.original_title
        posterPath = taggedImages.media.posterPath
    }
 */
}
