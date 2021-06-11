//
//  SafariWebExtensionHandler.swift
//  RefreshButton Extension
//
//  Created by Felix Rotthowe on 10.06.21.
//

import SafariServices

class SafariWebExtensionHandler: SFSafariExtensionHandler {

    var intialized = false
    
    override func toolbarItemClicked(in window: SFSafariWindow) {
        async {
            await window.activeTab()?.activePage()?.reload()
        }
    }
 
    override func validateToolbarItem(in window: SFSafariWindow,
                                      validationHandler: @escaping (Bool, String) -> Void) {
        guard intialized == false else { return }
        let image = NSImage(systemSymbolName: "arrow.clockwise", accessibilityDescription: String(localized: "Refresh") )
        window.getToolbarItem { icon in
            icon?.setImage(image)
            icon?.setLabel( String(localized: "Refresh") )
        }
        intialized = true
    }
    
}
