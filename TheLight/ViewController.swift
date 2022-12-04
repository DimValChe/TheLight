//
//  ViewController.swift
//  TheLight
//
//  Created by Дмитрий Черкашин on 04.12.2022.
//

import UIKit

class ViewController: UIViewController {
    var isLightOn: Bool = true
    override var prefersStatusBarHidden: Bool{
        return true
    }
//MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    fileprivate func updateUI() {
        view.backgroundColor = isLightOn ? .white : .black
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isLightOn.toggle()
        updateUI()
    }
}

