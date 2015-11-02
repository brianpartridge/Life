//
//  BoardViewController.swift
//  LifeSaver
//
//  Created by Brian Partridge on 11/1/15.
//  Copyright © 2015 Pear Tree Labs. All rights reserved.
//

import LifeTVOS
import UIKit


let cellReuseIdentifier = "cell"


class BoardViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    
    private let gameService: GameService
    private let dataSource = BoardDataSource()
    private let layout = UICollectionViewFlowLayout()
    
    // MARK: - Initialization
    
    init(gameService: GameService) {
        self.gameService = gameService
        super.init(collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "gameDidChange:", name: GameDidChangeNotification, object: gameService)

        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView?.dataSource = dataSource
        collectionView?.collectionViewLayout = layout
        
        if let board = gameService.currentGame?.currentGeneration.board {
            updateForBoard(board)
        }
    }
    
    // MARK: - Private Methods
    
    @objc func gameDidChange(notification: NSNotification) {
        print("game changed: \(gameService.currentGame)")
        updateForBoard(gameService.currentGame!.currentGeneration.board)
    }
    
    func updateForBoard(board: Board) {
        let size = board.size
        layout.itemSize = CGSize(width: view.frame.size.width/CGFloat(size.width), height: view.frame.size.height/CGFloat(size.height))
        dataSource.board = board
        collectionView?.reloadData()
    }
}


class BoardDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Public Properties
    
    var board = Board(size: Size(width: 0, height: 0), cells: [])
    
    // MARK: - Public Methods
    
    func configureCell(cell: UICollectionViewCell, atIndexPath indexPath: NSIndexPath) {
        let cellValue = board.cellAtCoordinate(Coordinate(x: indexPath.column, y: indexPath.row))
        cell.backgroundColor = cellValue == .Alive ? UIColor.redColor() : UIColor.blueColor()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return board.size.width
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return board.size.height
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        configureCell(cell, atIndexPath: indexPath)
        return cell
    }
}

extension NSIndexPath {
    var column: Int {
        return section
    }
    
    public convenience init(forRow row: Int, inColumn column: Int) {
        self.init(forRow: row, inSection: column)
    }
}
