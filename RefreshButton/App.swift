//
//  App.swift
//  RefreshButton
//
//  Created by Felix Rotthowe on 10.06.21.
//

import SwiftUI
import SafariServices

let extensionBundleIdentifier = Bundle.main.bundleIdentifier!+".Extension"

@main
struct refreshApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        Button("Please enable this extension in Safari") {
            SFSafariApplication.showPreferencesForExtension(withIdentifier: extensionBundleIdentifier) { error in
                DispatchQueue.main.async {
                    NSApplication.shared.terminate(nil)
                }
            }
        }.padding()
    }
}

struct App_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
