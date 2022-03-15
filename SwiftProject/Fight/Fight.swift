class Fight: CustomStringConvertible {
    let hero: Hero
    let monster: Monster
    var winner: GameCharacter?
    var maxHeroHP: Int
    let maxMonsterHP: Int
    
    init (_ hero: Hero, _ monster: Monster) {
        self.hero = hero
        self.monster = monster
        self.maxHeroHP = hero.maxHealthPoint
        self.maxMonsterHP = monster.maxHealthPoint
    }
    
    func fightBegin() -> GameCharacter {
        var turn = 1
        var attackerType:GameCharacterType
        var attackerName:String
        var input:String
        
        print("\(monster.name) IS WAITING TO FIGHT!")
        print("FIGHT BEGINS!")
        
        repeat {
            if(turn % 2 == 0){
                attackerType = .MONSTER
                attackerName = monster.name
            }
            else{
                attackerType = .HERO
                attackerName = hero.name
            }
            
            print("----- TURN #: \(turn) -----")
            print("Current Turn is: \(attackerName)")
            print("\(getHealthStat(hero))")
            print("\(getHealthStat(monster))")
            
            if(attackerType == .HERO){
                print("""
                
                    \(hero.name), what move will you make?
                    1. Attack
                    2. Sneak
                    3. Give Up
                """)
                
                input = readLine()!
                let optionSelected = Int(input) ?? 1        // if an invalid number is entered, then default to Attack
                
                var heroAction:Action = Action.HERO_IS_ATTAKING
                switch(optionSelected) {
                    case 1:
                        heroAction = Action.HERO_IS_ATTAKING
                    case 2:
                        heroAction = Action.HERO_IS_SNEAKING
                    case 3:
                        heroAction = Action.HERO_IS_RUNNING_AWAY
                    default:
                        heroAction = Action.HERO_IS_ATTAKING
                }
                
                winner = performTurn(heroAction)
                
                if(monster.maxHealthPoint <= 0) {
                    winner = hero
                    return fightOver(winner: winner!)
                }
                
            }
            else{
                winner = performTurn(Action.ENEMY_IS_ATTAKING)
                
                if(hero.maxHealthPoint <= 0) {
                    winner = monster
                    return fightOver(winner: winner!)
                }
            }
            
            turn = turn + 1
            
            print("")
        } while (winner == nil)
        
        return winner!
    }
    
    private func applyDamage(_ from:GameCharacter, _ to:GameCharacter) {
        if(type(of: from) == Hero.self) {
            monster.takeDamage(dmPoint: hero.attack())
            print("\(hero.name) attacks: \(hero.attack()) damage!")
        }
        
        if(type(of: from) == Monster.self){
            hero.takeDamage(dmPoint: monster.attack())
        }
    }
    
    func performTurn(_ action:Action) -> GameCharacter? {
        if(action == .HERO_IS_ATTAKING) {
            print("\(Action.HERO_IS_ATTAKING)")
            applyDamage(hero, monster)
        }
        else if(action == .HERO_IS_SNEAKING){
            if(Int.random(in: 1...10) <= 3){
                print("\(hero.name) successfully sneaked past \(monster.name).")
                return fightOver(winner: hero)
            }
            else{
                print("\(hero.name) was not able to sneak out.")
                return fightOver(winner: monster)
            }
        }
        else if(action == .HERO_IS_RUNNING_AWAY){
            print("\(Action.HERO_IS_RUNNING_AWAY)")
            print("\(hero.name) gave up and lost the fight.")
            
            winner = monster
            return fightOver(winner: winner!)
        }
        else if(action == .ENEMY_IS_ATTAKING){
            print("\(Action.ENEMY_IS_ATTAKING)")
            applyDamage(monster, hero)
        }
        else{
            print("Invalid Selection")
        }
        
        return nil // No one wins yet
    }
    
    func fightOver(winner: GameCharacter) -> GameCharacter {
        print("""
        
        Fight is over
        
        Final Stats:
            \(getHealthStat(hero))
            \(getHealthStat(monster))
            
            Winner is: \(winner.name)
        """)
        
        return winner
    }
    
    func getHealthStat(_ gameCharacter:GameCharacter) -> String{
        if(type(of: gameCharacter) == Hero.self){
            return "\(hero.name) HP: \((hero.maxHealthPoint <= 0) ? 0 : hero.maxHealthPoint)/\(maxHeroHP)"
        }
        if(type(of: gameCharacter) == Monster.self){
            return "\(monster.name) HP: \((monster.maxHealthPoint <= 0) ? 0 : monster.maxHealthPoint)/\(maxMonsterHP)"
        }
        return ""
    }
}

extension Fight{
    var description: String{
        get{
            return ""
        }
    }
}
