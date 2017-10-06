//
//  WebServiceAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class WebServiceAssembly {
    // Singleton (lazy)
    // private(set) = permiso de escritura privado, lectura público
	private(set) lazy var webService = WebService(configuration: .default)
}
