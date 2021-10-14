//:[What if you had explored?](4\)%20The%20Icarus%20dilemma)

import SwiftUI
import PlaygroundSupport
import AVFoundation
import CoreFoundation
import CoreText

struct ContentView: View {
    
    @State var imageName = "frameBad.png"
    @State var audioPlayer: AVAudioPlayer?
    @State var backgroundPlayer: AVAudioPlayer?
    @State var backgroundAudioFile: String?
    @State var audioFile: String?
    @State var speechBubble = "SpeechSad.png"
    @State var speechOpacity = true
    @State var titleBubble = "title.png"
    @State var titleOpacity = true
    @State var logo2Width = 360.0
    @State var logo2Height = 270.0
    @State var logoOpacity = 0.0

    func playAudio() {
            if let audioURL = Bundle.main.url(forResource: audioFile, withExtension: "mp3") {
                do {
                    try self.audioPlayer = AVAudioPlayer(contentsOf: audioURL)
                    self.audioPlayer?.numberOfLoops = 0
                    self.audioPlayer?.play()
                    
                } catch {
                    print("Couldn't play audio. Error: \(error)")
                }
                
            } else {
                print("No audio file found")
            }
        }
    
    func playBackgroundAudio() {
            if let audioURL = Bundle.main.url(forResource: backgroundAudioFile, withExtension: "mp3") {
                do {
                    try self.backgroundPlayer = AVAudioPlayer(contentsOf: audioURL)
                    self.backgroundPlayer?.numberOfLoops = 10
                    self.backgroundPlayer?.play()
                    
                } catch {
                    print("Couldn't play audio. Error: \(error)")
                }
                
            } else {
                print("No audio file found")
            }
        }
    
    var body: some View {

            ZStack{
                Image(uiImage: #imageLiteral(resourceName: imageName))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .onAppear(){
                            backgroundAudioFile = "introMusic"
                                    self.playBackgroundAudio()
                                    }

                Image(uiImage: #imageLiteral(resourceName: "sadKid.png"))
                        .aspectRatio(contentMode: .fit)
                        .position(x: 100, y: 500)
                        .onTapGesture {
                        audioFile = "kidSadTalk"
                        self.playAudio()
                        speechOpacity.toggle()
                        }
                
                Image(uiImage: #imageLiteral(resourceName: "SpeechSad2.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 124, height: 97)
                        .position(x: 250, y: 520)
                        .opacity(speechOpacity ? 0 : 1)
                        .animation(.easeInOut(duration: 1), value: speechOpacity)
                        .onTapGesture {
                        speechOpacity.toggle()
                        logoOpacity = 1
                                }
                Image(uiImage: #imageLiteral(resourceName: "logo.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 300)
                    .opacity(logoOpacity)
                    .animation(.easeInOut(duration: 2).delay(2), value: logoOpacity)
                Image(uiImage: #imageLiteral(resourceName: "logo2.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: logo2Width, height: logo2Height)
                    .opacity(logoOpacity)
                    .animation(.easeInOut(duration: 2).delay(2), value: logoOpacity)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: logo2Width)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: logo2Height)
                    .onAppear(){
                        logo2Width += 10
                        logo2Height += 10
                    }
            }
            .frame(width: 397, height: 642)
    }
    }

PlaygroundPage.current.setLiveView(ContentView())
//:[Play again!](1\)%20The%20colorless%20kid...)

//:[What if you had explored?](4\)%20The%20Icarus%20dilemma) 


