//
//  MainViewController.swift
//  ClimaCodeMVP
//
//  Created by Danila Bolshakov on 18.10.2023.
//

import UIKit

//MARK: - MainViewProtocol
protocol MainViewPresenter: AnyObject {
    func succes()
    func failure(error: Error)
    func hideActivityIndicator()
}

final class MainViewController: UIViewController {
    
    //MARK: - UI
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            indicator.style = .large
        } else {
            indicator.style = .gray
        }
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    var presenter: MainPresenter? //Свойство *с типом* протокола
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        presenter?.didLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupViews() {
        view.addSubview(activityIndicator)
    }
}

//MARK: - MainViewProtocol
extension MainViewController: MainViewPresenter {
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    func succes() {
        DispatchQueue.main.async {
            self.view.backgroundColor = .systemRed
        }
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

//MARK: - Extension MainViewController
extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
