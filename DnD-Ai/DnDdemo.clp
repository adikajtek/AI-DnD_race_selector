
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Auto Demo Example
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))

(deftemplate state-list
   (slot current)
   (multislot sequence))

(deffacts startup
   (state-list))

;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>

  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************
(defrule WhyDnD ""

   (logical (start))

   =>

   (assert (UI-state (display WhyDnD)
                     (relation-asserted WhyDnD)
                     (response No)
                     (valid-answers GoAdventure LOTR Snowflake DoRPG))))

(defrule EveryHeroSpecial ""

	(or
   (logical (WhyDnD GoAdventure))
   (logical (NoDragon Foch))
   (logical (WhiteDude URight)))

   =>

   (assert (UI-state (display EveryHeroSpecial)
                     (relation-asserted EveryHeroSpecial)
                     (response No)
                     (valid-answers Special ElfOrSmt))))

(defrule PlaySE ""

   (logical (WhyDnD DoRPG))


   =>

   (assert (UI-state (display PlaySE)
                     (relation-asserted PlaySE)
                     (response No)
                     (valid-answers ElvesDumb ))))

(defrule LikeFRaces ""

	(or
   (logical (WhyDnD LOTR))
   (logical (EveryHeroSpecial ElfOrSmt)))

   =>

   (assert (UI-state (display LikeFRaces)
                     (relation-asserted LikeFRaces)
                     (response No)
                     (valid-answers MT TolkienSuck))))

(defrule FINESpecial ""

	(or
   (logical (LikeFRaces TolkienSuck))
   (logical (WhyDnD Snowflake)))

   =>

   (assert (UI-state (display FINESpecial)
                     (relation-asserted FINESpecial)
                     (response No)
                     (valid-answers DnMnWrong MFDragon Undecidextimes))))

(defrule WhiteDude ""


   (logical (FINESpecial DnMnWrong))


   =>

   (assert (UI-state (display WhiteDude)
                     (relation-asserted WhiteDude)
                     (response No)
                     (valid-answers DarkSleeve URight))))

(defrule WeGotOptions ""


   (logical (WhiteDude DarkSleeve))


   =>

   (assert (UI-state (display WeGotOptions)
                     (relation-asserted WeGotOptions)
                     (response No)
                     (valid-answers MyMom MonsterAllAlong))))

(defrule WhyPeopleMisunderstand ""


   (logical (WeGotOptions MyMom))


   =>

   (assert (UI-state (display WhyPeopleMisunderstand)
                     (relation-asserted WhyPeopleMisunderstand)
                     (response No)
                     (valid-answers DarkBadass BrutParent DevilHorns LizardPerson))))

(defrule HumanOrTiny ""


   (logical (LikeFRaces MT))


   =>

   (assert (UI-state (display HumanOrTiny)
                     (relation-asserted HumanOrTiny)
                     (response No)
                     (valid-answers KidSize NoPedo BigSize ))))


(defrule HowSilly ""


   (logical (HumanOrTiny KidSize))


   =>

   (assert (UI-state (display HowSilly)
                     (relation-asserted HowSilly)
                     (response No)
                     (valid-answers DarkHumor MagicnGlitter GoHalfling ))))

(defrule NDYDwarfyNimble ""


   (logical (Halfling OffBHobbit))


   =>

   (assert (UI-state (display NDYDwarfyNimble)
                     (relation-asserted NDYDwarfyNimble)
                     (response No)
                     (valid-answers MakeHardy MakeNimble))))

(defrule WoodsyOrSP ""


   (logical (Gnome MagicHobbit))


   =>

   (assert (UI-state (display WoodsyOrSP)
                     (relation-asserted WoodsyOrSP)
                     (response No)
                     (valid-answers Mushroom Toys))))


(defrule WhatIsIt ""


   (logical (Human Waait))


   =>

   (assert (UI-state (display WhatIsIt)
                     (relation-asserted WhatIsIt)
                     (response No)
                     (valid-answers HumanLame))))

(defrule MonsternPretty ""


   (logical (WhatIsIt HumanLame))


   =>

   (assert (UI-state (display MonsternPretty)
                     (relation-asserted MonsternPretty)
                     (response No)
                     (valid-answers StillMagicnPretty MonsterBlood))))

