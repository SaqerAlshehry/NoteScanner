//
//  OCRManager.swift
//  NoteScanner
//
//  Created by Saqer Alshehri on 07/10/1447 AH.
//

import AVFoundation
import UIKit


//Use AVFoundation → setup camera with AVCaptureSession
//Request photo → capturePhoto() → photoOutput.capturePhoto(...)
//Photo capture is asynchronous (does NOT return immediately)
//Receive result via delegate → photoOutput(...didFinishProcessingPhoto...)
//Extract raw image → photo.fileDataRepresentation() → Data
//Convert to usable image → UIImage(data:)
//Pass image forward using closure → onPhotoCaptured?(image)
//OCR uses Vision → VNRecognizeTextRequest
//Convert image for Vision → image.cgImage
//Run OCR → VNImageRequestHandler.perform(...)
//Vision returns observations → [VNRecognizedTextObservation]
//Each observation → multiple guesses → topCandidates(1)
//Extract best text → .first?.string
//Combine results → .joined(separator: "\n")
//Return text using completion closure → completion(text)
//Closure marked @escaping (called later, async)
