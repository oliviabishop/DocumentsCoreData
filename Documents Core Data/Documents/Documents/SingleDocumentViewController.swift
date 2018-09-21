//
//  SingleDocumentViewController.swift
//  Documents
//
//  Created by Olivia Bishop on 8/29/18.
//  Copyright © 2018 Olivia Bishop. All rights reserved.
//

import UIKit

class SingleDocumentViewController: UIViewController {

   
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var contentsTextView: UITextView!
    
    var exisitingDocument: Documents?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = (self as UITextFieldDelegate)
        contentsTextView.delegate = (self as! UITextViewDelegate)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func   touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        nameTextField.resignFirstResponder()
        contentsTextView.resignFirstResponder()
    }
    
    @IBAction func SaveDocument(_ sender: Any) {
        
        let name = nameTextField.text
        let content = contentsTextView.text
    
        var document: Documents?
        
        if let existingDocument = exisitingDocument {
            
            existingDocument.name = name
            existingDocument.contents = content
            
            document = existingDocument
        }
    
        else {
            
            document = Documents(name: name, contents: content)
        }
    
        if let document = document {
            
            do {
                
                let managedContext = document.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            }
        
            catch {
        
                print("Document could not be saved.")
        
            }
        }
    }
}

extension SingleDocumentViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    
    
    
}