(defrule StronkMen ""

    (or
   (logical (HumanOrTiny BigSize))
   (logical (LessClassic BeGiant)))


   =>

   (assert (UI-state (display StronkMen)
                     (relation-asserted StronkMen)
                     (response No)
                     (valid-answers Gentle Poomp))))


(defrule LithnPretty ""

   (logical (HumanOrTiny NoPedo))



   =>

   (assert (UI-state (display LithnPretty)
                     (relation-asserted LithnPretty)
                     (response No)
                     (valid-answers FellPretty EvenLift DontLikeOptions))))


(defrule WhatMagic ""

   (logical (Elf ImDone))



   =>

   (assert (UI-state (display WhatMagic)
                     (relation-asserted WhatMagic)
                     (response No)
                     (valid-answers MadeOfMagic Treehugger NonRight))))

(defrule WhatProblem ""

   (logical (WhatMagic NonRight))

   =>

   (assert (UI-state (display WhatProblem)
                     (relation-asserted WhatProblem)
                     (response No)
                     (valid-answers KindOfElf DarknBrooding MermaidsElf ElfFey))))


(defrule LessClassic ""

   (logical (LithnPretty DontLikeOptions))

   =>

   (assert (UI-state (display LessClassic)
                     (relation-asserted LessClassic)
                     (response No)
                     (valid-answers BeGiant LetsMove))))

(defrule HardOrStrong ""

   (logical (Dwarf DrinknAxe))

   =>

   (assert (UI-state (display HardOrStrong)
                     (relation-asserted HardOrStrong)
                     (response No)
                     (valid-answers HardnHilly StoneStrong AngryAss))))

(defrule Edgelord ""

   (logical (WhyPeopleMisunderstand DarkBadass))

   =>

   (assert (UI-state (display Edgelord)
                     (relation-asserted Edgelord)
                     (response No)
                     (valid-answers HollyFallen MeanDwarf QuicknLithe))))

(defrule UncommonRaces ""

    (or
   (logical (LessClassic LetsMove))
   (logical (WeirdsSake FamiliarWeird)))


   =>

   (assert (UI-state (display UncommonRaces)
                     (relation-asserted UncommonRaces)
                     (response No)
                     (valid-answers CanBeAnimal Dopplelganger CanClassicMonster Robot Aquaman GodMission))))


(defrule MoreAngels ""

   (logical (Aasimar FOffTieflings))


   =>

   (assert (UI-state (display MoreAngels)
                     (relation-asserted MoreAngels)
                     (response No)
                     (valid-answers Goodness Vengence BadAngel))))


(defrule NoDragon ""

   (logical (FINESpecial MFDragon))


   =>

   (assert (UI-state (display NoDragon)
                     (relation-asserted NoDragon)
                     (response No)
                     (valid-answers Foch CalledDND))))

(defrule FineColor ""

   (logical (NoDragon CalledDND))


   =>

   (assert (UI-state (display FineColor)
                     (relation-asserted FineColor)
                     (response No)
                     (valid-answers Yay))))
(defrule CloseEnough ""

   (logical (Dragonborn IsntDragon))


   =>

   (assert (UI-state (display CloseEnough)
                     (relation-asserted CloseEnough)
                     (response No)
                     (valid-answers OkFine LemmeDragon))))

(defrule PartOrAllWay ""

   (logical (UncommonRaces CanClassicMonster))


   =>

   (assert (UI-state (display PartOrAllWay)
                     (relation-asserted PartOrAllWay)
                     (response No)
                     (valid-answers TouchMonster MAxMonster))))

(defrule BigOrSmallVersion ""

   (logical (PartOrAllWay MAxMonster))


   =>

   (assert (UI-state (display BigOrSmallVersion)
                     (relation-asserted BigOrSmallVersion)
                     (response No)
                     (valid-answers BigV SmallV))))


(defrule ComicRelief ""

   (logical (WeGotOptions MonsterAllAlong))


   =>

   (assert (UI-state (display ComicRelief)
                     (relation-asserted ComicRelief)
                     (response No)
                     (valid-answers ThisFunny SLaughter))))

(defrule FunSizeEvil ""
   (or
   (logical (ComicRelief SLaughter))
   (logical (HowSilly DarkHumor)))
   =>
   (assert (UI-state (display FunSizeEvil)
                     (relation-asserted FunSizeEvil)
                     (response No)
                     (valid-answers Yea Nay))))

