//
//  DetailHeader+MovieDetail.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 8/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(movie: MovieDetail, dateFormatter: DateFormatter) {
        title = movie.title
        posterPath = movie.posterPath
        backdropPath = movie.backdropPath
        
        let releaseDate = movie.releaseDate.flatMap { dateFormatter.date(from: $0) }
        let year = (releaseDate?.year).map { String($0) }
        let duration = "\(movie.runtime) min."
        
        metadata = [year, duration].flatMap { $0 }.joined(separator: " - ")
    }
    
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title = show.title
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
        let releaseDate = show.releaseDate.flatMap { dateFormatter.date(from: $0) }
        let year = (releaseDate?.year).map { String($0) }
        let duration = "\(show.runtime[0]) min."
        
        metadata = [year, duration].flatMap { $0 }.joined(separator: " - ")
    }
    
    init(person: PersonDetail, dateFormatter: DateFormatter) {
        title = person.name
        posterPath = person.posterPath
        backdropPath = person.posterPath
        
        let date = person.birthday.flatMap { dateFormatter.date(from: $0) }
        let birthday = (date?.year).map { String($0) }
        let formatBirthday = "Born in \(birthday ?? "")"
        
        metadata = [formatBirthday].flatMap { $0 }.joined(separator: " - ")
    }
}
