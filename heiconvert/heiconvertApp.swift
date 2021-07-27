//
//  heiconvertApp.swift
//  heiconvert
//
//  Created by Roman Ožana on 27.07.2021.
//

import SwiftUI

@main
struct heiconvertApp: App {

  
    var body: some Scene {
        WindowGroup {
          InputView()
            .padding(16)
            .frame(minWidth: 720, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
        }
    }
}