(defrule SorryWhatPower ""

   (logical (ComicRelief ThisFunny))
   =>

   (assert (UI-state (display SorryWhatPower)
                     (relation-asserted SorryWhatPower)
                     (response No)
                     (valid-answers Strenght Intellect))))

(defrule TedCruz ""
   (or
   (logical (WhyPeopleMisunderstand LizardPerson))
   (logical (UFurry Lizard)))
   =>

   (assert (UI-state (display TedCruz)
                     (relation-asserted TedCruz)
                     (response No)
                     (valid-answers Snek GeneralReptile AMFDragon))))

(defrule SurpriseAttacks ""

   (logical (SorryWhatPower Strenght))
   =>

   (assert (UI-state (display SurpriseAttacks)
                     (relation-asserted SurpriseAttacks)
                     (response No)
                     (valid-answers FaceHeadOn LazyAmbush))))

(defrule ToConquer ""

   (logical (SorryWhatPower Intellect))
   =>

   (assert (UI-state (display ToConquer)
                     (relation-asserted ToConquer)
                     (response No)
                     (valid-answers Deception Tactical))))

(defrule AnimalPerson ""

   (logical (FINESpecial Undecidextimes))
   =>

   (assert (UI-state (display AnimalPerson)
                     (relation-asserted AnimalPerson)
                     (response No)
                     (valid-answers LikeAFurry GrossSpecial))))

(defrule UFurry ""
   (or
   (logical (AnimalPerson LikeAFurry))
   (logical (UncommonRaces CanBeAnimal)))
   =>

   (assert (UI-state (display UFurry)
                     (relation-asserted UFurry)
                     (response No)
                     (valid-answers Horse Bird OwO Lizard))))

(defrule Fursona ""

   (logical (UFurry OwO))
   =>

   (assert (UI-state (display Fursona)
                     (relation-asserted Fursona)
                     (response No)
                     (valid-answers Cat Cow Elephant OtherFurry))))


(defrule EagleCrow ""

   (logical (UFurry Bird))
   =>

   (assert (UI-state (display EagleCrow)
                     (relation-asserted EagleCrow)
                     (response No)
                     (valid-answers MajesticnFree Caw))))


(defrule WeirdsSake ""

   (logical (AnimalPerson GrossSpecial))
   =>

   (assert (UI-state (display WeirdsSake)
                     (relation-asserted WeirdsSake)
                     (response No)
                     (valid-answers FamiliarWeird YeahFU))))
(defrule ParentGenie ""

   (logical (WeirdsSake YeahFU))
   =>

   (assert (UI-state (display ParentGenie)
                     (relation-asserted ParentGenie)
                     (response No)
                     (valid-answers YeWorks WillSmith))))

(defrule PlaneHoppers ""

   (logical (ParentGenie WillSmith))
   =>

   (assert (UI-state (display PlaneHoppers)
                     (relation-asserted PlaneHoppers)
                     (response No)
                     (valid-answers FOutThere UglyElves))))

(defrule BlueVulcan ""

   (logical (PlaneHoppers UglyElves))
   =>

   (assert (UI-state (display BlueVulcan)
                     (relation-asserted BlueVulcan)
                     (response No)
                     (valid-answers UGotMe SpaceElves))))
(defrule Tentacles ""

   (logical (BlueVulcan SpaceElves))
   =>

   (assert (UI-state (display Tentacles)
                     (relation-asserted Tentacles)
                     (response No)
                     (valid-answers ShitImAbout MoreMysteriousTentacles))))

(defrule GithFlavour ""

   (logical (Gith ExplodeHeads))
   =>

   (assert (UI-state (display GithFlavour)
                     (relation-asserted GithFlavour)
                     (response No)
                     (valid-answers ImmortalGith KungFu))))

(defrule GeniesElement ""

   (logical (Genasi CaptainPlanet))
   =>

   (assert (UI-state (display GeniesElement)
                     (relation-asserted GeniesElement)
                     (response No)
                     (valid-answers FireReal RockHard WeFloat WaterLover))))





;;;*********************
;;;* ROLES AND ENDINGS *
;;;*********************

(defrule WaterGenasi ""

   (logical (GeniesElement WaterLover))

   =>

   (assert (UI-state (display WaterGenasi)
                     (state final))))
