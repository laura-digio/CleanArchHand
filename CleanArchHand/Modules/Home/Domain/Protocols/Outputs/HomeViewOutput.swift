//
//  HomeViewOutput.swift
//  CleanArchWrist WatchKit Extension
//
//  Created by Laura on 12/1/22.
//  Copyright (c) 2022. All rights reserved.
//

/*
 * Los outputs de la vista funcionan inversamente a los inputs y corresponden con aquellas acciones
 * controladas y necesarias que demanda la vista para funcionar correctamente.
 * Principalmente serán implementadas por el presenter y abarcan acciones
 * como qué hacer al pulsar un botón, pedir el refresco de datos, etc.
 */

import Foundation

protocol HomeViewOutput: ViewOutput {
    func onRetrieve(viewObject: HomeView.ViewObject?)
}
