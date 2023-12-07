Class {
	#name : #BombermanBoard,
	#superclass : #MygBoard,
	#instVars : [
		'player',
		'boxes'
	],
	#category : #Bomberman
}

{ #category : #initialization }
BombermanBoard class >> createWithBoard: aCTNewArray2D [

	^ self new
		  configureGrid: aCTNewArray2D;
		  yourself
]

{ #category : #accessing }
BombermanBoard >> height [ 
	^ grid height
]

{ #category : #accessing }
BombermanBoard >> player [ 
	^ player
]

{ #category : #accessing }
BombermanBoard >> width [ 
	^ grid width
]
