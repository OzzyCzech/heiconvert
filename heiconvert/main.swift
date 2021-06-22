#!/usr/bin/swift

import Foundation
import CoreImage

// search all *.tif files in Download directory and convert them to HEIF (heic)
let downloadDirectoryUrl =  FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!

do {
  // Get the directory contents urls (including subfolders urls)
  let directoryContents = try FileManager.default.contentsOfDirectory(at: downloadDirectoryUrl, includingPropertiesForKeys: nil, options:[.skipsHiddenFiles])
  let images = directoryContents.filter{ $0.pathExtension == "tif" }
  
  if (images.count > 0) {
    print("Converting:", images.count , "files to HEIC")
  }
  
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
      options: options as! [CIImageRepresentationOption : Any]
    )

    try FileManager.default.removeItem(at: imageUrl)
  }
  
  print ("Done!")
} catch {
  print(error)
}
