//
//  CleanArchHandApp.swift
//  CleanArchHand
//
//  Created by Laura on 6/3/22.
//

import SwiftUI
import Introspect

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
                        image: Image(systemName: "chevron.left.forwardslash.chevron.right"),
                        tag: .home
                    ))
                // Tab 2
                EmptyTab(navigationTitle: "moduleTeamTitle", bottomMenuSelection: .team)
                    .modifier(BottomMenuModifier(
                        title: "moduleTeamTitle".localized(),
                        image: Image(systemName: "person.3"),
                        tag: .team
                    ))
                // Tab 3
                EmptyTab(navigationTitle: "moduleTalkTitle", bottomMenuSelection: .talk)
                    .modifier(BottomMenuModifier(
                        title: "moduleTalkTitle".localized(),
                        image: Image(systemName: "bubble.left"),
                        tag: .talk
                    ))
            }
            .introspectTabBarController { tabBarController in
                appEnvironment.tabBarController = tabBarController
            }
            .environmentObject(appEnvironment)
        }
    }
}

struct EmptyTab: View {
    let navigationTitle: LocalizedStringKey
    let bottomMenuSelection: AppConstants.BottomMenuSelection
    @EnvironmentObject var appEnvironment: AppEnvironment

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("...")
            }
            .navigationTitle(navigationTitle)
            .introspectNavigationController { navigationController in
                appEnvironment.navigationControllers[bottomMenuSelection] = navigationController
            }
        }
        .navigationViewStyle(.stack) // fix for iOS know issue (1)
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
