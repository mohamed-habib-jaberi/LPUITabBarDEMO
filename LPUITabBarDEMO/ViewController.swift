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

        let controller3 : FriendsViewController = FriendsViewController(nibName: "FriendsViewController", bundle: nil)
        controller3.title = "Friends"
        controller3.parentNavigationController = self.navigationController
        controllerArray.append(controller3)

        // Customize menu (Optional)
        let parameters: [LPUITabBarPageMenuOption] = [
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

        self.view.addSubview(pageMenu!.view)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
