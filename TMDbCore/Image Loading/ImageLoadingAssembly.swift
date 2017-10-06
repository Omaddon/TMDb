//
//  ImageLoadingAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation
import Kingfisher

final class ImageLoadingAssembly {
    // Singleton (lazy)
    // private(set) = permiso de escritura privado, lectura público
	private(set) lazy var imageRepository: ImageRepositoryProtocol = ImageRepository(webService: webServiceAssembly.webService,
	                                                                                 imageManager: KingfisherManager.shared)
	
    // Solo se debería inyectar un assembly como dependencia dentro de otro Assembly
    private let webServiceAssembly: WebServiceAssembly

	init(webServiceAssembly: WebServiceAssembly) {
		self.webServiceAssembly = webServiceAssembly
	}
}
