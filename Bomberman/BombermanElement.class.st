Class {
	#name : #BombermanElement,
	#superclass : #MygAbstractBox,
	#category : #Bomberman
}

{ #category : #initialization }
BombermanElement class >> configured [ 

	^ self new configured
]

{ #category : #'default encoding' }
BombermanElement class >> textualMapCharacter [
	^ $Z
]

{ #category : #printing }
BombermanElement >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #initialization }
BombermanElement >> configured [ 

	^self
]

{ #category : #testing }
BombermanElement >> isPlayer [
	^ false
]

{ #category : #printing }
BombermanElement >> printOn: aStream [ 

	super printOn: aStream.
	aStream nextPut: $-.
	position printOn: aStream
]
