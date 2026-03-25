//
//  CameraManager.swift
//  NoteScanner
//
//  Created by Saqer Alshehri on 06/10/1447 AH.
//

import Foundation
import AVFoundation



//remember, only classes can inherit.
//must inherit from NSObject so that it can be conformed by AVCapturePhotoCaptureDelegate (based on Objective-C)
class CameraManager : NSObject {
    //act as the pipeline
    let session  = AVCaptureSession()
    
    // to enable capturing photo as an output
    let photoOutput = AVCapturePhotoOutput()
    
    func configureSession() {
        
        session.beginConfiguration()
        
        //defer will ensure to commit the chnages when exit happens (in whatever scenario) in this function
        defer {
            session.commitConfiguration()
        }
        
        // physical camera
        // choosing .video since we intersted in Photos
        guard let device = AVCaptureDevice.default(for: .video),
              
        // put it in a way that the "session" can understands, must be an input object
        let input = try? AVCaptureDeviceInput(device : device)
        else{
            return
        }
        
        // safety check
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        // safety check
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
        
        //request to take the photo
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
    
}



//Delegate gives the result data
extension CameraManager : AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?)
    {
        guard let data = photo.fileDataRepresentation() else { return }
        print("Photo captured: \(data.count) bytes")
    }
    
}

//so, capturePhoto(request a photo) -> AVFoundation (do the heavy work) -> Delegate (gives the result)
