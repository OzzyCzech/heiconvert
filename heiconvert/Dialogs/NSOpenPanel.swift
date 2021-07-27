////
////  NSOpenPanel.swift
////  heiconvert
////
////  Created by Roman Ožana on 27.07.2021.
////
//import SwiftUI
//
//extension NSOpenPanel {
//  
//  static func openImages(completion: @escaping (_ result: Result<[URL], Error>) -> Void) {
//    let dialog = NSOpenPanel()
//    
//    dialog.title = "Select images"
//    dialog.allowsMultipleSelection = true
//    dialog.canChooseFiles = true
//    dialog.canCreateDirectories = false
//    dialog.canChooseDirectories = false
//    dialog.allowedFileTypes = ["jpg", "jpeg", "png", "tif", "heic"]
//    //openDialog.directoryURL = URL(string: .downloadsDirectory)
//    
//    dialog.begin { (result) in
//      if result == .OK, let urls = dialog.urls {
//        completion(.success(urls))
//      } else {
//        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get file location"])))
//      }
//    }
//  }
//}
