//
//  SliderGameSwiftUIApp.swift
//  SliderGameSwiftUI
//
//  Created by Nikita on 17.09.21.
//

import SwiftUI

@main
struct SliderGameSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ScoreGenerator())
        }
    }
}
