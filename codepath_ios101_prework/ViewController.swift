//
//  ViewController.swift
//  codepath_ios101_prework
//
//  Created by Aarzoo Bansal on 4/29/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! // function to change images in UIImage
    var time: Timer?
    var imageIndex = 0

    let imageNames = ["ios1", "ios2", "iOS-Developer", "ios3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstImage = UIImage(named: imageNames[0]) {
            imageView.image = firstImage
        }
        setupTimerMethod()
    }


    func setupTimerMethod() {
        time = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }

    @objc func changeImage() {
        imageIndex = (imageIndex + 1) % imageNames.count

        if let image = UIImage(named: imageNames[imageIndex]) {
            imageView.image = image
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        time?.invalidate()
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) { // function which changes the background color when the button is clicked
        func changeColor() -> UIColor {
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)

            return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
        }

        let randomColor = changeColor()
        view.backgroundColor = randomColor
    }
}
