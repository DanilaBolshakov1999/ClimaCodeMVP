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

final class MainPresenter: MainViewProtocol {
    
    //MARK: - Properties
    weak var view: MainViewPresenter?
    let networkService: NetworkServiceProtocol
    var weatherModel: [WetherModel]?
    
    //MARK: - init
    init(view: MainViewPresenter, networkService: NetworkService) {
            self.view = view
            self.networkService = networkService
    }
    
    func getNetwork() {
        didLoad()
    }
    
    func didLoad() {
        networkService.getSetup { [ weak self ] result in
            print("DDD")
            guard let self = self else { return }
            
            defer { // после отработки func
                view?.hideActivityIndicator()
            }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherModel):
                    self.weatherModel = weatherModel
                    self.view?.succes()
                    print("DDD")
                    print(weatherModel)
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
