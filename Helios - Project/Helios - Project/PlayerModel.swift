//
//  PlayerModel.swift
//  Helios - Project
//
//  Created by Letizia Granata on 07/12/24.
//
//


import Foundation
import AVFoundation
import Observation

@Observable
class PlayerModel {
    
    var audioPlayer: AVAudioPlayer?
    
    func configureAudioSession() {
        do {
            let session = AVAudioSession.sharedInstance()
            
            try session.setCategory(.playback, mode: .default)
            try session.setActive(true)
        } catch {
            // Handle error.
            print("Failed to configure audio session: \(error)")
        }
    }
    
    func playAudio(fileName: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("Failed to find audio file: \(fileName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
           audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error)")
        }
    }
    
}


