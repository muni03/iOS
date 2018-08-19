import UIKit

let player1: [String:Any] = ["name":"Joe Smith", "height":42, "playedSoccer":true, "guardians":"Jim and Jan Smith"]
let player2: [String:Any] = ["name":"Jill Tanner", "height":36, "playedSoccer":true, "guardians":"Clara Tanner"]
let player3: [String:Any] = ["name":"Bill Bon", "height":43, "playedSoccer":true, "guardians":"Sara and Jenny Bon"]
let player4: [String:Any] = ["name":"Eva Gordon", "height":45, "playedSoccer":false, "guardians":"Wendy and Mike Gordon"]
let player5: [String:Any] = ["name":"Matt Gill", "height":40, "playedSoccer":false, "guardians":"Charles and Sylvia Gill"]
let player6: [String:Any] = ["name":"Kimmy Stein", "height":41, "playedSoccer":false, "guardians":"Bill and Hillary Stein"]
let player7: [String:Any] = ["name":"Sammy Adams", "height":45, "playedSoccer":false, "guardians":"Jeff Adams"]
let player8: [String:Any] = ["name":"Karl Saygan", "height":42, "playedSoccer":true, "guardians":"Heather Bledsoe"]
let player9: [String:Any] = ["name":"Suzane Greenberg", "height":44, "playedSoccer":true, "guardians":"Henrietta Dumas"]
let player10: [String:Any] = ["name":"Sal Dali", "height":41, "playedSoccer":false, "guardians":"Gala Dali"]
let player11: [String:Any] = ["name":"Joe Kavalier", "height":39, "playedSoccer":false, "guardians":"Sam and Elaine Kavalier"]
let player12: [String:Any] = ["name":"Ben Finkelstein", "height":44, "playedSoccer":false, "guardians":"Aaron and Jill Finkelstein"]
let player13: [String:Any] = ["name":"Diego Soto", "height":41, "playedSoccer":true, "guardians":"Robin and Sarika Soto"]
let player14: [String:Any] = ["name":"Chloe Alaska", "height":47, "playedSoccer":false, "guardians":"David and Jamie Alaska"]
let player15: [String:Any] = ["name":"Arnold Willis", "height":43, "playedSoccer":false, "guardians":"Claire Willis"]
let player16: [String:Any] = ["name":"Phillip Helm", "height":44, "playedSoccer":true, "guardians":"Thomas Helm and Eva Jones"]
let player17: [String:Any] = ["name":"Les Clay", "height":42, "playedSoccer":true, "guardians":"Wynonna Brown"]
let player18: [String:Any] = ["name":"Herschel Krustofski", "height":45, "playedSoccer":true, "guardians":"Hyman and Rachel Krustofski"]

let players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]
var dragons = [[String:Any]]()
var sharks = [[String:Any]]()
var raptors = [[String:Any]]()
var letters = [String]()

var totalHeight = 0
for player in players {
    guard let h = player["height"] as? Int else {print("Player height not found."); break}
    totalHeight += h
}
var avgHeight = totalHeight / players.count
print("Avg height of all players is  \(avgHeight)")

//exceeds ...thinking
//if player3["height"]! > player1["height"]!{
    //print("\(player3["name"]!) is taller than \(player1["name"]!)")
    //print(Double(player3["height"]!)! + 6)
//}

func makeTeams() {
    for player in players {
        
        guard let p = player["playedSoccer"] as? Bool else {print("Could not find player's soccer experience."); break}
        guard let h = player["height"] as? Int else {print("Could not find player's height."); break}
        
        if p == true && dragons.count <= sharks.count && dragons.count <= raptors.count {
            dragons.append(player)
            
        }else if p == true && sharks.count <= raptors.count && sharks.count <= dragons.count{
            sharks.append(player)
            
        }else if p == true && raptors.count <= dragons.count && raptors.count <= sharks.count{
            raptors.append(player)
            
        }else if p == false && dragons.count <= sharks.count && dragons.count <= raptors.count {
            dragons.append(player)
            
        }else if p == false && sharks.count <= raptors.count && sharks.count <= dragons.count{
            sharks.append(player)
            
        }else if p == false && raptors.count <= dragons.count && raptors.count <= sharks.count{
            raptors.append(player)
        }
    }
}


func makeLetters() {
    for dragon in dragons{
        guard let guardian = dragon["guardians"] as? String else {print("Player guardian not found."); break}
        guard let name = dragon["name"] as? String else {print("Player name not found."); break}
        letters.append("Hello \(guardian), \(name) has been placed on team Dragons! Your first practice will be March 17, at 1pm. See you there!")
    }

    for shark in sharks{
        guard let guardian = shark["guardians"] as? String else {print("Player guardian not found."); break}
        guard let name = shark["name"] as? String else {print("Player name not found."); break}
        letters.append("Hello \(guardian), \(name) has been placed on team Sharks! Your first practice will be March 17, at 3pm. See you there!")
    }

    for raptor in raptors{
        guard let guardian = raptor["guardians"] as? String else {print("Player guardian not found."); break}
        guard let name = raptor["name"] as? String else {print("Player name not found."); break}
        letters.append("Hello \(guardian), \(name) has been placed on team Raptors! Your first practice will be March 18, at 1pm. See you there!")
    }
}

makeTeams()
makeLetters()

for letter in letters {
    print(letter)
}


