//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by MIGUEL JARDÓN PEINADO on 7/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

// Desde aquí mostraremos 3 vistas diferentes en función del mediaType
// Esto es posible ya que las 3 vistas mostrarán más o menos la misma información
// El Presenter de cada una de las vistas será el encargado de pasarle los datos al DetailNavigator
protocol DetailNavigator {
    func showDetail(withIdentifier indentifier: Int64, mediaType: MediaType)
}
