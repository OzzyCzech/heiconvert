#!/usr/bin/swift

import Foundation
import CoreImage

// search all *.tif files in Download directory and convert them to HEIF (heic)
let documentsUrl =  FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!

do {
  // Get the directory contents urls (including subfolders urls)
  let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
  let images = directoryContents.filter{ $0.pathExtension == "tif" }
  
  for imageUrl in images {
    print("Converting file: ", imageUrl.deletingPathExtension().lastPathComponent)
    let image = CIImage(contentsOf: imageUrl)
    let context = CIContext(options: nil)
    
    let options = NSDictionary(dictionary: [kCGImageDestinationLossyCompressionQuality:0.76])
    
    try! context.writeHEIFRepresentation(
      of: image!,
      to: imageUrl.deletingPathExtension().appendingPathExtension("heic"),
      format: CIFormat.ARGB8,
      colorSpace: image!.colorSpace!,
      options: options as! [CIImageRepresentationOption : Any])

    try FileManager.default.removeItem(at: imageUrl)
  }
} catch {
  print(error)
}
