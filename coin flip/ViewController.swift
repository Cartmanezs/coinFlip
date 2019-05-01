//
//  ViewController.swift
//  coin flip
//
//  Created by Ingvar on 5/1/19.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var coinImageArray: [UIImage] = []
    
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    @IBAction func flipCoinButton(_ sender: UIButton) {
        coinLabel.text = ""
        imageViewOutlet.image = nil
        flipCoinImages(imageView: imageViewOutlet, images: coinImageArray)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.flipCoin()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinLabel.text = ""
        imageViewOutlet.image = UIImage(named: "heads")
        createCoinImagesArray(count: 53, name: "Coin")
    }
    //MARK: Generate random coin
    func flipCoin(){
        let coins = [1,2]
        if let coin = coins.randomElement(){
            coin == 1 ? (coinLabel.text = "heads") : (coinLabel.text = "tails")
            coin == 1 ? (imageViewOutlet.image = UIImage(named: "heads")) : (imageViewOutlet.image = UIImage(named: "tails"))
        }
    }
    //MARK: Create an array for coin images
    func createCoinImagesArray(count: Int, name: String){
        for i in 1...count{
            let imageName = UIImage(named: "\(name)\(i)")
            coinImageArray.append(imageName!)
        }
    }
    //MARK: Animation for coin
    func flipCoinImages(imageView: UIImageView, images: [UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 1
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }

}

