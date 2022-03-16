enum GameCharacterType {
    case HERO
    case MONSTER
    
    var gameCharacterString: String {
        switch self {
        case .HERO:
            return "HERO"
        case .MONSTER:
            return "MONSTER"
        }
    }
}
