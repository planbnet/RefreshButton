//
//  SafariWebExtensionHandler.swift
//  RefreshButton Extension
//
//  Created by Felix Rotthowe on 10.06.21.
//

import SafariServices

class SafariWebExtensionHandler: SFSafariExtensionHandler {

    override func toolbarItemClicked(in window: SFSafariWindow) {
        async {
            await window.activeTab()?.activePage()?.reload()
        }
    }


}
