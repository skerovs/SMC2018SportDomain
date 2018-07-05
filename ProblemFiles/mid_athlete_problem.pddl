
(define (problem athlete3-general-period)  
(:objects 
          w1 w2 w3 w4 w5 w6 w7 w8 w9 - week          

          dummy_slot slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 
          slot11 slot12 slot13 slot14 slot15 slot16 slot17 slot18  slot19 slot20 
          slot21 slot22 slot23 slot24 slot25 slot26 slot27 slot28 slot29 slot30 
          slot31 slot32 slot33 slot34 slot35 slot36 slot37 slot38 slot39 slot40 
          slot41 slot42 slot43 slot44 slot45 -slot
)

(:init 

(adjacent dummy_slot slot1 slot2)
(adjacent slot1 slot2 slot3)
(adjacent slot2 slot3 slot4)
(adjacent slot3 slot4 slot5)
(adjacent slot4 slot5 slot6)
(adjacent slot5 slot6 slot7)
(adjacent slot6 slot7 slot8)
(adjacent slot7 slot8 slot9)
(adjacent slot8 slot9 slot10)
(adjacent slot9 slot10 slot11)
(adjacent slot10 slot11 slot12)
(adjacent slot11 slot12 slot13)
(adjacent slot12 slot13 slot14)
(adjacent slot13 slot14 slot15)
(adjacent slot14 slot15 slot16)
(adjacent slot15 slot16 slot17)
(adjacent slot16 slot17 slot18)
(adjacent slot17 slot18 slot19)
(adjacent slot18 slot19 slot20)
(adjacent slot19 slot20 slot21)
(adjacent slot20 slot21 slot22)
(adjacent slot21 slot22 slot23)
(adjacent slot22 slot23 slot24)
(adjacent slot23 slot24 slot25)
(adjacent slot24 slot25 slot26)
(adjacent slot25 slot26 slot27)
(adjacent slot26 slot27 slot28)
(adjacent slot27 slot28 slot29)
(adjacent slot28 slot29 slot30)
(adjacent slot29 slot30 slot31)
(adjacent slot30 slot31 slot32)
(adjacent slot31 slot32 slot33)
(adjacent slot32 slot33 slot34)
(adjacent slot33 slot34 slot35)
(adjacent slot34 slot35 slot36)
(adjacent slot35 slot36 slot37)
(adjacent slot36 slot37 slot38)
(adjacent slot37 slot38 slot39)
(adjacent slot38 slot39 slot40)
(adjacent slot39 slot40 slot41)
(adjacent slot40 slot41 slot42)
(adjacent slot41 slot42 slot43)
(adjacent slot42 slot43 slot44)
(adjacent slot43 slot44 slot45)
(adjacent slot44 slot45 dummy_slot)


;slots in weeks 

(slot_in_week slot1 w1)
(slot_in_week slot2 w1)
(slot_in_week slot3 w1)
(slot_in_week slot4 w1)
(slot_in_week slot5 w1)
(slot_in_week slot6 w2)
(slot_in_week slot7 w2)
(slot_in_week slot8 w2)
(slot_in_week slot9 w2)
(slot_in_week slot10 w2)
(slot_in_week slot11 w3)
(slot_in_week slot12 w3)
(slot_in_week slot13 w3)
(slot_in_week slot14 w3)
(slot_in_week slot15 w3)
(slot_in_week slot16 w4)
(slot_in_week slot17 w4)
(slot_in_week slot18 w4)
(slot_in_week slot19 w4)
(slot_in_week slot20 w4)
(slot_in_week slot21 w5)
(slot_in_week slot22 w5)
(slot_in_week slot23 w5)
(slot_in_week slot24 w5)
(slot_in_week slot25 w5)
(slot_in_week slot26 w6)
(slot_in_week slot27 w6)
(slot_in_week slot28 w6)
(slot_in_week slot29 w6)
(slot_in_week slot30 w6)
(slot_in_week slot31 w7)
(slot_in_week slot32 w7)
(slot_in_week slot33 w7)
(slot_in_week slot34 w7)
(slot_in_week slot35 w7)
(slot_in_week slot36 w8)
(slot_in_week slot37 w8)
(slot_in_week slot38 w8)
(slot_in_week slot39 w8)
(slot_in_week slot40 w8)
(slot_in_week slot41 w9)
(slot_in_week slot42 w9)
(slot_in_week slot43 w9)
(slot_in_week slot44 w9)
(slot_in_week slot45 w9)


;free slots (all except "dummy_slot", or slots on which an action is allocated before planning)

(free slot1)(free slot2)(free slot3)(free slot4)(free slot5)(free slot6)(free slot7)(free slot8)(free slot9)(free slot10)
(free slot11)(free slot12)(free slot13)(free slot14)(free slot15)(free slot16)(free slot17)(free slot18)(free slot19)(free slot20)
(free slot21)(free slot22)(free slot23)(free slot24)(free slot25)(free slot26)(free slot27)(free slot28)(free slot29)(free slot30)
(free slot31)(free slot32)(free slot33)(free slot34)(free slot35)(free slot36)(free slot37)(free slot38)(free slot39)(free slot40)
(free slot41)(free slot42)(free slot43)(free slot44)(free slot45)

;action capacity, i.e., how many actions of a given type can be allocated to a given week

;This action is serving for improvment of explosiveness as it mainly includes jumping, short distance but maximum intensity running
(=(action_capacity agility w1) 1)
(=(action_capacity agility w2) 1)
(=(action_capacity agility w3) 0) 
(=(action_capacity agility w4) 1)
(=(action_capacity agility w5) 0)    ;this is done to have higher variety in training
(=(action_capacity agility w6) 1)
(=(action_capacity agility w7) 0)
(=(action_capacity agility w8) 1)
(=(action_capacity agility w9) 1)

;action capacity, i.e., how many actions of a given type can be allocated to a given week

;This action requires high intensity 
(=(action_capacity circuit w1) 1)
(=(action_capacity circuit w2) 1)
(=(action_capacity circuit w3) 1)       
(=(action_capacity circuit w4) 2)
(=(action_capacity circuit w5) 2)
(=(action_capacity circuit w6) 1)
(=(action_capacity circuit w7) 1)
(=(action_capacity circuit w8) 0)
(=(action_capacity circuit w9) 0)


;action capacity MaximalSpeed         
;this action is mostly used in competition period and is usually conected with technique and tactic training 
(=(action_capacity max_speed w1) 0)
(=(action_capacity max_speed w2) 0)
(=(action_capacity max_speed w3) 0) 
(=(action_capacity max_speed w4) 0)
(=(action_capacity max_speed w5) 0)
(=(action_capacity max_speed w6) 0)
(=(action_capacity max_speed w7) 1)
(=(action_capacity max_speed w8) 1)
(=(action_capacity max_speed w9) 2)


;action capacity AnaerobicTU

(=(action_capacity anaerobic w1) 0)  
(=(action_capacity anaerobic w2) 0)
(=(action_capacity anaerobic w3) 0) 
(=(action_capacity anaerobic w4) 0)
(=(action_capacity anaerobic w5) 2)
(=(action_capacity anaerobic w6) 2)
(=(action_capacity anaerobic w7) 2)
(=(action_capacity anaerobic w8) 2)
(=(action_capacity anaerobic w9) 2)


;action capacity AerobicTU
;this action represents long runs from 10 - 15km
(=(action_capacity aerobic w1) 2)
(=(action_capacity aerobic w2) 2)
(=(action_capacity aerobic w3) 2) 
(=(action_capacity aerobic w4) 2)
(=(action_capacity aerobic w5) 1)
(=(action_capacity aerobic w6) 1)
(=(action_capacity aerobic w7) 0)
(=(action_capacity aerobic w8) 0)
(=(action_capacity aerobic w9) 0)


;action capacity MaximalStrenghtTU
;maximal strenght is for boxing and kickboxing (according literature) targeted mainly in weeks 
;5-7 and 10-12. This was changed as the general period number of weeks have been decreased

(=(action_capacity maximal w1) 0)
(=(action_capacity maximal w2) 0)
(=(action_capacity maximal w3) 0) 
(=(action_capacity maximal w4) 1)
(=(action_capacity maximal w5) 1)
(=(action_capacity maximal w6) 1)
(=(action_capacity maximal w7) 1)
(=(action_capacity maximal w8) 1)
(=(action_capacity maximal w9) 1)


;action capacity IntervalTU
;interval training can be specialsed on different parts of performance and different parts of body but in our case 
;it represent interval running which increase anaerobic and aerobic systems 
;usually can be executed 2 a week. No difference for our domain only in the first 3 weeks is possible to execute only 1 action 
;in each week as first weeks are mostly reserved for action based manly in areobic system

(=(action_capacity interval w1) 1)
(=(action_capacity interval w2) 1)
(=(action_capacity interval w3) 1) 
(=(action_capacity interval w4) 2)
(=(action_capacity interval w5) 2)
(=(action_capacity interval w6) 2)
(=(action_capacity interval w7) 2)
(=(action_capacity interval w8) 2)
(=(action_capacity interval w9) 0)


;action capacity CrossTU

(=(action_capacity cross w1) 1)
(=(action_capacity cross w2) 1)
(=(action_capacity cross w3) 1) 
(=(action_capacity cross w4) 1)
(=(action_capacity cross w5) 1)
(=(action_capacity cross w6) 1)
(=(action_capacity cross w7) 1)
(=(action_capacity cross w8) 1)
(=(action_capacity cross w9) 0)


;action capacity PolymetricsTU    

(=(action_capacity poly w1) 1)
(=(action_capacity poly w2) 1)
(=(action_capacity poly w3) 1) 
(=(action_capacity poly w4) 1)
(=(action_capacity poly w5) 1)
(=(action_capacity poly w6) 1)
(=(action_capacity poly w7) 1)
(=(action_capacity poly w8) 1)
(=(action_capacity poly w9) 0)


;action capacity EnduranceTU
;strenghtEndurance is also mostly trained in first weeks 
;explicitely 1 - 6 week 

(=(action_capacity endur w1) 1)
(=(action_capacity endur w2) 1)
(=(action_capacity endur w3) 1) 
(=(action_capacity endur w4) 1)
(=(action_capacity endur w5) 1)
(=(action_capacity endur w6) 1)
(=(action_capacity endur w7) 0)
(=(action_capacity endur w8) 0)
(=(action_capacity endur w9) 0)


;action Fartlek
;mostly based in aerobic system executed mainly in 1-4 week

(=(action_capacity fartlek w1) 2)
(=(action_capacity fartlek w2) 2)
(=(action_capacity fartlek w3) 2) 
(=(action_capacity fartlek w4) 2)
(=(action_capacity fartlek w5) 1)
(=(action_capacity fartlek w6) 1)
(=(action_capacity fartlek w7) 1)
(=(action_capacity fartlek w8) 1)
(=(action_capacity fartlek w9) 0)


;initial values of athlete's attributes
;the initial state of the athlet is bellow average
;in the essence this demonstarte an athlete, who is probably has few amatures fights and aims to semi-professional career 
;pursue further development to 

(=(strength upper_limbs) 51)
(=(strength lower_limbs) 49)
(=(strength mid_body) 54) 


(=(endurance upper_limbs) 50)
(=(endurance lower_limbs) 52) 
(=(endurance mid_body) 41)

(=(explosiveness upper_limbs) 44)
(=(explosiveness lower_limbs) 45) 
(=(explosiveness mid_body) 43)  

(=(anaerobic_system) 39)
(=(aerobic_system) 41)

)

;examples of goals - the goal of this athelte is to have an average performance. Also, the below goal should be the least performance for professional athlete. 
;essentialy this mean that the athlete is preforming on approximately 60 percent
;performance of other athletes in his performance category.
(:goal
(and 
 (>= (strength lower_limbs) 56) 
 (>= (strength upper_limbs) 54)
 (>=(strength mid_body) 55) 

 (>=(endurance upper_limbs) 55)
 (>=(endurance lower_limbs) 56) 
 (>=(endurance mid_body) 50)

 (>=(explosiveness upper_limbs) 50)
 (>=(explosiveness lower_limbs) 50) 
 (>=(explosiveness mid_body) 50)   

 (>=(anaerobic_system) 53)
 (>=(aerobic_system) 53)
)
)
)