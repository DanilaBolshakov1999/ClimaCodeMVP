//
//  ModuleBuilder.swift
//  ClimaCodeMVP
//
//  Created by Danila Bolshakov on 18.10.2023.
//

import UIKit

//MARK: - Builder
protocol Builder {
    static func creareMainModule() -> UIViewController
}

//MARK: - ModuleBuilder
final class ModuleBuilder: Builder {
    static func creareMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
