//
//  RootViewController.swift
//  LifeSaver
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 Pear Tree Labs. All rights reserved.
//

import UIKit


class RootViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var gameService: GameService!
    private var gameViewController: GameViewController!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameService = GameService()
        gameViewController = GameViewController(gameService: gameService)
        gameViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChildViewController(gameViewController)
        gameViewController.didMoveToParentViewController(self)
        
        view.addSubview(gameViewController.view)
        
        let views = [
            "game": gameViewController.view,
        ]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[game]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[game]|", options: [], metrics: nil, views: views))
    }
}

