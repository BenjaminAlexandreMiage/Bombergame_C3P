Class {
	#name : #BombermanBox,
	#superclass : #BombermanElement,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanBox class >> textualMapCharacter [ 
	
	^ $$
]

{ #category : #accessing }
BombermanBox >> backgroundRepresentation [

	^ BombermanBoxElement boxIcon 

]
