//
//  PhoneDetailNavigator.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 7/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

// Navigator para la navegación móvil. Podríamos hacer otro para el iPad, etc
final class PhoneDetailNavigator: DetailNavigator {
    private let navigationController: UINavigationController
    // El DetailViewControllerProvider es una propiedad de otro objeto, por lo que a la hora
    // de usarlo aquí, podría estar o no creado. Esto puede generar una depenecia ciclíca y por
    // ello nos aseguramos con el unowned ~ weak
    private unowned let viewControllerProvider: DetailViewControllerProvider
    
    init(navigationController: UINavigationController,
         viewControllerProvider: DetailViewControllerProvider) {
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showDetail(withIdentifier indentifier: Int64, mediaType: MediaType) {
        let viewController = viewControllerProvider.detailViewController(identifier: indentifier,
                                                                         mediaType: mediaType)
        navigationController.pushViewController(viewController, animated: true)
    }
}
