//
//  MovieRepository.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 8/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol MovieRepositoryProtocol {
    func movie(withIdentifier identifier: Int64) -> Observable<MovieDetail>
}


class MovieRepository: MovieRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    
    func movie(withIdentifier identifier: Int64) -> Observable<MovieDetail> {
        return webService.load(MovieDetail.self, from: .movie(identifier: identifier))
    }
}
