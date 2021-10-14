//: [Let's see some more fireworks](@previous)

import SwiftUI
import PlaygroundSupport
import AVFoundation



struct ContentView: View {
    
    
    @State var customDelay = 2.0
    @State var speechBubble = "speech1.png"
    @State var bubbleCounter = 1
    @State var glowHeight = 400.0
    @State var glowWidth = 400.0
    @State var mongobambinoX = 205.0
    @State var mongobambinoY = 1400.0
    @State var mongobambinoOpacity = 1.0
    @State var flameOpacity = 1.0
    @State var speechOpacity = 0.0
    @State var rotation = false
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
                
                Image(uiImage: #imageLiteral(resourceName: "background.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .onAppear(){
                        backgroundAudioFile = "crisisMusic"
                        self.playBackgroundAudio()
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
                        .position(x: 200, y: 50)
                    
                    Image(uiImage: #imageLiteral(resourceName: "starGlow.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: glowWidth, height: glowHeight)
                        .position(x: 200, y: 50)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: glowWidth)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: glowHeight)
                        .onAppear(){
                            glowWidth += 20
                            glowHeight += 20
                        }
                }
        
                Image(uiImage: UIImage(named: "World1.png")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 562.5, height: 562.5)
                    .position(x: 170.5, y: 825)
                    .padding()
                    .onAppear {
                        rotation = true
                        mongobambinoY = 140.0
                        flameOpacity = 0.0
                        audioFile = "flame"
                        self.playAudio()
                    }
                    .padding()
                    .rotationEffect(rotation ? .zero : Angle.degrees(360), anchor: UnitPoint(x: 0.5, y: 0.975))
                    .animation(
                        .linear(duration: 40).repeatForever(autoreverses: false),
                        value: rotation
                    )
                
                
                ZStack {
                    
                    Image(uiImage: #imageLiteral(resourceName: "mongobambinoBig.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 700, height: 700)
                        .position(x: mongobambinoX, y: mongobambinoY)
                        .opacity(mongobambinoOpacity)
                        .animation(.linear(duration: 2), value: mongobambinoY)
                        .animation(.easeInOut(duration: 2), value: mongobambinoOpacity)
                    
                    Image(uiImage: #imageLiteral(resourceName: "flame.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .position(x: mongobambinoX, y: mongobambinoY + 130)
                        .opacity(flameOpacity)
                        .animation(.linear(duration: 2), value: mongobambinoY)
                        .animation(.linear(duration: 1), value: flameOpacity)
                }
                
                    
                    
                Image(uiImage: #imageLiteral(resourceName: speechBubble))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 115, height: 115)
                    .position(x: 202, y: 490)
                    .opacity(speechOpacity)
                    .animation(.easeInOut(duration: 1).delay(customDelay), value: speechOpacity)
                    .onAppear(){
                        speechOpacity = 1.0
                        audioFile = "kidTalkFast"
                        self.playAudio()
                    }
                    
                    .onTapGesture {
                        switch bubbleCounter{
                            case 1:
                                speechBubble = "speech2.png"
                                bubbleCounter += 1
                                audioFile = "kidTalkFast"
                                self.playAudio()
                            case 2:
                                speechBubble = "speech3.png"
                                bubbleCounter += 1
                                audioFile = "kidTalkFast"
                                self.playAudio()
                            case 3:
                                speechBubble = "speech4.png"
                                bubbleCounter += 1
                                audioFile = "kidTalkFast"
                                self.playAudio()
                            case 4:
                                customDelay = 0
                                exploreOpacity = 1.0
                                speechOpacity = 0.0
                            default:
                                print("Error")
                        }
                    }
                
                    
                
                    Button(action: {
                        mongobambinoY += -400
                        exploreOpacity = 0
                        flameOpacity = 1
                        audioFile = "flame"
                        self.playAudio()
                    }, label: {
                        Image(uiImage: #imageLiteral(resourceName: "keepExploring.png"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                    })
                        .opacity(exploreOpacity)
                        .animation(.linear(duration: 1), value: exploreOpacity)
                        .buttonStyle(ButtonWithoutAnimation())
                        .position(x: 200, y: 150)
                        
                    

                    Button(action: {
                        mongobambinoY += 1300
                        exploreOpacity = 0
                        mongobambinoOpacity = 0
                    }, label: {
                        Image(uiImage: #imageLiteral(resourceName: "goHome.png"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            
                    })
                        .opacity(exploreOpacity)
                        .animation(.linear(duration: 2), value: exploreOpacity)
                        .buttonStyle(ButtonWithoutAnimation())
                        .position(x: 200, y: 700)
                
                
                
              
                Image(uiImage: #imageLiteral(resourceName: "progress.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .position(x: 190, y: 350)
                    .frame(width: 50, height: 200)
                    .opacity(mongobambinoOpacity)
                    .animation(.easeInOut(duration: 2), value: mongobambinoOpacity)

            }
            .frame(width: 400, height: 650)
    }
}




PlaygroundPage.current.setLiveView(ContentView())
//: [Never stop your imagination](@next)

//:[Be safe and go home](5b\)%20...with%20a%20colorful%20imagination)
