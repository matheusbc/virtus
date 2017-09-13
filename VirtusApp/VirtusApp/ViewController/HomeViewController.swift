//
//  HomeViewController.swift
//  VirtusApp
//
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import UIKit

class HomeViewController: UIPageViewController, UIPageViewControllerDataSource {
    var pageViewController: UIPageViewController!
    let virtusStructureViewModel = VirtusStructureViewModel()
    private var timer: Timer = Timer()
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPageView()
    }

    func loadPageView() {
        self.dataSource = self

        let pageContentViewController = self.viewControllerAtIndex(index: self.currentIndex)
        self.setViewControllers([pageContentViewController!] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)

        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(HomeViewController.nextPage), userInfo: nil, repeats: true)
    }

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

    func viewControllerAtIndex(index: Int) -> UIViewController? {
        if ((self.virtusStructureViewModel.count() == 0) || (index >= self.virtusStructureViewModel.count())) {
            return nil
        }
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeContentViewController") as! HomeContentViewController

        pageContentViewController.imageName = self.virtusStructureViewModel.imageName(forIndex: index)
        pageContentViewController.imageTitle = self.virtusStructureViewModel.imageDescription(forIndex: index)
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.virtusStructureViewModel.count()
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    func nextPage() {
        self.currentIndex += 1
        if (self.currentIndex == self.virtusStructureViewModel.count()) {
            self.currentIndex = 0
        }
        let pageContentViewController = self.viewControllerAtIndex(index: self.currentIndex)
        self.setViewControllers([pageContentViewController!] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }
}
