(define (domain sports)

(:requirements :typing :fluents)

(:types week body_part slot act_type - object)

(:constants agility circuit max_speed anaerobic aerobic maximal interval cross poly endur fartlek - act_type          
                 upper_limbs lower_limbs mid_body - body_part   
)


(:predicates (next ?w1 ?w2 - week)
             (adjacent ?slot_prev ?slot ?slot_next - slot)  
             (slot_in_week ?slot - slot ?week - week)    
             (act_allocated ?a - act_type ?slot - slot)    
             (free ?slot - slot)                           
             
)

(:functions (strength ?x - body_part)
            (endurance ?x - body_part)
            (explosiveness ?x -body_part)
            (aerobic_system)
            (anaerobic_system)                             

            (action_capacity ?a - act_type ?w - week)      ; how many actions of the given type can be planned for a given week
            
)

;___________________________________________________________

;***************** Actions **********************
;___________________________________________________________

;Agility TU: includes exercises as jumping, staircase running ect

(:action AgilityTU
:parameters (?slot - slot ?slot_prev ?slot_next - slot ?w - week)
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)
                  (not (act_allocated agility ?slot_prev))
                  (not (act_allocated agility ?slot_next))
                  (> (action_capacity agility ?w) 0)
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated agility ?slot)
                  (decrease (action_capacity agility ?w) 1)
                  (increase (explosiveness upper_limbs) 1)
                  (increase (explosiveness lower_limbs) 1)
                  (increase (explosiveness mid_body) 1)
              )
)

(:action CircuitTU
:parameters (?slot - slot ?b - body_part ?slot_prev ?slot_next - slot ?w - week) 
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)
                  (not (act_allocated circuit ?slot_prev))
                  (not (act_allocated circuit ?slot_next)) ;these lines are for prohibiting having the same action types in adjacent slots
                  (> (action_capacity circuit ?w) 0)
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated circuit ?slot)
                  (decrease (action_capacity circuit ?w) 1)
                  (increase (endurance ?b) 1.1)
                  (increase (anaerobic_system) 1.1) 
                  (increase (strength upper_limbs) 0.2)
                  (increase (strength lower_limbs) 0.2)
                  (increase (strength mid_body) 0.2)
              )
)

(:action MaximumSpeedTU
:parameters (?slot - slot ?b - body_part ?slot_prev ?slot_next - slot ?w - week)
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (free ?slot_prev)     
                  (free ?slot_next)
                  (slot_in_week ?slot ?w)
                  (slot_in_week ?slot_prev ?w)
                  (slot_in_week ?slot_next ?w)
                 
                  (> (action_capacity max_speed ?w) 1)
              )
:effect      (and
                  (not (free ?slot))
                  (not (free ?slot_prev))
                  (not (free ?slot_next))
                  (act_allocated max_speed ?slot)
                  (act_allocated max_speed ?slot_prev)
                  (decrease (action_capacity max_speed ?w) 2)
                  (increase (explosiveness ?b) 1)
                  (increase (anaerobic_system) 0.3)
              )
)


;This action represent longer runs 15 - 20km
(:action AerobicTU
:parameters (?slot - slot ?slot_prev ?slot_next - slot ?w - week)
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)
                  (not (act_allocated aerobic ?slot_prev))
                  (not (act_allocated aerobic ?slot_next)) 
                  (> (action_capacity aerobic ?w) 0)
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated aerobic ?slot)
                  (decrease (action_capacity aerobic ?w) 1) 
                  (increase (aerobic_system) 0.8) 
              )
)

(:action AnaerobicTU
:parameters (?slot - slot ?b - body_part ?slot_prev ?slot_next - slot ?w - week) 
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)

                  (> (action_capacity anaerobic ?w) 0)
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated anaerobic ?slot)
                  (decrease (action_capacity anaerobic ?w) 1) 
                  (increase (explosiveness ?b) 0.3)
                  (increase (anaerobic_system) 0.7) 
              )
)

(:action MaximalStrengthTU
:parameters (?slot - slot ?b - body_part ?slot_prev ?slot_next - slot ?w - week)
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)
                  (not (act_allocated maximal ?slot_prev))
                  (not (act_allocated maximal ?slot_next)) 
                  (> (action_capacity maximal ?w) 0)
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated maximal ?slot)
                  (decrease (action_capacity maximal ?w) 1)
                  (increase (strength ?b) 1.2) 
              )
)

;Interval:
;usually runnig in intervals similar to fartlek, although this action has higher intensity

(:action IntervalTU
:parameters (?slot - slot ?slot_prev ?slot_next - slot ?w - week) 
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)
                  (not (act_allocated interval ?slot_prev))
                  (not (act_allocated interval ?slot_next)) 
                  (> (action_capacity interval ?w) 0)
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated interval ?slot)
                  (decrease (action_capacity interval ?w) 1)
                  (increase (aerobic_system) 0.5)
                  (increase (anaerobic_system) 0.8)   
              )
)


(:action CrossTU
:parameters (?slot - slot ?slot_prev ?slot_next - slot ?w - week) ; should not be to much in competition period mostly general and specific
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)
                  (not (act_allocated cross ?slot_prev))
                  (not (act_allocated cross ?slot_next)) 
                  (> (action_capacity cross ?w) 0)
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated cross ?slot)
                  (decrease (action_capacity cross ?w) 1)
                  (increase (endurance upper_limbs) 0.8)
                  (increase (endurance lower_limbs) 0.8)
                  (increase (endurance mid_body) 0.8)
              )
)

(:action FartlekTU
:parameters (?slot - slot ?slot_prev ?slot_next - slot ?w - week)
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)
                  (not (act_allocated fartlek ?slot_prev))
                  (not (act_allocated fartlek ?slot_next)) 
                 
                  (> (action_capacity fartlek ?w) 0) 
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated fartlek ?slot)

                  (decrease (action_capacity fartlek ?w) 1)

                  (increase (aerobic_system) 0.8)
                  (increase (anaerobic_system) 0.3) 
              )
)

(:action PolymetricsTU
:parameters (?slot - slot ?b - body_part ?slot_prev ?slot_next - slot ?w - week) ; definetely not for competition period
:precondition (and
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)
                  (not (act_allocated poly ?slot_prev))
                  (not (act_allocated poly ?slot_next)) 
                 
                  (> (action_capacity poly ?w) 0) 
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated poly ?slot)
                  (decrease (action_capacity poly ?w) 1)

                  (increase (explosiveness ?b) 1.3)
                  (increase (anaerobic_system) 0.9)
              )
)

(:action StrenghtEnduranceTU
:parameters (?slot - slot ?b - body_part ?slot_prev ?slot_next - slot ?w - week) ;should be more general but should be also in specific with smaller capacity now alocated to specific just to have enough actions in specific period
:precondition (and    
                  (adjacent ?slot_prev ?slot ?slot_next)
                  (free ?slot)
                  (slot_in_week ?slot ?w)
                  (not (act_allocated endur ?slot_prev))
                  (not (act_allocated endur ?slot_next))
                  (> (action_capacity endur ?w) 0)
              )
:effect      (and
                  (not (free ?slot))
                  (act_allocated endur ?slot)
                  (decrease (action_capacity endur ?w) 1)
                  (increase (endurance ?b) 1.3)
                  (increase (strength ?b) 0.3)
            )
)
)
