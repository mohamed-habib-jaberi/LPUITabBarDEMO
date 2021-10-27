//
//  ViewController.swift
//  LPUITabBarDEMO
//
//  Created by eidd5180 on 27/10/2021.
//

import UIKit
import LPUITabBar

class ViewController: UIViewController {
    var pageMenu : LPUITabBar?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Offers"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.tintColor = UIColor.red

        // MARK: - Scroll menu setup

        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []

        let controller1 : FavouritesViewController = FavouritesViewController(nibName: "FavouritesViewController", bundle: nil)
        controller1.parentNavigationController = self.navigationController
        controller1.title = "Toutes"
        controllerArray.append(controller1)

        let controller2 : RecentsViewController = RecentsViewController(nibName: "RecentsViewController", bundle: nil)
        controller2.title = "Activée"
        controller2.parentNavigationController = self.navigationController
        controllerArray.append(controller2)

        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
            .bottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .selectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .menuMargin(20.0),
            .menuHeight(40.0),
            .selectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .unselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
            .useMenuLikeSegmentedControl(false),
            .menuItemSeparatorRoundEdges(false),
            .selectionIndicatorHeight(2.0),
            .menuItemSeparatorPercentageHeight(0.0),
            .titleTextSizeBasedOnMenuItemWidth(true),
            .menuItemWidthBasedOnTitleTextWidth(true)
        ]

        // Initialize scroll menu

        navigationController?.navigationBar.prefersLargeTitles = true
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)

        pageMenu = LPUITabBar(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: topBarHeight , width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)

        // Optional delegate
       // pageMenu!.delegate = self

        self.view.addSubview(pageMenu!.view)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}



// MARK: - Scroll menu setup
//extension ViewController: CAPSPageMenuDelegate {
//    // Uncomment below for some navbar color animation fun using the new delegate functions
//
//    func didMoveToPage(_ controller: UIViewController, index: Int) {
//        print("did move to page")
//
//        var color : UIColor = UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
//                var navColor : UIColor = UIColor(red: 17.0/255.0, green: 64.0/255.0, blue: 107.0/255.0, alpha: 1.0)
//
//                if index == 1 {
//                    color = UIColor.orange
//                    navColor = color
//                } else if index == 2 {
//                    color = UIColor.gray
//                    navColor = color
//                }
//        //else if index == 3 {
//        //            color = UIColor.purpleColor()
//        //            navColor = color
//        //        }
//        //
//        UIView.animate(withDuration: 0.5, animations: { () -> Void in
//                    self.navigationController!.navigationBar.barTintColor = navColor
//                }) { (completed) -> Void in
//                    print("did fade")
//                }
//    }
//
//    func willMoveToPage(_ controller: UIViewController, index: Int) {
//        print("will move to page")
//
//        //        var color : UIColor = UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
//        //        var navColor : UIColor = UIColor(red: 17.0/255.0, green: 64.0/255.0, blue: 107.0/255.0, alpha: 1.0)
//        //
//        //        if index == 1 {
//        //            color = UIColor.orangeColor()
//        //            navColor = color
//        //        } else if index == 2 {
//        //            color = UIColor.grayColor()
//        //            navColor = color
//        //        } else if index == 3 {
//        //            color = UIColor.purpleColor()
//        //            navColor = color
//        //        }
//        //
//        //        UIView.animateWithDuration(0.5, animations: { () -> Void in
//        //            self.navigationController!.navigationBar.barTintColor = navColor
//        //        }) { (completed) -> Void in
//        //            println("did fade")
//        //        }
//    }
//}
