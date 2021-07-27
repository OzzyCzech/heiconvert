//
//  InputView.swift
//  heiconvert
//
//  Created by Roman Ožana on 27.07.2021.
//

import SwiftUI
import CoreImage

struct InputView: View {
  
  @State private var images: [URL]?
  @State private var label = "Converting Image (PNG, JPG, JPEG, TIF) to HEIF"
  @State private var progress = 0.0
  @State private var total = 100.0
  
  var body: some View {
    
    VStack() {
      ProgressView(label, value:progress, total:total)
      
      HStack {
        //Text("Input Image (PNG, JPG, JPEG, TIF)")
        Button("Select images") {
          total = 100.0; progress = 0.0
          
          let dialog = NSOpenPanel()
          dialog.title = "Select images"
          dialog.allowsMultipleSelection = true
          dialog.canChooseFiles = true
          dialog.canCreateDirectories = false
          dialog.canChooseDirectories = false
          dialog.allowedFileTypes = ["jpg", "jpeg", "png", "tif"]
          
          if (dialog.runModal() == .OK) {
            images = dialog.urls;
            total = Double(dialog.urls.count)
          }
        }
        Button("Convert to HEIC") {
          DispatchQueue.global(qos: .background).async {
          
      
            images?.forEach({imageUrl in
              let image = CIImage(contentsOf: imageUrl)
              let context = CIContext(options: nil)
              let filename = imageUrl.deletingPathExtension().appendingPathExtension("heic")
              
              let options = NSDictionary(dictionary: [kCGImageDestinationLossyCompressionQuality:0.76])
              
              try! context.writeHEIFRepresentation(
                of: image!,
                to: filename,
                format: CIFormat.ARGB8,
                colorSpace: image!.colorSpace!,
                options: options as! [CIImageRepresentationOption : Any]
              )
              
              DispatchQueue.main.async {
                progress += 1.0
                label = "Converting " + imageUrl.lastPathComponent + " to " + filename.lastPathComponent
                //self.progress.setProgress(Float(current / total), animated: true)
                //self.text.text = "Hello: " + String(current)
                //print(Float(current / total))
              }
            })
            
            label = "Done..."

          }
        }//.disabled(images?.count == 0)
      }
    }
  }
}

struct InputImagePreview: PreviewProvider {
  static var previews: some View {
    InputView()
  }
}
