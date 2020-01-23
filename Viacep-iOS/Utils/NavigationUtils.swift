//
//  NavigationUtils.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 14/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation
import UIKit

func navigate<T>(_ current: UIViewController, _ destination: T, _ completition: ((T) -> Void)?) where T: UIViewController {
    guard let navigationController = current.navigationController else {
        return
    }
    
    completition?(destination)
    navigationController.pushViewController(destination, animated: true)
}

func navigate(_ current: UIViewController, _ destination: UIViewController) {
    guard let navigationController = current.navigationController else {
        return
    }
    
    navigationController.pushViewController(destination, animated: true)
}

func popToRoot(_ current: UIViewController) {
    guard let navigationController = current.navigationController else {
        return
    }
    
    navigationController.popToRootViewController(animated: true)
}
