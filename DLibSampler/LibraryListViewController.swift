//
//  LibraryCategoryViewController.swift
//  DLibSampler
//
//  Created by ELLIOTT, Dylan on 9/3/18.
//  Copyright © 2018 Dylan Elliott. All rights reserved.
//

import UIKit

class LibraryListViewController: LibrarySamplerViewController {
    override var sectionViewModels: [SectionViewModel<ViewControllerCellViewModel>] { return [
        ("Design & UI", [
            ("Chamelion", ChamelionViewController.self),
            ("SwiftMessages", SwiftMessagesViewController.self),
            ("Carthography", UIViewController.self),
            ("Eureka", UIViewController.self),
            ("PM Super Button", UIViewController.self),
            ("SwiftIcons", SwiftIconsViewController.self)
        ]),
        ("Network & Data Storage",[
         ("Defualt", UIViewController.self),
         ("Disk", UIViewController.self),
         ("Imaginary", UIViewController.self),
        ]),
        ("Data Modelling & Units", [
            ("SwiftDate", UIViewController.self),
        ]),
        ("Code Level", [
            ("Repeat", UIViewController.self),
            ("Result", UIViewController.self),
            ("thenPromise", UIViewController.self),
        ])
    ] }
}
