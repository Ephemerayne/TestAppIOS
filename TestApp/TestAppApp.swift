//
//  TestAppApp.swift
//  TestApp
//
//  Created by Veronika Bekesh on 17.02.2022.
//

import Foundation
import SwiftUI
import UIKit

@main
struct TestAppApp: App {
    var body: some Scene {
        WindowGroup {
            RootInterop()
                .preferredColorScheme(.light)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
