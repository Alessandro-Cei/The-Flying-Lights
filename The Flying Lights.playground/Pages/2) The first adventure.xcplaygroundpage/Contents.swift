//:[Go back in the grey room](1\)%20The%20colorless%20kid...)

import SwiftUI
import PlaygroundSupport
import AVFoundation

struct ContentView: View {
    
    @State var firefliesHeight = 160.0
    @State var firefliesWidth = 220.0
    @State var ffly1x = 160
    @State var ffly1y = 100
    @State var ffly2x = 60
    @State var ffly2y = 30
    @State var ffly3x = -30
    @State var ffly3y = 30
    @State var ffly4x = 10
    @State var ffly4y = 140
    @State var ffly5x = 60
    @State var ffly5y = 95
    @State var ffly6x = 0
    @State var ffly6y = 80
    @State var buttonW = 173.0
    @State var buttonH = 38.0
    @State var imageName = "Sky outside.png"
    @State var audioPlayer: AVAudioPlayer?
    @State var backgroundPlayer: AVAudioPlayer?
    @State var backgroundAudioFile: String?
    @State var audioFile: String?
    @State var visible1 = true
    @State var visible2 = true
    @State var speechBubble = "bubble.png"
    @State var speechOpacity = true
    @State var assetOpacity = true
    
private func pulsateImage(_ visibleNumber: Int) {
        
        switch visibleNumber {
                
    case 1:
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    
            visible1.toggle()
            
        }
    case 2:
            withAnimation(Animation.easeOut(duration: 3).repeatForever(autoreverses: false)) {
            visible2.toggle()
        }
               default:
             print("Wrong selection")
       }
  }

