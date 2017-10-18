//
//  ViewController.swift
//  Menu Bars
//
//  Created by Camilo Alfonso on 18/10/17.
//  Copyright © 2017 Camilo Alfonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var counter = 210
    var alreadyPressed = false
    
    @IBOutlet weak var labelTimer: UILabel!
    
    @objc func processTimer(){
        counter -= 1
        renderTime()
    }
    
    @objc func renderTime(){
        labelTimer.text = String(counter)
    }
    
    @IBAction func navBarButtonPressed(_ sender: Any) {
        if alreadyPressed {
            timer.invalidate()
            alreadyPressed = false
        }
    }
    
    @IBAction func playPressed(_ sender: Any) {
        if !alreadyPressed {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer ), userInfo: nil, repeats: true)
            alreadyPressed = true
        }
        
    }
    
    
    @IBAction func SubstractTen(_ sender: Any) {
        if (counter-10)>=0{
            counter -= 10
            renderTime()
        }
    }
    
    
    @IBAction func AddTen(_ sender: Any) {
        counter += 10
        renderTime()
    }
    
    
    @IBAction func btnReset(_ sender: Any) {
        
        counter = 210
        renderTime()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        renderTime()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

