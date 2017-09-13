//
//  HomeViewController.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

/// The home view controller.
class HomeViewController: UIPageViewController, Loadable {
    // MARK: Properties
    /// The page view controller.
    var pageViewController: UIPageViewController!
    /// The Virtus structure view model.
    let virtusStructureViewModel = VirtusStructureViewModel()
    /// Timer to do the transition to the next page automatically.
    private var timer: Timer = Timer()
    /// The index of the current page.
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let loading = self.showLoading(self)
        // Simulates a time to load the content.
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            self.loadPageView()
            self.dismissLoading(loading)
        })
    }

    /**
     Loads the first page view.
    */
    func loadPageView() {
        self.dataSource = self

        let pageContentViewController = self.viewControllerAtIndex(index: self.currentIndex)
        self.setViewControllers([pageContentViewController!] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)

        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(HomeViewController.nextPage), userInfo: nil, repeats: true)
    }

    /**
     The view controller of the page at an index.

     - Parameter index: The page index.
     - Returns: The page view controller.
    */
    func viewControllerAtIndex(index: Int) -> UIViewController? {
        if ((self.virtusStructureViewModel.count() == 0) || (index >= self.virtusStructureViewModel.count())) {
            return nil
        }
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeContentViewController") as! HomeContentViewController

        pageContentViewController.pageIndex = index
        pageContentViewController.virtusStructureViewModel = self.virtusStructureViewModel
        return pageContentViewController
    }

    /*
     Goes to the next page. If it's in the last one, goes to the first.
    */
    func nextPage() {
        self.currentIndex += 1
        if (self.currentIndex == self.virtusStructureViewModel.count()) {
            self.currentIndex = 0
        }
        let pageContentViewController = self.viewControllerAtIndex(index: self.currentIndex)
        self.setViewControllers([pageContentViewController!] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
}

extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        self.currentIndex -= 1
        if(self.currentIndex < 0) {
            self.currentIndex = self.virtusStructureViewModel.count() - 1
        }
        return self.viewControllerAtIndex(index: self.currentIndex)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        self.currentIndex += 1
        if (self.currentIndex == self.virtusStructureViewModel.count()) {
            self.currentIndex = 0
        }
        return self.viewControllerAtIndex(index: self.currentIndex)
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.virtusStructureViewModel.count()
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
