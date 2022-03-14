class Fight:CustomStringConvertible{
    let hero: Hero
    let monster: Monster
    
    init (_ hero: Hero, _ monster: Monster){
        self.hero = hero
        self.monster = monster
    }
    
    func fightBegin(){
        var gameOver = false
        var turn = 1
        let maxHeroHP = hero.maxHealthPoint
        let maxMonsterHP = monster.maxHealthPoint
        var attackerType:GameCharacterType
        var attackerName:String
        var input:String
        var winner:String
        
        print("\(monster.name) IS WAITING TO FIGHT!")
        print("FIGHT BEGINS!")
        
        repeat {
            
            if(turn % 2 == 0){
                attackerType = monster.type
                attackerName = monster.name

            }
            else{
                attackerType = hero.type
                attackerName = hero.name
            }
            
            print("----- TURN #: \(turn) -----")
            print("Current Turn is: \(attackerName)")
            print("\(hero.name) HP: \(hero.maxHealthPoint)/\(maxHeroHP)")
            print("\(monster.name) HP: \(monster.maxHealthPoint)/\(maxMonsterHP)")
            
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
                            monster.maxHealthPoint = monster.maxHealthPoint - (hero.weaponStrength * 1.2)
                            print("CRITICAL HIT!")
                            print("\(hero.name) attacks: \(hero.weaponStrength * 1.2) damage!")
                        }
                        else{
                            monster.maxHealthPoint = monster.maxHealthPoint - hero.weaponStrength
                            print("\(hero.name) attacks: \(hero.weaponStrength) damage!")
                        }
                        
                    case 2:
                        print("\(Action.HERO_IS_SNEAKING)")
                        print("\(hero.name) is sneaking.")
                        winner = hero.name
                        gameOver = true
                        fightOver(heroStat:"\(hero.name) HP: \(hero.maxHealthPoint)/\(maxHeroHP)", monsterStat:"\(monster.name) HP: \(monster.maxHealthPoint)/\(maxMonsterHP)", winner:winner)
                    
                    case 3:
                        print("\(Action.HERO_IS_RUNNING_AWAY)")
                        print("\(hero.name) gave up and lost the fight.")
                        
                        winner = monster.name
                        gameOver = true
                        fightOver(heroStat:"\(hero.name) HP: \(hero.maxHealthPoint)/\(maxHeroHP)", monsterStat:"\(monster.name) HP: \(monster.maxHealthPoint)/\(maxMonsterHP)", winner:winner)
                    default:
                        monster.maxHealthPoint = monster.maxHealthPoint - hero.weaponStrength
                        print("\(hero.name) attacks: \(hero.weaponStrength) damage!")
                }
                if(monster.maxHealthPoint <= 0){
                    winner = hero.name
                    gameOver = true
                    fightOver(heroStat:"\(hero.name) HP: \(hero.maxHealthPoint)/\(maxHeroHP)", monsterStat:"\(monster.name) HP: \(monster.maxHealthPoint)/\(maxMonsterHP)", winner:winner)
                }
            }
            else{
                print("\(Action.ENEMY_IS_ATTAKING)")
                if(Int.random(in: 1...10) <= 2){
                    print("\(monster.name) missed the attack!")
                }
                else{
                    hero.maxHealthPoint = hero.maxHealthPoint - monster.attackPower
                    print("\(monster.name) attacks: \(monster.attackPower) damage!")
                }
                if(hero.maxHealthPoint <= 0){
                    winner = monster.name
                    gameOver = true
                    fightOver(heroStat:"\(hero.name) HP: \(hero.maxHealthPoint)/\(maxHeroHP)", monsterStat:"\(monster.name) HP: \(monster.maxHealthPoint)/\(maxMonsterHP)", winner:winner)
                }
            }
            
            turn = turn + 1
            
            print("")
        } while (gameOver == false)
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

extension Fight{
    var description: String{
        get{
            return ""
        }
    }
}
