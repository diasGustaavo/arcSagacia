//
//  ArchitectureClassifierScript.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 27/03/23.
//

import CoreML
import Vision
import CoreImage

struct ArchitectureClassifierScript {
    static let configuration = MLModelConfiguration()
    static let model = try! VNCoreMLModel(for: ArchitectureClassifier(configuration: configuration).model)
    static let class_names = ["Barroco", "Indígena", "Modernista", "Neoclassica", "Neogotico"]
    
    static func detect(ciImage: CIImage) -> String? {
        var label = ""
        let handler = VNImageRequestHandler(ciImage: ciImage)
        let request = VNCoreMLRequest(model: model) { request, error in
            if let observations = request.results, !observations.isEmpty {
                let str = observations[0].description
                if let startRange = str.range(of: "["), let endRange = str.range(of: "]") {
                    let substringRange = startRange.upperBound..<endRange.lowerBound
                    let substrings = String(str[substringRange]).components(separatedBy: ",")
                    let subfloats = substrings.compactMap { Float($0) }
                    guard let highestNumIndex = subfloats.firstIndex(of: subfloats.max()!) else { return }
                    label = class_names[highestNumIndex]
                } else {
                    print("DEBUG: Could not process results string")
                }
            } else {
                print("DEBUG: Invalid results")
            }
        }

        do {
            try handler.perform([request])
        } catch {
            print("Error classifying image: \(error.localizedDescription)")
        }
        return label
    }
    
}
