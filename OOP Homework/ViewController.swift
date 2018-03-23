//
//  ViewController.swift
//  OOP Homework
//
//  Created by Anna on 3/23/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        resignFirstResponder()
        return true
    }

    @IBAction func draw(_ sender: UIButton) {
        
        for view in self.view.subviews {
            if view.tag == 99 {
                view.removeFromSuperview()
            }
        }
        
        if let width = NumberFormatter().number(from: widthTextField.text!), let height = NumberFormatter().number(from:heightTextField.text!) {
            let frame = CGRect.init(x: 0, y: 0, width: CGFloat(truncating: width), height: CGFloat(truncating: height))
            
            segment.selectedSegmentIndex == 0 ? drawRectangle(frame: frame) : drawTriangle(frame: frame)
        }
        
    }
    
    func drawTriangle(frame: CGRect) {
        
            let triangle = TriangleView.init(frame: frame)
            triangle.center = CGPoint.init(x: self.view.frame.midX, y: self.view.frame.height / 3 * 2)
            triangle.backgroundColor = UIColor.init(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
            triangle.tag = 99
            
            self.view.addSubview(triangle)
    }
    
    func drawRectangle(frame: CGRect) {
        let rectangle = RectangleView.init(frame: frame)
        rectangle.center = CGPoint.init(x: self.view.frame.midX, y: self.view.frame.height / 3 * 2)
        rectangle.backgroundColor = UIColor.init(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.60)
        rectangle.tag = 99
        
        self.view.addSubview(rectangle)
    }
    
}

