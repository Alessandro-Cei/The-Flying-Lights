import SwiftUI
import PlaygroundSupport
import AVFoundation


struct ContentView: View {
    
    @State var handleX = 307.0
    @State var handleY = 378.0
    @State var handleView = "handle.png"
    @State var handleOpacity = true
    @State var spiritGlowX = -200.0
    @State var windowX = 203.0
    @State var windowXX = 168.0
    @State var seedX = 303.0
    @State var seedY = 378.0
    @State var seedOpacity = true
    @State var seedDelay = 9.0
    @State var seedFrontOpacity = false
    @State var firefliesOpacity = false
    @State var spiritX = 360.0
    @State var spiritDelay = 7.0
    @State var buttonOpacity = false
    @State private var isRotated = false
    @State var tapCounter = 1
    @State var windowStatus = "WindowClosed1.png"
    @State var kidStatus = "SadKid.png"
    @State var speechBubble = "SpiritSpeech1.png"
    @State var speechOpacity = true
    @State var tapSpeechCounter = 1
    @State var audioPlayer: AVAudioPlayer?
    @State var backgroundPlayer: AVAudioPlayer?
    @State var backgroundAudioFile: String?
    @State var audioFile: String?
    
    func playAudio() {
        if let audioURL = Bundle.main.url(forResource: audioFile, withExtension: "mp3") {
            do {
            try self.audioPlayer = AVAudioPlayer(contentsOf: audioURL)
            self.audioPlayer?.numberOfLoops = 0
            self.audioPlayer?.play()
        } catch {
            print ("Couldn't play audio. Error")
        }
        } else {
            print ("No audio file found")
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
            
            
            Image(uiImage:
                    #imageLiteral(resourceName:"SkyOutside.png"))
                .aspectRatio(contentMode: .fit)
                .onAppear {
                    backgroundAudioFile = "introMusic"
                    self.playBackgroundAudio()
                }
            
            Image(uiImage:
                    #imageLiteral(resourceName:"Mountains.png"))
                .position(x:200, y:380)
 
            Group {
            
    // SPIRIT GLOW
                        
                        Image(uiImage:
                                #imageLiteral(resourceName:"SpiritGlow.png"))
                            .aspectRatio(contentMode: .fit)
                            .position(x: spiritGlowX, y: 320)
                            .animation(.linear(duration: 4)
                                        .delay(2), value: spiritGlowX)
                            .onAppear{
                            spiritGlowX += +790
                          }
           
                
            
            Image(uiImage:
                    #imageLiteral
                  (resourceName:"Spirit.png"))
                .aspectRatio(contentMode: .fit)
                .position(x: spiritX, y: 420)
                .animation(.linear(duration: 3)
                            .delay(spiritDelay), value: spiritX)
                .onAppear{ spiritX -= 115
                }
            
//  SEED
            
            Image(uiImage:
                    #imageLiteral
                  (resourceName: "Seed.png"))
                .aspectRatio(contentMode: .fit)
                .position(x: seedX, y: seedY)
                .opacity(seedOpacity ? 1 : 0)
                .animation(.linear(duration: 1)
                         .delay(seedDelay), value: seedX)
                .onAppear{ seedX -= 30
                    //final 273
                }
           
                
                Image(uiImage: #imageLiteral
                      (resourceName: "Fireflies.png"))
                    .aspectRatio(contentMode: .fit)
                    .position(x: 220, y: 425)
                    .opacity(firefliesOpacity ? 1 : 0)
                    .animation(.linear(duration: 1)
                                .delay(3), value: firefliesOpacity)
                
                
                  }
            
            Image(uiImage:
                    #imageLiteral(resourceName:"BackgroundWithHole.png"))
                .aspectRatio(contentMode: .fit)
        
            
            Image(uiImage:
                    #imageLiteral(resourceName:windowStatus))
                .position(x: windowX, y:310)
            
            
    // SPEECH BUBBLE
            
            
            Image(uiImage:
                    #imageLiteral(resourceName:speechBubble))
                .aspectRatio(contentMode: .fit)
                .position(x: 220, y: 270)
                .opacity(speechOpacity ? 0 : 1)
                .animation(.easeInOut(duration: 1).delay(1), value: speechOpacity)
                .onTapGesture {
                    
                    switch tapSpeechCounter {
                    case 1:
                        tapSpeechCounter += 1
                        speechBubble = "SpiritSpeech2.png"
                        audioFile = "spiritTalk2"
                        self.playAudio()
                    case 2:
                        tapSpeechCounter += 1
                        speechBubble = "SpiritSpeech3.png"
                        audioFile = "spiritTalk3"
                        self.playAudio()
                        
                    case 3:
                        speechOpacity.toggle()
                        spiritDelay = 1
                        spiritX = -100
                        seedOpacity.toggle()
                        seedDelay = 1
                        seedFrontOpacity.toggle()
                        buttonOpacity.toggle()
                        firefliesOpacity.toggle()
                        
                        
                    default:
                        print("Error")
                    
                        
                    }
                }
            
            
            
            
            
    // HANDLE > apre finestra e cambia kid
            
            
            Image(uiImage:
                    #imageLiteral(resourceName: handleView))
                .aspectRatio(contentMode: .fit)
                .position(x: handleX, y: handleY)
                .opacity(handleOpacity ? 1 : 0)
                .rotationEffect(Angle.degrees(isRotated ? 5:0), anchor: .center)
                .animation(.easeInOut, value: isRotated)
                .onTapGesture {
                    
                    handleOpacity.toggle()
                    speechOpacity.toggle()
                    switch tapCounter {
                    case 1:
                        self.isRotated.toggle()
                        tapCounter += 1
                        windowStatus = "WindowOpen.png"
                        kidStatus = "WowKid.png"
                        windowX = windowXX
                        audioFile = "windowOpening"
                        self.playAudio()
                                backgroundAudioFile = "spiritMusic"
                                self.playBackgroundAudio()
                            
                        
                    default:
                        print("Error")
                    
                    }
                }
            
    // SEED OPACITA'
            
            Image(uiImage: #imageLiteral (resourceName: "SeedFront.png"))
                .aspectRatio(contentMode: .fit)
                .position(x: 180, y: 550)
                .opacity(seedFrontOpacity ? 1 : 0)
                .animation(.linear(duration: 1)
                            .delay(3), value: seedFrontOpacity)
                
//BUTTON
            
            
            Button(action:{}, label: {Text("Go Exploring")
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white, lineWidth: 1))
                    .opacity(buttonOpacity ? 1 : 0)
                    .animation(.linear(duration: 1)
                                .delay(3), value: buttonOpacity)
                    
            })
            
            
                
            Image(uiImage: #imageLiteral(resourceName:kidStatus))
                .aspectRatio(contentMode: .fit)
                .position(x: 100, y: 500)
                
                
            }
                
        .frame(width: 399, height: 648)
        }
    }
    


PlaygroundPage.current
    .setLiveView(ContentView())


//: [Start your first adventure!](@next)
