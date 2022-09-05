//
//  Enums.swift
//  NYTimesMostPopularArticles
//
//  Created by Syed Faraz Haider Zaidi on 05/09/2022.
//

import Foundation
import UIKit

enum AppStoryboard : String{
  case Main = "Main"
  var instance : UIStoryboard {
   return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
  }
  func viewController<T>(vc : T.Type) -> T where T: UIViewController
  {
   let identifier = String(describing: T.self)
   return self.instance.instantiateViewController(withIdentifier:identifier) as! T
  }
}
