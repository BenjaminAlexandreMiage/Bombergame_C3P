Class {
	#name : #BombermanPlayerOnTarget,
	#superclass : #BombermanPlayer,
	#category : #Bomberman
}

{ #category : #'default encoding' }
BombermanPlayerOnTarget class >> textualMapCharacter [
	^ $+
]

{ #category : #initialization }
BombermanPlayerOnTarget >> configured [

	^ BombermanPlayer new background: self defaultBackground
	

]

{ #category : #initialization }
BombermanPlayerOnTarget >> defaultBackground [

	^ BombermanTarget
		  new
	

]
