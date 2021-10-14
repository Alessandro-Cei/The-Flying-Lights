//: [Meet the fireflies again!](@previous)

import SwiftUI
import PlaygroundSupport
import AVFoundation

struct ContentView: View {
    
    @State var speechBubble = "speech1.png"
    @State var bubbleCounter = 1
    @State var speechOpacity = 0.0
    @State var flameOpacity = 0.0
    @State var flameVisible = false
    @State var movementSpeed = 1.0
    @State var showLayers = false
    @State var showFireworks = false
    @State var fireWorkHeight = 50.0
    @State var fireWorkWidth = 50.0
    @State var backgroundY = -325.0
    @State var layersY = -325.0
    @State var cloudDx1X = 850.0
    @State var cloudDx2X = 850.0
    @State var cloudSx1X = -450.0
    @State var cloudSx2X = -450.0
    @State var lightsHeight = 1950.0
    @State var lightsWidth = 400.0
    @State var mongolfieraX = 200.0
    @State var mongolfieraY = 330.0
    @State var audioPlayer: AVAudioPlayer?
    @State var backgroundPlayer: AVAudioPlayer?
    @State var fireworksPlayer: AVAudioPlayer?
    @State var backgroundAudioFile: String?
    @State var audioFile: String?
    @State var fireworksAudioFile: String?
    @State var visible1 = true
    @State var visible2 = true
    @State var visible3 = true
    @State var visible4 = true
    @State var showClouds = false
    
    
    
