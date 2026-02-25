import SwiftUI

struct Clase : Identifiable, Hashable, Codable {
    var id = UUID()
    var clave : String
    var name: String
    var description : String
    var requirements : [String]
    var image : String

    enum CodingKeys : String, CodingKey {
        case clave
        case name
        case description
        case requirements
        case image
    }
}