private func expandImage(){
        withAnimation(Animation.linear(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
             firefliesHeight += 40
             firefliesWidth += 50
           }
       }
private func expandImage2(){
        withAnimation(Animation.linear(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
             buttonW += 4
             buttonH += 2
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
    
    
    var body: some View {

            ZStack{
                Group{
                Image(uiImage:
                        #imageLiteral(resourceName:imageName))
                    .aspectRatio(contentMode: .fit)
                    .onAppear(){
                        backgroundAudioFile = "coreMusic"
                        self.playBackgroundAudio()
                    }
                
                Image(uiImage:
                        #imageLiteral(resourceName:"MountainsOutside.png"))
                    .aspectRatio(contentMode: .fit)
                    .position(x:200, y:400)
                
                    Image(uiImage:
                            #imageLiteral(resourceName:"Bambino glow.png"))
                            .aspectRatio(contentMode: .fit)
                        .position(x: 100, y: 500)
                        .onTapGesture {
                            audioFile = "kidTalk"
                            self.playAudio()
                        }
                
                Image(uiImage: #imageLiteral(resourceName: "ffly.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .position(x: CGFloat(ffly1x), y: CGFloat(ffly1y))
                    .frame(width: 3, height: 3)
                    .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: ffly1x)
                    .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: ffly1y)

                    .onAppear{
                          ffly1y += +30
                          ffly1x = -7
                                  }
                Image(uiImage: #imageLiteral(resourceName: "ffly.png"))
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .position(x: CGFloat(ffly2x), y: CGFloat(ffly2y))
                   .frame(width: 3, height: 3)
                   .animation(.easeInOut(duration: 0.75).repeatForever(autoreverses: true), value: ffly2x)
                   .animation(.easeInOut(duration: 0.75).repeatForever(autoreverses: true), value: ffly2y)
                   .onAppear{
                       ffly2x += +25
                       ffly2y += +15
                                 }
                Image(uiImage: #imageLiteral(resourceName: "ffly.png"))
               .resizable()
               .aspectRatio(contentMode: .fit)
               .position(x: CGFloat(ffly3x), y: CGFloat(ffly3y))
               .frame(width: 3, height: 3)
               .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: ffly3x)
               .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: ffly3y)
               .onAppear{
                   ffly3x += +25
                   ffly3y += +15
                             }
                Image(uiImage: #imageLiteral(resourceName: "ffly.png"))
               .resizable()
               .aspectRatio(contentMode: .fit)
               .position(x: CGFloat(ffly4x), y: CGFloat(ffly4y))
               .frame(width: 3, height: 3)
               .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: ffly4x)
               .onAppear{
                   ffly4x += +25
                             }
                Image(uiImage: #imageLiteral(resourceName: "ffly.png"))
               .resizable()
               .aspectRatio(contentMode: .fit)
               .position(x: CGFloat(ffly5x), y: CGFloat(ffly5y))
               .frame(width: 3, height: 3)
               .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: ffly5x)
               .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: ffly5y)

               .onAppear{
                   ffly5x += +5
                   ffly5y += +12
                             }
                Image(uiImage: #imageLiteral(resourceName: "ffly.png"))
               .resizable()
               .aspectRatio(contentMode: .fit)
               .position(x: CGFloat(ffly6x), y: CGFloat(ffly6y))
               .frame(width: 3, height: 3)
               .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: ffly6x)
               .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: ffly6y)
               .onAppear{
                   ffly6x += +40
                   ffly6y += +20
                             }
                Image(uiImage: #imageLiteral(resourceName: "Fireflies.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: firefliesWidth, height: firefliesHeight)
                    .position(x: 260, y: 400)
                    .animation(.linear(duration: 2).repeatForever(autoreverses: true), value: firefliesWidth)
                    .animation(.linear(duration: 2).repeatForever(autoreverses: true), value: firefliesHeight)
                    .opacity(visible1 ? 0.7 : 1)
                   .onAppear {
                            pulsateImage(1)
                            expandImage()
                        }
                   .onTapGesture {
                            audioFile = "fireflies"
                            self.playAudio()
                       speechOpacity.toggle()
                       assetOpacity = false
                        }
                }
                Image(uiImage: #imageLiteral(resourceName: "bubble.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 126, height: 38)
                    .position(x: 250, y: 530)
                    .opacity(speechOpacity ? 0 : 1)
                    .animation(.easeInOut(duration: 1), value: speechOpacity)
                    .onTapGesture {
                        speechOpacity.toggle()
                    }
                
                Image(uiImage: #imageLiteral(resourceName: "PB1.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 128)
                    .position(x: 360, y: 575)
                    .opacity(assetOpacity ? 0 : 1)
                    .animation(.easeInOut(duration: 1), value: assetOpacity)
                
                Image(uiImage: #imageLiteral(resourceName: "Clouds.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 195)
                    .position(x: 200, y: 100)
                    .opacity(assetOpacity ? 0 : 1)
                    .animation(.easeInOut(duration: 7), value: assetOpacity)
                
                Image(uiImage: #imageLiteral(resourceName: "Flashes.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 214, height: 180)
                    .position(x: 160, y: 100)
                    .opacity(assetOpacity ? 0 : 1)
                    .animation(.easeInOut(duration: 7), value: assetOpacity)
                    .opacity(visible2 ? 1 : 0)
                    .onAppear {
                            pulsateImage(2)
                        }
                
                Image(uiImage: #imageLiteral(resourceName: "airBalloon.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 16, height: 24)
                    .position(x: 235, y: 215)
                    .opacity(assetOpacity ? 0 : 1)
                    .animation(.easeInOut(duration: 1).delay(7), value: assetOpacity)
                
                Image(uiImage: #imageLiteral(resourceName: "keepExpButton.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: buttonW, height: buttonH)
                    .position(x: 270, y: 290)
                    .opacity(assetOpacity ? 0 : 1)
                    .animation(.easeInOut(duration: 1).delay(7), value: assetOpacity)
                    .onTapGesture {
                        expandImage2()
                         }
            }
            .frame(width: 399, height: 648)
    }
}

PlaygroundPage.current.setLiveView(ContentView())


//: [The world above the clouds](@next)
