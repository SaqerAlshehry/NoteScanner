//
//  CameraManager.swift
//  NoteScanner
//
//  Created by Saqer Alshehri on 06/10/1447 AH.
//

import Foundation
import AVFoundation
import UIKit


//remember, only classes can inherit.
// Must inherit from NSObject to conform to AVCapturePhotoCaptureDelegate (Objective-C based API)
class CameraManager : NSObject {
    
    // Acts as the pipeline that connects input → processing → output
    let session  = AVCaptureSession()
    
    // to enable capturing photo as an output
    let photoOutput = AVCapturePhotoOutput()
    
    func configureSession() {
        
        session.beginConfiguration()
        
        // Always commit configuration when function exits
        defer {
            session.commitConfiguration()
        }
        
        // physical camera
        // .video refers to the camera (not actual video recording)
        guard let device = AVCaptureDevice.default(for: .video),
              
        // put it in a way that the "session" can understands, must be an input object
        let input = try? AVCaptureDeviceInput(device : device)
        else{
            return
        }
        
        // Add input safely
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        // Add output safely
        if session.canAddOutput(photoOutput){
            session.addOutput(photoOutput)
        }
        
        
    }
    func startSession() {
        if !session.isRunning {
            session.startRunning()
        }
    }
    func stopSession() {
        if session.isRunning {
            session.stopRunning()
        }
    }
    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        
        // Request to capture a photo → result comes via delegate
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
    
}

//Delegate gives the result data
extension CameraManager : AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?)
    {
        guard let data = photo.fileDataRepresentation(),
              // get the Image
                let image = UIImage(data : data)
                else { return }
        print("Photo captured: \(data.count) bytes")
    }
    
}

//so, capturePhoto(request a photo) -> AVFoundation (do the heavy work) -> Delegate (gives the result)
