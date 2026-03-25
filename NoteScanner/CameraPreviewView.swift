//
//  CameraPreviewView.swift
//  NoteScanner
//
//  Created by Saqer Alshehri on 06/10/1447 AH.
//



import AVFoundation
import SwiftUI


//Since AVCaptureVideoPreviewLayer belongs to UIKit/Core Animation,
//we use UIViewRepresentable (protocol) to wrap a UIView that contains it, so SwiftUI can display it
struct CameraPreviewView  : UIViewRepresentable{
    
    let session: AVCaptureSession  // camera session to display
        
        func makeUIView(context: Context) -> UIView {
            let view = UIView()  // container for preview layer
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: session) // live camera feed
            previewLayer.videoGravity = .resizeAspectFill // fill screen nicely
            
            view.layer.addSublayer(previewLayer) // attach preview to view
            
            return view // give SwiftUI the UIKit view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            // adjust size on layout changes (e.g. rotation)
            if let previewLayer = uiView.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
                previewLayer.frame = uiView.bounds
            }
        }
    
}
