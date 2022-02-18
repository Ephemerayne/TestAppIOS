//
//  RootViewController.swift
//  TestApp
//
//  Created by Veronika Bekesh on 17.02.2022.
//

import UIKit
import SwiftUI

struct RootInterop: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some UIViewController {
        return RootViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

class RootViewController: UIViewController {

    // MARK: Internal vars
    private var current: UIViewController

    // MARK: Life Cycle
    init() {
        let mainViewController = MainViewController()
        self.current = mainViewController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        (current as? MainViewController)?.delegate = self

        // Do any additional setup after loading the view.
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
}

extension RootViewController: MainViewControllerDelegate {

    func showMain() {
        showMainAsRoot()
    }

func showMainAsRoot() {
    let mainViewController = MainViewController()
    animateTransition(to: mainViewController, duration: 0.5, with: [.transitionCrossDissolve, .curveEaseOut])
}
}

// MARK: - Internal logic
private extension RootViewController {

    private func animateTransition(to new: UIViewController,
                                   duration: TimeInterval,
                                   with options: UIView.AnimationOptions,
                                   completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)

        transition(from: current, to: new,
                   duration: duration,
                   options: options,
                   animations: {},
                   completion: { [weak self] _ in
            self?.current.removeFromParent()
            new.didMove(toParent: self)
            self?.current = new
            completion?()
        })
    }
}

