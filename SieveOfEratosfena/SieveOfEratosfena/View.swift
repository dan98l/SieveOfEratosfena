//
//  View.swift
//  SieveOfEratosfena
//
//  Created by Daniil G on 25/04/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import UIKit

class View: UIViewController {
    
    private var presenter: Presenter = Presenter()

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var ImputRange: UITextField!
    @IBAction func touchButtonFind(_ sender: Any) {
        if Int(ImputRange.text!) != nil && Int(ImputRange.text!)! > 1 {
            presenter.setRange(range: Int(ImputRange.text!))
            presenter.findNumbers()
            presenter.numbersForView()
        } else {
            presenter.updateArrayOutNumbersInModel()
        }
        collectionView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let nib = UINib(nibName: "cell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CellForNumbers")
    }
}

extension View: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.returnNumbersCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForNumbers", for: indexPath) as? Cell else {
            assertionFailure("Can't dequeue cell.")
            return UICollectionViewCell()
        }
        
        cell.numberLabel.text = presenter.setLabelTextForCell(index: indexPath.row)
        
        return cell
    }
}
