//
//  ContainerViewAbout.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 2.12.2022.
//

import UIKit

class ContainerViewAbout: UIViewController {

    @IBOutlet weak var textView: UITextView!
    static var detailAbout: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false
        textView.text = ContainerViewAbout.detailAbout
    }
   
}
