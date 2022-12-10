//
//  ViewController.swift
//  TheLight
//
//  Created by Дмитрий Черкашин on 04.12.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var isLightOn: Int = 1
    override var prefersStatusBarHidden: Bool{
        return true
    }
//MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }

                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }

    fileprivate func updateUI() {
        //view.backgroundColor = isLightOn ? .white : .black
        switch isLightOn {
        case 1:
            view.backgroundColor = .red
            toggleTorch(on: false)
        case 2:
            view.backgroundColor = .green
            toggleTorch(on: false)
        case 3:
            view.backgroundColor = .white
            toggleTorch(on: false)
        default:
            view.backgroundColor = .black
            toggleTorch(on: true)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(isLightOn)
        updateUI()
        if (isLightOn > 3) {isLightOn = 1}
        else {isLightOn+=1}
    }
}

