Class {
	#name : #BombermanTarget,
	#superclass : #BombermanElement,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanTarget class >> textualMapCharacter [ 

	^ $.
]

{ #category : #accessing }
BombermanTarget >> backgroundRepresentation [

	^ BombermanBoxElement  targetIcon
]

{ #category : #testing }
BombermanTarget >> isTarget [ 
	^ true
]
