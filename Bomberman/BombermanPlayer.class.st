Class {
	#name : #BombermanPlayer,
	#superclass : #BombermanMovable,
	#instVars : [
		'facing'
	],
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #accessing }
BombermanPlayer >> facing [ 

	^ facing
]

{ #category : #accessing }
BombermanPlayer >> facing: aCpDirection [
	
	facing := aCpDirection 
]

{ #category : #initialization }
BombermanPlayer >> initialize [ 

	super initialize.
	facing := CpSouthDirection
]

{ #category : #testing }
BombermanPlayer >> isPlayer [ 
^ true
]

{ #category : #move }
BombermanPlayer >> move: aCpDirection [

	self facing: aCpDirection class.
	^ super move: aCpDirection
]

{ #category : #move }
BombermanPlayer >> moveIn: aNeighbor going: aDirection [
	"To move in a position, we ask the entity where we want to get in to decide.
	This is not a double dispatch per se because we do not have to discrimnate on the receiver."
	
	^ aNeighbor bringIn: self going: aDirection
]
