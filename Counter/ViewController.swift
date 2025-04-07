//
//  ViewController.swift
//  Counter
//
//  Created by Dmitry on 06/04/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        countHistory.text = "История изменений:"
        // Do any additional setup after loading the view.

    }
    
    
    func appendToHistory(_ message: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let timestamp = formatter.string(from: Date())
        countHistory.text += "\n[\(timestamp)]: \(message)"
        let range = NSMakeRange(countHistory.text.count - 1, 1)
        countHistory.scrollRangeToVisible(range)
    }
    
    @IBOutlet weak var counterView: UILabel!
    var counter = 0
    
    @IBOutlet weak var countHistory: UITextView!
   
    
    @IBAction func counterMinus(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterView.text = "\(counter)"
            appendToHistory("значение изменено на -1")
        } else {
            appendToHistory("попытка уменьшить ниже 0")
            counterView.textColor = .red

         }
     }
    @IBAction func counterPlus(_ sender: Any) {
        counterView.textColor = .white
        counter += 1
        counterView.text = "\(counter)"
        appendToHistory("значение изменено на +1")
    }
    @IBAction func counterReset(_ sender: Any) {
        counterView.textColor = .white
        counter = 0
        counterView.text = "\(counter)"
        appendToHistory("значение сброшено")
    }
}

