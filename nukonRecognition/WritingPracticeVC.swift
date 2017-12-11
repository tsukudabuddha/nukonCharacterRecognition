//
//  ViewController.swift
//  nukonRecognition
//
//  Created by Andrew Tsukuda on 12/10/17.
//  Copyright © 2017 Andrew Tsukuda. All rights reserved.
//

import UIKit
import SpriteKit
import ACEDrawingView

class WritingPracticeVC: UIViewController {
    
    @IBOutlet weak var spritekitView: SKView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var correctButton: UIButton!
    var drawingView: ACEDrawingView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /* Setup drawing view */
        self.drawingView = setupDrawingView()
        
        /* Add Drawing View to the view */
        if let drawingView = self.drawingView {
            view.addSubview(drawingView)
        }
        
        /* Set clear button to correct height */
        setClearButtonHeight()
        
        /* Make Buttons rounded */
        wrongButton.layer.cornerRadius = wrongButton.frame.width / 2
        correctButton.layer.cornerRadius = correctButton.frame.width / 2
        clearButton.layer.cornerRadius = clearButton.frame.width / 2
        
        
    }

    @IBAction func correctDrawing(_ sender: Any) {
        
    }
    @IBAction func wrongDrawing(_ sender: Any) {
        
    }
    
    func setupDrawingView() -> ACEDrawingView {
        /* Initial Values for drawing view */
        let height = self.view.bounds.height
        let dvWidth = self.view.bounds.width
        let dvHeight = dvWidth * 0.7
        
        /* Set more attributes for drawing view */
        let drawingView = ACEDrawingView(frame: CGRect(x: 0.15 * dvWidth, y: height - dvHeight - 75, width: dvWidth * 0.7, height: dvHeight))
        drawingView.backgroundColor = UIColor(red: 222/255, green: 184/255, blue: 135/255, alpha: 1)
        drawingView.layer.cornerRadius = 100
        drawingView.clipsToBounds = true
        
        return drawingView
    }
    
    func setClearButtonHeight() {
        let filteredConstraints = clearButton.constraints.filter { $0.identifier == "identifier" }
        
        if let heightConstraint = filteredConstraints.first {
            heightConstraint.constant = (drawingView?.frame.height)!
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
