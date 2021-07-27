//
//  InputImageView.swift
//  heiconvert
//
//  Created by Roman Ožana on 27.07.2021.
//
// https://stackoverflow.com/questions/60831260/swiftui-drag-and-drop-files

//import SwiftUI
//
//struct InputImageView: View {
//  
//  @Binding var image: NSImage?
//  
//  var body: some View {
//    ZStack {
//      if self.image != nil {
//        Image(nsImage: self.image!)
//          .resizable()
//          .aspectRatio(contentMode: .fit)
//      } else {
//        Text("Drag and drop image file")
//          .frame(width: 320)
//      }
//    }
//    .frame(height: 320)
//    .background(Color.black.opacity(0.5))
//    .cornerRadius(8)
//    .onDrop(of: ["public.url","public.file-url"], isTargeted: nil) { (items) -> Bool in
//      if let item = items.first {
//        if let identifier = item.registeredTypeIdentifiers.first {
//          print("onDrop with identifier = \(identifier)")
//          if identifier == "public.url" || identifier == "public.file-url" {
//            item.loadItem(forTypeIdentifier: identifier, options: nil) { (urlData, error) in
//              DispatchQueue.main.async {
//                if let urlData = urlData as? Data {
//                  let urll = NSURL(absoluteURLWithDataRepresentation: urlData, relativeTo: nil) as URL
//                  if let img = NSImage(contentsOf: urll) {
//                    self.image = img
//                    print("got it")
//                  }
//                }
//              }
//            }
//          }
//        }
//        return true
//      } else {
//        print("item not here")
//        return false
//      }
//    }
//  }
//}
//
