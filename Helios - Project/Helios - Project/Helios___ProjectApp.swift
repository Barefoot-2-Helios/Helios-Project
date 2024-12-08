//___FILEHEADER___
import SwiftUI

@main
struct HeliosProjectApp: App {
    
    @State private var mediaPlayer = PlayerModel()

    //Setup an AVAudioSession when the app launches
    init() {
        mediaPlayer.configureAudioSession()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(mediaPlayer)
        }
    }
}
