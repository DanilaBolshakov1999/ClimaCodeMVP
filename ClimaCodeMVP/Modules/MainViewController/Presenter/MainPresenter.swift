//
//  MainPresenter.swift
//  ClimaCodeMVP
//
//  Created by Danila Bolshakov on 18.10.2023.
//

import Foundation

//MARK: - MainViewProtocol
protocol MainViewProtocol: AnyObject {
    var weatherModel: [WetherModel]? { get set }
    func getNetwork()
    func didLoad()
}

final class MainViewController: MainViewProtocol {
    
    //MARK: - Properties
    weak var view: MainViewProtocol?
    var weatherModel: [WetherModel]?
    
    //MARK: - init
    init(view: MainViewProtocol, weather: WetherModel) { }
    
    func getNetwork() { didLoad() }
    
    func didLoad() { }
}