    private func pulsateImage(_ visibleNumber: Int) {
        
            switch visibleNumber {
                
                case 1:
                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false)) {
                        visible1.toggle()
                    }
                case 2:
                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false)) {
                        visible2.toggle()
                    }
                case 3:
                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: false)) {
                        visible3.toggle()
                    }
                case 4:
                withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: false)) {
                        visible4.toggle()
                }
                default:
                print("Wrong selection")
                
            }
        
    }

    private func expandImage(){
        withAnimation(Animation.linear(duration: 4).delay(0.5).repeatForever(autoreverses: false)) {
             fireWorkHeight += 100
             fireWorkWidth += 100
           }
       }
    
    private func expandLights(){
        withAnimation(Animation.linear(duration: 4).delay(0.5).repeatForever(autoreverses: false)) {
             lightsHeight += 400
             lightsWidth += 400
           }
       }
  
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
    
    
    func playFireworksAudio() {
            
            if let audioURL = Bundle.main.url(forResource: fireworksAudioFile, withExtension: "mp3") {
                do {
                    try self.fireworksPlayer = AVAudioPlayer(contentsOf: audioURL)
                    self.fireworksPlayer?.numberOfLoops = 2
                    self.fireworksPlayer?.play()
                } catch {
                    print("Couldn't play audio. Error: \(error)")
                }
                
            } else {
                print("No audio file found")
            }
        }
    
    
    
    var body: some View {
        
        
            ZStack{
                
                Image(uiImage: #imageLiteral(resourceName: "backgroundFinal.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 1950)
                    .position(x: 200, y: backgroundY)
                    .animation(.interpolatingSpring(stiffness: 15, damping: 5, initialVelocity: 0.5), value: backgroundY)
                    .onAppear(){
                        backgroundAudioFile = "coreMusic"
                        self.playBackgroundAudio()
                    }

                if showClouds {
                    Group {
                    
                        Image(uiImage: #imageLiteral(resourceName: "cloudDx1.png"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 1950)
                            .position(x: cloudDx1X, y: layersY - 10)
                            .animation(.interpolatingSpring(stiffness: 15, damping: 5, initialVelocity: 0.5), value: layersY)
                            .animation(.easeInOut(duration: 1.5).delay(0.5), value: cloudDx1X)
                            .onAppear(){
                                
                                cloudDx1X += -550
                            }
                            
                            
                            
                        Image(uiImage: #imageLiteral(resourceName: "cloudDx2.png"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 1950)
                            .position(x: cloudDx2X, y: layersY - 50)
                            .animation(.interpolatingSpring(stiffness: 15, damping: 5, initialVelocity: 0.5), value: layersY)
                            .animation(.easeInOut(duration: 1.5), value: cloudDx2X)
                            .onAppear(){
                                cloudDx2X += -650
                            }
                        
                        Image(uiImage: #imageLiteral(resourceName: "cloudSx1.png"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 1950)
                            .position(x: cloudSx1X, y: layersY - 20)
                            .animation(.interpolatingSpring(stiffness: 15, damping: 5, initialVelocity: 0.5), value: layersY)
                            .animation(.easeInOut(duration: 1.5).delay(0.5), value: cloudSx1X)
                            .onAppear(){
                                
                                cloudSx1X += 550
                            }
                            
                            
                        Image(uiImage: #imageLiteral(resourceName: "cloudSx2.png"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 1950)
                            .position(x: cloudSx2X, y: layersY)
                            .animation(.interpolatingSpring(stiffness: 15, damping: 5, initialVelocity: 0.5), value: layersY)
                            .animation(.easeInOut(duration: 1.5), value: cloudSx2X)
                            .onAppear(){
                                cloudSx2X += 650
                            }
                    
                    }
                    
                    Image(uiImage: #imageLiteral(resourceName: "lights.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: lightsWidth, height: lightsHeight)
                        .position(x: 200, y: layersY - 30)
                        .animation(.interpolatingSpring(stiffness: 15, damping: 5, initialVelocity: 0.5), value: layersY)
                        .opacity(visible4 ? 1 : 0)
                        .onAppear(){
                            pulsateImage(4)
                        }
                }
         
                    
                
                if showFireworks {
                    
                
                    Image(uiImage: #imageLiteral(resourceName: "fireWork1.png"))
                    
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: fireWorkWidth, height: fireWorkHeight)
                        .position(x: 170, y: 70)
                        .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: fireWorkWidth)
                        .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: fireWorkHeight)
                        .opacity(visible1 ? 1 : 0)
                        .onAppear(){
                            fireworksAudioFile = "firework"
                            self.playFireworksAudio()
                            pulsateImage(1)
                            expandImage()
                        }
                

                    Image(uiImage: #imageLiteral(resourceName: "fireWork2.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: fireWorkWidth, height: fireWorkHeight)
                        .position(x: 300, y: 50)
                        .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: fireWorkWidth)
                        .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: fireWorkHeight)
                        .opacity(visible2 ? 1 : 0)
                        .onAppear(){
                            pulsateImage(2)
                            expandImage()
                        }

                    Image(uiImage: #imageLiteral(resourceName: "fireWork3.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: fireWorkWidth, height: fireWorkHeight)
                        .position(x: 340, y: 160)
                        .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: fireWorkWidth)
                        .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: fireWorkHeight)
                        .opacity(visible3 ? 1 : 0)
                        .onAppear(){
                            pulsateImage(3)
                            expandImage()
                        }
                }

                
                ZStack {
                
                    Image(uiImage: #imageLiteral(resourceName: "mongobambino.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .animation(.interpolatingSpring(stiffness: 15, damping: 5, initialVelocity: 0.5).speed(movementSpeed), value: mongolfieraY)
                    
                        .frame(width: 350, height: 350)
                        .position(x: mongolfieraX, y: mongolfieraY)
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                            .onEnded({ value in
                                                if value.translation.width < 0 {
                                                    // Questo è un drag verso sinistra
                                                }

                                                if value.translation.width > 0 {
                                                    // Questo è un drag verso destra
                                                }
                                                if value.translation.height < 0 {
                                                    // Questo è un drag verso l'alto
                                                    if backgroundY == -175.0 {
                                                        showClouds = true
                                                    }
      
                                                    if backgroundY >= 725.0 {
                                                        showFireworks = true
                                                    }
                                                    
                                                    if backgroundY <= 725 && backgroundY > -407.0 {
                                                        backgroundY += 150
                                                        layersY += 150
                                                        flameVisible = true
                                                        audioFile = "flame"
                                                        self.playAudio()
                                                    }
                                                                                                
                                                    if backgroundY == 875 {
                                                        speechOpacity = 1.0
                                                        audioFile = "kidTalkFast"
                                                        self.playAudio()
                                                    }
                                                    
                                                }

                                                if value.translation.height > 0 {
                                                    // Questo è un drag verso il basso
                                                    
                                                }
                                            }))
                        
                    
                    Image(uiImage: #imageLiteral(resourceName: "flame.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .opacity(flameVisible ? 1 : 0)
                        .animation(.easeInOut(duration: 1), value: flameVisible)
                        .animation(.interpolatingSpring(stiffness: 15, damping: 5, initialVelocity: 0.5).speed(movementSpeed), value: mongolfieraY)
                        .position(x: mongolfieraX, y: mongolfieraY + 63)
                    
                    Image(uiImage: #imageLiteral(resourceName: "progress.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .position(x: 190, y: 350)
                        .frame(width: 50, height: 200)
                        
                        
                    Image(uiImage: #imageLiteral(resourceName: speechBubble))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 115, height: 115)
                        .position(x: 200, y: 540)
                        .opacity(speechOpacity)
                        .animation(.easeInOut(duration: 1), value: speechOpacity)
                        .onTapGesture {
                            switch bubbleCounter{
                                case 1:
                                    speechBubble = "speech2.png"
                                    bubbleCounter += 1
                                    audioFile = "kidTalkFast"
                                    self.playAudio()
                                case 2:
                                    movementSpeed = 0.25
                                    mongolfieraY += -600
                                    flameVisible = true
                                    audioFile = "flame"
                                    self.playAudio()
                                    speechOpacity = 0.0
                                default:
                                    print("Error")
                            }
                        }
                    
                    
                }
                
                
            }
            .frame(width: 400, height: 650)
        
        
    }
    
}




PlaygroundPage.current.setLiveView(ContentView())
//: [Don't stop exploring!](@next)