(defrule AirGenasi ""

   (logical (GeniesElement WeFloat))

   =>

   (assert (UI-state (display AirGenasi)
                     (state final))))
(defrule EarthGenasi ""

   (logical (GeniesElement RockHard))

   =>

   (assert (UI-state (display EarthGenasi)
                     (state final))))
(defrule FireGenasi ""

   (logical (GeniesElement FireReal))

   =>

   (assert (UI-state (display FireGenasi)
                     (state final))))
(defrule Genasi ""
   (logical (ParentGenie YeWorks))

   =>

   (assert (UI-state (display Genasi)
                        (relation-asserted Genasi)
                        (response No)
                        (valid-answers CaptainPlanet)
                        (state between))))
(defrule Githzerai ""

   (logical (GithFlavour KungFu))

   =>

   (assert (UI-state (display Githzerai)
                     (state final))))
(defrule Githyanki ""

   (logical (GithFlavour ImmortalGith))

   =>

   (assert (UI-state (display Githyanki)
                     (state final))))
(defrule Gith ""
   (logical (PlaneHoppers FOutThere))

   =>

   (assert (UI-state (display Gith)
                        (relation-asserted Gith)
                        (response No)
                        (valid-answers ExplodeHeads)
                        (state between))))
(defrule Ban ""

   (logical (Kalashtar IDKWhatThis))

   =>

   (assert (UI-state (display Ban)
                     (state final))))
(defrule Kalashtar ""
   (logical (Tentacles MoreMysteriousTentacles))

   =>

   (assert (UI-state (display Kalashtar)
                        (relation-asserted Kalashtar)
                        (response No)
                        (valid-answers IDKWhatThis)
                        (state between))))
(defrule SimicHybrid ""

   (logical (Tentacles ShitImAbout))

   =>

   (assert (UI-state (display SimicHybrid)
                     (state final))))
(defrule Vedalken ""

   (logical (BlueVulcan UGotMe))

   =>

   (assert (UI-state (display Vedalken)
                     (state final))))
(defrule Shifter ""

   (logical (Fursona OtherFurry))

   =>

   (assert (UI-state (display Shifter)
                     (state final))))
(defrule Loxadon ""

   (logical (Fursona Elephant))

   =>

   (assert (UI-state (display Loxadon)
                     (state final))))
(defrule Minotaur ""

   (logical (Fursona Cow))

   =>

   (assert (UI-state (display Minotaur)
                     (state final))))
(defrule Tabaxi ""

   (logical (Fursona Cat))

   =>

   (assert (UI-state (display Tabaxi)
                     (state final))))
(defrule Kenku ""

   (logical (EagleCrow Caw))

   =>

   (assert (UI-state (display Kenku)
                     (state final))))
(defrule Aarakocra ""

   (logical (EagleCrow MajesticnFree))

   =>

   (assert (UI-state (display Aarakocra)
                     (state final))))
(defrule Centaur ""

   (logical (UFurry Horse))

   =>

   (assert (UI-state (display Centaur)
                     (state final))))
(defrule Hobgoblin ""

   (logical (ToConquer Tactical))

   =>

   (assert (UI-state (display Hobgoblin)
                     (state final))))
(defrule Bugbear ""

   (logical (SurpriseAttacks LazyAmbush))

   =>

   (assert (UI-state (display Bugbear)
                     (state final))))
(defrule YuanTi ""
   (or
   (logical (TedCruz Snek))
   (logical (ToConquer Deception)))

   =>

   (assert (UI-state (display YuanTi)
                     (state final))))
(defrule Lizardfolk ""

   (logical (TedCruz GeneralReptile))

   =>

   (assert (UI-state (display Lizardfolk)
                     (state final))))
(defrule Goblin ""
   (or
   (logical (FunSizeEvil Nay))
   (logical (BigOrSmallVersion SmallV)))

   =>

   (assert (UI-state (display Goblin)
                     (state final))))
(defrule Kobold ""
   (or
   (logical (FunSizeEvil Yea))
   (logical (Dragonborn DragonKidSize)))

   =>

   (assert (UI-state (display Kobold)
                     (state final))))
(defrule Orc ""
   (or
   (logical (BigOrSmallVersion BigV))
   (logical (SurpriseAttacks FaceHeadOn)))

   =>

   (assert (UI-state (display Orc)
                        (relation-asserted Orc)
                        (response No)
                        (valid-answers IntelligencePenalty)
                        (state between))))
