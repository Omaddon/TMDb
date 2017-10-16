//
//  PersonRepository.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 16/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol PersonRepositoryProtocol {
    func person(withIdentifier identifier: Int64) -> Observable<PersonDetail>
}


class PersonRepository: PersonRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func person(withIdentifier identifier: Int64) -> Observable<PersonDetail> {
        return webService.load(PersonDetail.self, from: .person(identifier: identifier))
    }
}
