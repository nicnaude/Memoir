//
//  VideoViewController.swift
//  memoire_codepathProject
//
//  Created by Nicholas Naudé on 26/11/2016.
//  Copyright © 2016 Samihah Azim. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet var tapView: UIView?
    
    var count = 0
    let reuseIdentifier = "videoCell"
    var videoImages = [UIImage]()
    var collectionViewLayout: CustomImageFlowLayout!
    let tapRec = UITapGestureRecognizer()
    var tickMarkImages = [UIImage]()
    var tickMarkArray = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 10
        
        // Do any additional setup after loading the view.
        videosCollectionView.dataSource = self
        
        videoImages = [UIImage(named: "CellPic1")!, UIImage(named: "CellPic2")!, UIImage(named: "CellPic3")!, UIImage(named: "CellPic4")!, UIImage(named: "CellPic5")!, UIImage(named: "CellPic6")!, UIImage(named: "CellPic7")!, UIImage(named: "CellPic8")!, UIImage(named: "CellPic9")!, UIImage(named: "CellPic10")!, UIImage(named: "CellPic11")!, UIImage(named: "CellPic12")!, UIImage(named: "CellPic13")!, UIImage(named: "CellPic14")!, UIImage(named: "CellPic15")!, UIImage(named: "CellPic16")!, UIImage(named: "CellPic17")!, UIImage(named: "CellPic18")!, UIImage(named: "CellPic19")!, UIImage(named: "CellPic20")!, UIImage(named: "CellPic21")!]
        
        
        tickMarkImages = [UIImage(named: "transparent")!, UIImage(named: "tickMark")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "tickMark")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "tickMark")!, UIImage(named: "tickMark")!, UIImage(named: "tickMark")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!, UIImage(named: "transparent")!]
        
        collectionViewLayout = CustomImageFlowLayout()
        videosCollectionView.collectionViewLayout = collectionViewLayout
        
        tapRec.addTarget(self, action: Selector(("onTapGestureRecognised")))
        
    }
    
    
    override func viewDidLayoutSubviews() {
        // Setup navigation bar colors etc
        navigationController?.navigationBar.barTintColor = UIColor.memoirBlue()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
        
        // Setup common UI elements:
        setUpUI()
        createButton.backgroundColor = UIColor.memoirBlue()
        createButton.layer.cornerRadius = 5
    }
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videoImages.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! VideoCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.videoImage.image = self.videoImages[indexPath.item]
        cell.tickMarkImageView.image = self.tickMarkImages[indexPath.item]
        let diceRoll = Int(arc4random_uniform(24) + 1)
        cell.label.text = "0:" + String(format: "%02d", diceRoll+5)
        //cell.bringSubview(toFront: cell.label)
        
        
        
        
        let topColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        let bottomColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0,1.0]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        gradientLayer.frame = cell.bottomGradient.layer.bounds //frame
        cell.bottomGradient.layer.insertSublayer(gradientLayer, at: 0)

        
        
        if indexPath.item == 1 {
            cell.tickMarkImageView.alpha = 0
            tickMarkArray.append(cell.tickMarkImageView)
        }
        if indexPath.item == 4 {
            cell.tickMarkImageView.alpha = 0
            tickMarkArray.append(cell.tickMarkImageView)
        }
        if indexPath.item == 7 {
            cell.tickMarkImageView.alpha = 0
            tickMarkArray.append(cell.tickMarkImageView)
        }
        if indexPath.item == 8 {
            cell.tickMarkImageView.alpha = 0
            tickMarkArray.append(cell.tickMarkImageView)
        }
        if indexPath.item == 9 {
            cell.tickMarkImageView.alpha = 0
            tickMarkArray.append(cell.tickMarkImageView)
        }

        return cell
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width/3.2, height: 100)
    }
    
    @IBAction func onBackArrowTapped(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onTapGestureRecognised(_ sender: UITapGestureRecognizer) {
        
        
        if case let ok = tickMarkArray[count] {
            tickMarkArray[count].alpha = 1
        }
        if count < 4 {
            count += 1
        }
        
    }
    
    
}
