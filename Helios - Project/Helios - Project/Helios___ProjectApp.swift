//___FILEHEADER___
import SwiftUI

@main
struct HeliosProjectApp: App {
    
    @State private var mediaPlayer = PlayerModel()
    @State private var milionaireGameViwModel = MillionaireGameViewModel()

    //Setup an AVAudioSession when the app launches
    init() {
        mediaPlayer.configureAudioSession()
    }
    var body: some Scene {
        WindowGroup {
            CardCarouselView()
                .environment(mediaPlayer)
                .environment(milionaireGameViwModel)
        }
    }
}
