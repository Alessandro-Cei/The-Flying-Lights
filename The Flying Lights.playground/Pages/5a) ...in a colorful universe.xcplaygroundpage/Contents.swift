//: [What if you had stayed?](@previous)

import SwiftUI
import PlaygroundSupport
import AVFoundation


struct ContentView: View {
    
    @State var logo2Width = 360.0
    @State var logo2Height = 270.0
    @State var logoOpacity = 0.0
    @State var speechDelay = 1.8
    @State var customDelay = 2.0
    @State var speechBubble = "speech1.png"
    @State var bubbleCounter = 1
    @State var glowHeight = 400.0
    @State var glowWidth = 400.0
    @State var mongobambinoX = 100.0
    @State var mongobambinoY = 920.0
    @State var mongobambinoWidth = 250.0
    @State var mongobambinoHeight = 250.0
    @State var mongobambinoOpacity = 1.0
    @State var flameOpacity = 1.0
    @State var speechOpacity = 0.0
    @State var audioPlayer: AVAudioPlayer?
    @State var backgroundPlayer: AVAudioPlayer?
    @State var backgroundAudioFile: String?
    @State var audioFile: String?
    @State var exploreOpacity = 0.0

  
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
    
    public struct ButtonWithoutAnimation: ButtonStyle {
        public func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
        }
    }
    
    var body: some View {
        
        
        
            ZStack{
                
                Image(uiImage: #imageLiteral(resourceName: "SkyBlue.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .onAppear(){
                        backgroundAudioFile = "coreMusic"
                        self.playBackgroundAudio()
                        mongobambinoY = 620.0
                        speechOpacity = 1.0
                    }
                
                Group {
                    
                    Image(uiImage: #imageLiteral(resourceName: "stars.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                        .position(x: 200, y: 400)
                    
                    Image(uiImage: #imageLiteral(resourceName: "starGlow.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: glowWidth, height: glowHeight)
                        .position(x: 200, y: 400)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: glowWidth)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: glowHeight)
                    
                    Image(uiImage: #imageLiteral(resourceName: "stars.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                        .position(x: 180, y: 50)
                    
                    Image(uiImage: #imageLiteral(resourceName: "starGlow.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: glowWidth, height: glowHeight)
                        .position(x: 180, y: 50)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: glowWidth)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: glowHeight)
                        .onAppear(){
                            glowWidth += 20
                            glowHeight += 20
                        }
                    
                    Image(uiImage: #imageLiteral(resourceName: "stars.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                        .position(x: 250, y: 750)
                        
                    
                    Image(uiImage: #imageLiteral(resourceName: "starGlow.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: glowWidth, height: glowHeight)
                        .position(x: 250, y: 750)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: glowWidth)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: glowHeight)
                        .onAppear(){
                            glowWidth += 20
                            glowHeight += 20
                        }
                }
                

                
                Image(uiImage: #imageLiteral(resourceName: "planetC.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .position(x: 340, y: 200)
                    .opacity(1)



                
                Image(uiImage: #imageLiteral(resourceName: "planetA.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .position(x: 320, y: 570)
                    .opacity(1)



                
                Image(uiImage: #imageLiteral(resourceName: "planetB.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .position(x: 90, y: 330)
                    .opacity(1)

                
                Image(uiImage: #imageLiteral(resourceName: "mongolfieraFiamma.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: mongobambinoWidth, height: mongobambinoHeight)
                    .position(x: mongobambinoX, y: mongobambinoY)
                    .opacity(mongobambinoOpacity)
                    .animation(.linear(duration: 2), value: mongobambinoY)
                    .animation(.linear(duration: 4).delay(8), value: mongobambinoOpacity)
                    .animation(.linear(duration: 2), value: mongobambinoHeight)
                    .animation(.linear(duration: 2), value: mongobambinoWidth)
                    
                Image(uiImage: #imageLiteral(resourceName: "speech.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .position(x: 180, y: 700)
                    .opacity(speechOpacity)
                    .animation(.easeInOut(duration: 1).delay(speechDelay), value: speechOpacity)
                    .onAppear(){
                        let seconds = 2.0
                        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                            audioFile = "kidTalkFast"
                            self.playAudio()
                        }
                    }
                    .onTapGesture {
                        speechDelay = 0.0
                        mongobambinoX = 330
                        mongobambinoY = 130
                        mongobambinoWidth = 40
                        mongobambinoHeight = 40
                        mongobambinoOpacity = 0.0
                        speechOpacity = 0.0
                        audioFile = "flame"
                        self.playAudio()
                        logoOpacity = 1.0
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
            .frame(width: 398, height: 650)
    }
}




PlaygroundPage.current.setLiveView(ContentView())
//:[Play again!](1\)%20The%20colorless%20kid...)

//: [What if you had stayed?](@previous)


