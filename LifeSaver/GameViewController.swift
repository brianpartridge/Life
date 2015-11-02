//
//  GameViewController.swift
//  LifeSaver
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 Pear Tree Labs. All rights reserved.
//

import LifeTVOS
import UIKit


public class GameViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let gameService: GameService
    private let boardViewController: BoardViewController
    private let tickButton = UIButton(type: .System)
    
    // MARK: - Initialization
    
    init(gameService: GameService) {
        self.gameService = gameService
        self.boardViewController = BoardViewController(gameService: gameService)
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController(boardViewController)
        boardViewController.didMoveToParentViewController(self)
        boardViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        tickButton.translatesAutoresizingMaskIntoConstraints = false
        tickButton.setTitle("Tick", forState: .Normal)
        tickButton.addTarget(self, action: "tickTapped:", forControlEvents: .PrimaryActionTriggered)
        
        view.addSubview(boardViewController.view)
        view.addSubview(tickButton)
        
        let metrics = [
            "space": 44
        ]
        let views = [
            "board": boardViewController.view,
            "tick": tickButton
        ]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[board]|", options: [], metrics: metrics, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[board]|", options: [], metrics: metrics, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-space-[tick]", options: [], metrics: metrics, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[tick]-space-|", options: [], metrics: metrics, views: views))
        
        let size = Size(width: 10, height: 10)
        gameService.newGameWithSize(size)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "gameDidChange:", name: GameDidChangeNotification, object: gameService)
    }
    
    // MARK: - Actions
    
    @objc public func tickTapped(sender: UIButton) {
        print("tick")
        gameService.tick()
    }
    
    // MARK: - Private Methods
    
    @objc func gameDidChange(notification: NSNotification) {
        print("game changed: \(gameService.currentGame)")
    }
}
