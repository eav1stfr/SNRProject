//
//  ViewController.swift
//  SNRProject
//
//  Created by Александр Эм on 07.02.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupView()
    }
    
    private let loginView: LoginPage = {
        let view = LoginPage()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupView() {
        addSubviews()
        setupContraints()
    }
    
    private func addSubviews() {
        view.addSubview(loginView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

