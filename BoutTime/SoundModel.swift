//
//  SoundModel.swift
//  BoutTime
//
//  Created by Nuno Trindade on 03/09/16.
//  Copyright © 2016 Remarkable Code Ltd. All rights reserved.
//

import AudioToolbox

struct SoundModel {
    var soundFiles: [SoundFile] = [SoundFile(name: .CorrectDing, soundId: 0), SoundFile(name: .IncorrectBuzz, soundId: 1)]
    
    mutating func loadGameSounds() {
        var index = 0
        for var soundFile in soundFiles {
            let pathToSoundFile = NSBundle.mainBundle().pathForResource(soundFile.name.rawValue, ofType: "wav")
            let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
            AudioServicesCreateSystemSoundID(soundURL, &soundFile.soundId)
            soundFiles[index].soundId = soundFile.soundId
            index += 1
        }
    }
    
    func playCorrectSound() {
        if let soundFile = getSoundFile(.CorrectDing) {
            AudioServicesPlaySystemSound(soundFile.soundId)
        }
    }
    
    func playIncorrectSound() {
        if let soundFile = getSoundFile(.IncorrectBuzz) {
            AudioServicesPlaySystemSound(soundFile.soundId)
        }
    }
    
    func getSoundFile(soundName: SoundType) -> SoundFile? {
        for soundFile in soundFiles where soundFile.name == soundName {
            return soundFile
        }
        return nil
    }
}