(defrule HalfOrc ""
   (or
   (logical (MonsternPretty MonsterBlood))
   (logical (PartOrAllWay TouchMonster))
   (logical (WhyPeopleMisunderstand BrutParent))
   (logical (Orc IntelligencePenalty)))

   =>

   (assert (UI-state (display HalfOrc)
                     (state final))))
(defrule Dragonborn ""
   (or
   (logical (CloseEnough OkFine))
   (logical (FineColor Yay))
   (logical (TedCruz AMFDragon)))

   =>

   (assert (UI-state (display Dragonborn)
                     (relation-asserted Dragonborn)
                     (response No)
                     (valid-answers IsntDragon DragonKidSize)
                     (state between))))


(defrule GetOut ""

   (logical (CloseEnough LemmeDragon))

   =>

   (assert (UI-state (display GetOut)
                     (state final))))
(defrule Protector ""

   (logical (MoreAngels Goodness))

   =>

   (assert (UI-state (display Protector)
                     (state final))))

(defrule Scourge ""

   (logical (MoreAngels Vengence))

   =>

   (assert (UI-state (display Scourge)
                     (state final))))


(defrule Fallen ""
   (or
   (logical (Edgelord HollyFallen))
   (logical (MoreAngels BadAngel)))


   =>

   (assert (UI-state (display Fallen)
                     (state final))))


(defrule Aasimar ""

   (logical (UncommonRaces GodMission))


   =>

   (assert (UI-state (display Aasimar)
                     (relation-asserted Aasimar)
                     (response No)
                     (valid-answers FOffTieflings )
                     (state between))))

(defrule Triton ""

   (logical (UncommonRaces Aquaman))


   =>

   (assert (UI-state (display Triton)
                     (relation-asserted Triton)
                     (response No)
                     (valid-answers ElfyAquaman )
                     (state between))))

(defrule Warforged ""

   (logical (UncommonRaces Robot))

   =>

   (assert (UI-state (display Warforged)
                     (state final))))


(defrule Changelings ""

   (logical (UncommonRaces Dopplelganger))

   =>

   (assert (UI-state (display Changelings)
                     (state final))))


(defrule Vampyre ""

   (logical (PlaySE ElvesDumb))

   =>

   (assert (UI-state (display Vampyre)
                     (state final))))

(defrule Human ""

   (logical (EveryHeroSpecial Special))


   =>

   (assert (UI-state (display Human)
                     (relation-asserted Human)
                     (response No)
                     (valid-answers Waait )
                     (state between))))

(defrule Tiefling ""

   (logical (WhyPeopleMisunderstand DevilHorns))

   =>

   (assert (UI-state (display Tiefling)
                     (state final))))

(defrule Halfling ""

   (logical (HowSilly GoHalfling))


   =>

   (assert (UI-state (display Halfling)
                     (relation-asserted Halfling)
                     (response No)
                     (valid-answers OffBHobbit )
                     (state between))))

(defrule Gnome ""

    (logical (HowSilly MagicnGlitter))


    =>

    (assert (UI-state (display Gnome)
                      (relation-asserted Gnome)
                      (response No)
                      (valid-answers MagicHobbit )
                      (state between))))

(defrule Stout ""

   (logical (NDYDwarfyNimble MakeHardy))

   =>

   (assert (UI-state (display Stout)
                     (state final))))

(defrule Lightfoot ""

   (logical (NDYDwarfyNimble MakeNimble))

   =>

   (assert (UI-state (display Lightfoot)
                     (state final))))


(defrule ForestGnome ""

   (logical (WoodsyOrSP Mushroom))

   =>

   (assert (UI-state (display ForestGnome)
                     (state final))))
(defrule MountainGnome ""

    (logical (WoodsyOrSP Toys))


    =>

    (assert (UI-state (display MountainGnome)
                      (relation-asserted MountainGnome)
                      (response No)
                      (valid-answers ToysDeep )
                      (state between))))

(defrule DeepGnome ""

   (logical (MountainGnome ToysDeep))

   =>

   (assert (UI-state (display DeepGnome)
                     (state final))))


(defrule Firbolg ""

   (logical (StronkMen Gentle))

   =>

   (assert (UI-state (display Firbolg)
                     (state final))))

