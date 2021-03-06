//
//  PersonPresenter.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 16/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

final class PersonPresenter: DetailPresenter {
    private let repository: PersonRepositoryProtocol
    private let dateFormatter: DateFormatter
    private let navigator: DetailNavigator
    
    private let identifier: Int64
    private let disposeBag = DisposeBag()
    
    weak var view: DetailView?
    
    init(repository: PersonRepositoryProtocol,
         dateFormatter: DateFormatter,
         identifier: Int64,
         navigator: DetailNavigator) {
        self.repository = repository
        self.dateFormatter = dateFormatter
        self.identifier = identifier
        self.navigator = navigator
    }
    
    
    func didLoad() {
        view?.setLoading(true)
        
        repository.person(withIdentifier: identifier)
            .map { [weak self] person in
                self?.detailSections(for: person) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
                }, onDisposed: { [weak self] in
                    self?.view?.setLoading(false)
            })
            .disposed(by: disposeBag)
    }
    
    func didSelect(item: PosterStripItem) {
        switch item.mediaType {
        case .movie:
            navigator.showDetail(withIdentifier: item.identifier, mediaType: .movie)
        case .show:
            navigator.showDetail(withIdentifier: item.identifier, mediaType: .show)
        case .person:
            print("Incorrect mediaType")
        }
    }
    
    private func detailSections(for person: PersonDetail) -> [DetailSection] {
        var detailSections: [DetailSection] = [
            .header(DetailHeader(person: person, dateFormatter: dateFormatter))
        ]
        
        if let overview = person.overview {
            detailSections.append(.about(title: "Biography", detail: overview))
        }
        
        let items = person.taggedImages?.results
            .filter { $0.aspectRatio == (16/9) }
            .map { PosterStripItem(taggedImages: $0) }
        
        if let items = items {
            detailSections.append(.posterStrip(title: "Known for", items: items))
        }
        
        return detailSections
    }
}
