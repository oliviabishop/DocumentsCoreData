//
//  DocumentsViewController.swift
//  Documents
//
//  Created by Olivia Bishop on 8/29/18.
//  Copyright © 2018 Olivia Bishop. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var DocumentsTableView: UITableView!
    
    var documents = [Documents]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
}

    override func viewWillAppear(_ animated: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Documents> = Documents.fetchRequest()
        
        do {
            
            
            documents = try managedContext.fetch(fetchRequest)
            
            DocumentsTableView.reloadData()
        }
        
        catch {
            
            print("Fetch could not be performed")
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func AddNewDocument(_ sender: Any) {
        
        performSegue(withIdentifier: "Add", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? SingleDocumentViewController,
        let selectedRow = self.DocumentsTableView.indexPathForSelectedRow?.row
        
        else {
            
            return
        }
    
        destination.exisitingDocument = documents[selectedRow]
    
    
    
    }
    
    
    func deleteDocument(at indexPath:IndexPath) {
        
        
        if let managedContext = documents.managedObjectContext {
            
            managedContext.delete(documents)
            
            do {
                
                try managedContext.save()
                
                self.documents.remove(at: indexPath.row)
                
                DocumentsTableView.deleteRows(at: [indexPath], with: .automatic)
                
                
                
            } catch{
                
                print("Document could not be deleted")
                
                
                DocumentsTableView.reloadRows(at: [indexPath], with: .automatic)
            }
            
            
        }
    }
    
}

        
        
        
extension DocumentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DocumentsTableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath)
        
        let document = documents[indexPath.row]
        
        cell.textLabel?.text = document.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            deleteDocument(at: indexPath)
        }
    }
    
    
    
}

extension DocumentsViewController: UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DocumentCell", sender: self)
    }
}






        
        
        
        

    
    

    
    
    



    
    





