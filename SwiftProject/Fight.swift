class Fight {
    let hero: Hero
    let monster: Monster
    
    init (_ hero: inout Hero, _ monster: Monster) {
        self.hero = hero
        self.monster = monster
    }
    
    func fightBegin() -> Bool {
        var gameOver = false
        var turn = 1
        let maxHeroHP = hero.health
        let maxMonsterHP = monster.health
        var attackerType: GameCharacterType
        var attackerName: String
        var input: String
        var winner: String = ""
        
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
            print("\(hero.name) HP: \(hero.health)/\(maxHeroHP)")
            print("\(monster.name) HP: \(monster.health)/\(maxMonsterHP)")
            
            if(attackerType.gameCharacterString == "HERO"){
                
                print("""
                    "\(hero.name), what move will you make?
                    1. Attack
                    2. Sneak
                    3. Give Up
                """)
                input = readLine()!
                
                let optionSelected = Int(input) ?? 1        // if an invalid number is entered, then default to Red
                
                switch(optionSelected) {
                case 1:
                    print("\(Action.HERO_IS_ATTAKING)")
                    if(Int.random(in: 1...10) <= 3){
                        monster.health = monster.health - (hero.weaponStrength * 1.2)
                        print("CRITICAL HIT!")
                        print("\(hero.name) attacks: \(hero.weaponStrength * 1.2) damage!")
                    }
                    else{
                        monster.health = monster.health - hero.weaponStrength
                        print("\(hero.name) attacks: \(hero.weaponStrength) damage!")
                    }
                    
                case 2:
                    print("\(Action.HERO_IS_SNEAKING)")
                    if(Int.random(in: 1...10) <= 3) {
                        print("\(hero.name) is sneaking.")
                        winner = hero.name
                    }
                    else {
                        print("\(hero.name) got caught.")
                        winner = monster.name
                    }
                    
                    gameOver = true
                    fightOver(heroStat:"\(hero.name) HP: \(hero.health)/\(maxHeroHP)", monsterStat:"\(monster.name) HP: \(monster.health)/\(maxMonsterHP)", winner:winner)
                    
                    return winner == hero.name
                                        
                case 3:
                    print("\(Action.HERO_IS_RUNNING_AWAY)")
                    print("\(hero.name) gave up and lost the fight.")
                    
                    winner = monster.name
                    gameOver = true
                    fightOver(heroStat:"\(hero.name) HP: \(hero.health)/\(maxHeroHP)", monsterStat:"\(monster.name) HP: \(monster.health)/\(maxMonsterHP)", winner:winner)
                    
                    return winner == hero.name
                default:
                    monster.health = monster.health - hero.weaponStrength
                    print("\(hero.name) attacks: \(hero.weaponStrength) damage!")
                }
                if(monster.health <= 0){
                    winner = hero.name
                    gameOver = true
                    fightOver(heroStat:"\(hero.name) HP: \(hero.health)/\(maxHeroHP)", monsterStat:"\(monster.name) HP: \(monster.health)/\(maxMonsterHP)", winner:winner)
                    
                    return winner == hero.name
                }
            }
            else{
                print("\(Action.ENEMY_IS_ATTAKING)")
                if(Int.random(in: 1...10) <= 2){
                    print("\(monster.name) missed the attack!")
                }
                else{
                    hero.health = hero.health - monster.attackPower
                    print("\(monster.name) attacks: \(monster.attackPower) damage!")
                }
                if(hero.health <= 0){
                    winner = monster.name
                    gameOver = true
                    fightOver(heroStat:"\(hero.name) HP: \(hero.health)/\(maxHeroHP)", monsterStat:"\(monster.name) HP: \(monster.health)/\(maxMonsterHP)", winner:winner)
                    
                    return winner == hero.name
                }
            }
                        
            turn = turn + 1
            
            print("")
        } while (gameOver == false)
        
        return winner == hero.name
    }
    
    func fightOver(heroStat:String, monsterStat:String, winner:String){
        print("Fight is over")
        print("""
        Final Stats:
            \(heroStat)
            \(monsterStat)
            Winner is: \(winner)
        """)
    }
}

extension Fight: CustomStringConvertible {
    var description: String{
        get{
            return ""
        }
    }
}
