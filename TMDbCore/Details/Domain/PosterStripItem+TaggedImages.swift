//
//  PosterStripItem+TaggedImages.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 20/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation


extension PosterStripItem {
    
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
}
