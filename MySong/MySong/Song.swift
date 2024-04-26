//
//  Song.swift
//  MySong
//
//  Created by Amina TomasMart on 28.02.2024.
//

import Foundation
import UIKit

struct Song {
    var name: String
    var albumName: String
    var atristName: String
    var imageURL: String
    var trackURL: String
    var imageUI: UIImage?
    var trackData: Data?
    
    static func getData() -> [Song] {
        
        let song1 = Song(name: "Shape of You", albumName: "÷", atristName: "Ed Sheeran", imageURL: "https://i1.sndcdn.com/artworks-hHRNAPyoL1gTPNV7-mUwz9A-t500x500.jpg", trackURL: "https://muzub.net/uploads/music/2023/05/Shape_of_You_Ed_Sheeran.mp3")
        
        let song2 = Song(name: "Dance Monkey", albumName: "The Kids Are Coming", atristName: "Tones and I", imageURL: "https://i1.sndcdn.com/artworks-erO0GmFDed6RaSxK-Nj5Npw-t500x500.jpg", trackURL: "https://dl2.mp3party.net/download/9105691")
        
        let song3 = Song(name: "Blinding Lights", albumName: "After Hours", atristName: "The Weeknd", imageURL: "https://upload.wikimedia.org/wikipedia/en/e/e6/The_Weeknd_-_Blinding_Lights.png", trackURL: "https://dl2.mp3party.net/download/9214084")
        
        let song4 = Song(name: "Don't Start Now", albumName: "Future Nostalgia", atristName: "Dua Lipa", imageURL: "https://upload.wikimedia.org/wikipedia/ru/2/26/Don’t_Start_Now.jpg", trackURL: "https://dl2.mp3party.net/download/9167306")
        
        let song5 = Song(name: "Someone You Loved", albumName: "Divinely Uninspired to a Hellish Extent", atristName: "Lewis Capaldi", imageURL: "https://upload.wikimedia.org/wikipedia/en/a/a6/Lewis_Capaldi_-_Someone_You_Loved.png", trackURL: "https://dl2.mp3party.net/download/9805029")
        
        return [song1, song2, song3, song4, song5]
    }
}
