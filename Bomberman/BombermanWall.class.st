Class {
	#name : #BombermanWall,
	#superclass : #BombermanElement,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanWall class >> textualMapCharacter [ 

	^ $#
]

{ #category : #accessing }
BombermanWall >> backgroundRepresentation [

	^ BombermanBoxElement wallIcon
]

{ #category : #accessing }
BombermanWall >> bringIn: anActor going: aDirection [
	"anActor does not move in a wall. Nothing enter a wall."
	
	^ false
]
