//
//  OCRManager.swift
//  NoteScanner
//
//  Created by Saqer Alshehri on 07/10/1447 AH.
//

import AVFoundation
import UIKit
import Vision

class OCRManager {
    
    func recognizeText(from image: UIImage,
                       completion: @escaping (String) -> Void) {
        
        //convert UIImage → CGImage (so that Vision can deal with it)
        guard let cgImage = image.cgImage else {
            completion("")
            return
        }
        
        // create OCR request
        let request = VNRecognizeTextRequest { request, error in
            
            //the results (text observations)
            let observations = request.results as? [VNRecognizedTextObservation] ?? []
            
            //extract best text from each observation
            let text = observations.compactMap {
                $0.topCandidates(1).first?.string
            }.joined(separator: "\n")
            
            //return final text
            completion(text)
        }
        
        //improve accuracy
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        //supported langauges
        request.recognitionLanguages = ["en-US", "ar-SA"]
        
        //run the request
        let handler = VNImageRequestHandler(cgImage: cgImage)
        try? handler.perform([request])
    }
}
