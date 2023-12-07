Class {
	#name : #BombermanMovable,
	#superclass : #BombermanElement,
	#instVars : [
		'background'
	],
	#category : #Bomberman
}

{ #category : #accessing }
BombermanMovable >> background [

	^ background
]

{ #category : #accessing }
BombermanMovable >> background: anObject [

	background := anObject
]

{ #category : #accessing }
BombermanMovable >> board: aBoard [ 

	super board: aBoard.
	self background board: aBoard
]

{ #category : #initialization }
BombermanMovable >> configured [

	self background: self defaultBackground.
	^ self
]

{ #category : #initialization }
BombermanMovable >> defaultBackground [

	^ BombermanGround new
]

{ #category : #initialization }
BombermanMovable >> move: aCpDirection [

	| newPosition neighbor |
	newPosition := aCpDirection * self position.
	neighbor := self board atPosition: newPosition.
	^ self moveIn: neighbor going: aCpDirection
]

{ #category : #move }
BombermanMovable >> moveEast [

	^ self move: CpDirection east
]

{ #category : #move }
BombermanMovable >> moveNorth [

	^ self move: CpDirection north
]

{ #category : #move }
BombermanMovable >> moveSouth [

	^ self move: CpDirection south
]

{ #category : #move }
BombermanMovable >> moveWest [

	^ self move: CpDirection west
]

{ #category : #move }
BombermanMovable >> position: aPoint [

	position := aPoint.
	self background position: aPoint
]
