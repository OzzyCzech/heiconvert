#!/usr/bin/swift

import Foundation
import CoreImage

let path = FileManager.default.currentDirectoryPath

let documentsUrl =  FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!

do {
    // Get the directory contents urls (including subfolders urls)
    let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
    let images = directoryContents.filter{ $0.pathExtension == "tif" }
    
    //let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }

    
    for imageUrl in images {
        print("Converting file: ", imageUrl.deletingPathExtension().lastPathComponent)
        let image = CIImage(contentsOf: imageUrl)
        let context = CIContext(options: nil)
        
        let options = NSDictionary(dictionary: [kCGImageDestinationLossyCompressionQuality:0.76])

        try! context.writeHEIFRepresentation(of:image!,
                                to: imageUrl.deletingPathExtension().appendingPathExtension("heic"),
                                format: CIFormat.ARGB8,
                                colorSpace: image!.colorSpace!,
                                options:options as! [CIImageRepresentationOption : Any])

    }
        


} catch {
    print(error)
}
