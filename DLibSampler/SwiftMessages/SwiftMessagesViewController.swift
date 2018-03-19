//
//  SwiftMessagesViewController.swift
//  DLibSampler
//
//  Created by ELLIOTT, Dylan on 11/3/18.
//  Copyright © 2018 Dylan Elliott. All rights reserved.
//

import UIKit
import SwiftMessages
import Cartography

class SwiftMessagesViewController: UIViewController {
    
    var stackView: UIStackView!
    
    var callbacks: [UIButton: () -> ()] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        view.addSubview(stackView)
        
        constrain(stackView, view, block: { stackView, view in
            stackView.center == view.center
            stackView.width == 0.6 * view.width
        })
        
        add(buttonWithTitle: "Message View", showingMessageViewWithLayout: .messageView)
        add(buttonWithTitle: "Card View", showingMessageViewWithLayout: .cardView)
        add(buttonWithTitle: "Tab View", showingMessageViewWithLayout: .tabView)
        add(buttonWithTitle: "Status Line", showingMessageViewWithLayout: .statusLine)
        add(buttonWithTitle: "Centered View", showingMessageViewWithLayout: .centeredView)
    }
    
    func add(buttonWithTitle title: String, showingMessageViewWithLayout layout: MessageView.Layout) {
        
        let makeMessageView: (MessageView.Layout) -> MessageView = { layout in
            let card = MessageView.viewFromNib(layout: layout)
            
            card.configureDropShadow()
            
            let allThemes: [Theme] = [.success, .info, .error, .warning]
            
            card.configureTheme(allThemes.sm_random()!)
            
            card.titleLabel?.text = "Title"
            card.bodyLabel?.text = "\(Date().timeIntervalSince1970) Body body body body body body body body body body body body body body body body body body"
            
            return card
        }
        
        add(buttonWithTitle: title) {
            let messageView = makeMessageView(layout)
            SwiftMessages.show(view: messageView)
        }
    }
    
    func add(buttonWithTitle title: String, handler: (() -> ())?) {
        let button = UIButton()
        constrain(button, block: { button in
            button.height == 40
        })
        
        button.setTitle(title, for: .normal)
        
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        
        stackView.addArrangedSubview(button)
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .primaryActionTriggered)
        callbacks[button] = handler
    }
    
    func callHandlerForButton(_ button: UIButton) {
        guard let handler = callbacks[button] else { fatalError() }
        
        handler()
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        SwiftMessages.hide()
        callHandlerForButton(sender)
    }
    
    
    
}

