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

{ #category : #initialization }
BombermanElement >> configured [ 

	^self
]
