//
//  TypeCastingTest.swift
//  Brother
//
//  Created by zhang on 15/11/30.
//  Copyright © 2015年 zhang. All rights reserved.
//

import Foundation


class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name:String, director:String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String,artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}


class TypeCastingTest {
    
    func test() {
        
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]
        
        
        var movieCount = 0
        var songCount = 0
        
        for item in library {
            if item is Movie {
                
                movieCount++
                
            } else if item is Song {
                
                songCount++
                
            }
        }
        print("movie count = \(movieCount) song count = \(songCount)")
        
        
        for item in library {
            if let moive = item as? Movie {
                print("movie : \(moive.name) dir\(moive.director)")
            } else if let song = item as? Song {
                print("Song : \(song.name) \(song.artist)")
            }
        }
        
        let someObjects: [AnyObject] = [
            Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
            Movie(name: "Moon", director: "Duncan Jones"),
            Movie(name: "Alien", director: "Ridley Scott")
        ]
        
        for object in someObjects {
            let moive = object as! Movie
            print("Moive \(moive.name) \(moive.director)")
        }
        
   /**
     知识点: 这个地方的一个强制转换是将这里面的所有元素都强制转换为Moive类型的数据.
    */
        for moive in someObjects as! [Movie] {
            print("moive \(moive.name) \(moive.director)")
        }
        
    }
    
}



















