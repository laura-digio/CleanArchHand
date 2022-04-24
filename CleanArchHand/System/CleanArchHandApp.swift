//
//  CleanArchHandApp.swift
//  CleanArchHand
//
//  Created by Laura on 6/3/22.
//

import SwiftUI

@main
struct CleanArchHandApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var appEnvironment = AppEnvironment()

    var body: some Scene {
        WindowGroup {
            TabView(selection: $appEnvironment.bottomMenuSelection) {
                // Tab 1
                HomeWireframe(params: HomeParams(initialState: .default)).view
                    .modifier(BottomMenuModifier(
                        title: "moduleHomeTitle".localized(),
                        image: Assets.Images.iconApple,
                        tag: .home
                    ))
            }
            .environmentObject(appEnvironment)
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }
}