(defrule Goliath ""

    (or
   (logical (StronkMen Poomp))
   (logical (Dwarf NoShort)))

   =>

   (assert (UI-state (display Goliath)
                     (state final))))

(defrule Elf ""

   (logical (LithnPretty FellPretty))


   =>

   (assert (UI-state (display Elf)
                     (relation-asserted Elf)
                     (response No)
                     (valid-answers ImDone )
                     (state between))))

(defrule Dwarf ""

   (logical (LithnPretty EvenLift))


   =>

   (assert (UI-state (display Dwarf)
                     (relation-asserted Dwarf)
                     (response No)
                     (valid-answers DrinknAxe NoShort)
                     (state between))))
(defrule HighElf ""

   (logical (WhatMagic MadeOfMagic))

   =>

   (assert (UI-state (display HighElf)
                     (state final))))

(defrule WoodElf ""

   (logical (WhatMagic Treehugger))

   =>

   (assert (UI-state (display WoodElf)
                     (state final))))

(defrule Eladrin ""

   (logical (WhatProblem ElfFey))

   =>

   (assert (UI-state (display Eladrin)
                     (state final))))
(defrule SeaElf ""

   (or
   (logical (WhatProblem MermaidsElf))
   (logical (Triton ElfyAquaman)))

   =>

   (assert (UI-state (display SeaElf)
                     (state final))))
(defrule HalfElf ""
   (or
   (logical (WhatProblem KindOfElf))
   (logical (MonsternPretty StillMagicnPretty)))

   =>

   (assert (UI-state (display HalfElf)
                     (state final))))
(defrule Drow ""
   (or
   (logical (WhatProblem DarknBrooding))
   (logical (Edgelord QuicknLithe)))

   =>

   (assert (UI-state (display Drow)
                     (relation-asserted Drow)
                     (response No)
                     (valid-answers MoreDarknBrooding)
                     (state between))))
(defrule ShadarKai ""

   (logical (Drow MoreDarknBrooding))


   =>

   (assert (UI-state (display ShadarKai)
                     (state final))))

(defrule HillDwarf ""

   (logical (HardOrStrong HardnHilly))

   =>

   (assert (UI-state (display HillDwarf)
                     (state final))))

(defrule MountainDwarf ""

   (logical (HardOrStrong StoneStrong))

   =>

   (assert (UI-state (display MountainDwarf)
                     (state final))))

(defrule Duegar ""
   (or
   (logical (HardOrStrong AngryAss))
   (logical (Edgelord MeanDwarf)))

   =>

   (assert (UI-state (display Duegar)
                     (state final))))


;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))

   (UI-state (id ?id))

   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))

   =>

   (modify ?f (current ?id)
              (sequence ?id ?s))

   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))

   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))

   =>

   (retract ?f1)

   (modify ?f2 (current ?nid))

   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))

   ?f <- (next ?id)

   (state-list (sequence ?id $?))

   (UI-state (id ?id)
             (relation-asserted ?relation))

   =>

   (retract ?f)

   (assert (add-response ?id)))

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))

   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))

   (UI-state (id ?id) (response ?response))

   =>

   (retract ?f1)

   (modify ?f2 (current ?nid))

   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))

   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))

   (UI-state (id ?id) (response ~?response))

   ?f2 <- (UI-state (id ?nid))

   =>

   (modify ?f1 (sequence ?b ?id ?e))

   (retract ?f2))

(defrule handle-next-response-end-of-chain

   (declare (salience 10))

   ?f1 <- (next ?id ?response)

   (state-list (sequence ?id $?))

   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))

   =>

   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))

   (assert (add-response ?id ?response)))

(defrule handle-add-response

   (declare (salience 10))

   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))

   ?f1 <- (add-response ?id ?response)

   =>

   (str-assert (str-cat "(" ?relation " " ?response ")"))

   (retract ?f1))

(defrule handle-add-response-none

   (declare (salience 10))

   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))

   ?f1 <- (add-response ?id)

   =>

   (str-assert (str-cat "(" ?relation ")"))

   (retract ?f1))

(defrule handle-prev

   (declare (salience 10))

   ?f1 <- (prev ?id)

   ?f2 <- (state-list (sequence $?b ?id ?p $?e))

   =>

   (retract ?f1)

   (modify ?f2 (current ?p))

   (halt))
