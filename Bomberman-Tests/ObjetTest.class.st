Class {
	#name : #ObjetTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #' tests' }
ObjetTest >> testBombeExploseBox [

	|bombe box|
	
	bombe := BombermanBombe new.
	box := BombermanBox new.
	
	bombe explose: box.
	
	self assert: (box isKindOf: BombermanGround).
]

{ #category : #' tests' }
ObjetTest >> testBombeExploseGround [

	|bombe ground|
	
	bombe := BombermanBombe new.
	ground := BombermanGround new.
	
	self deny: bombe explose: ground.
]

{ #category : #' tests' }
ObjetTest >> testBombeExploseWall [

	|bombe wall|
	
	bombe := BombermanBombe new.
	wall := BombermanWall new.
	
	 self deny: bombe explose: wall.
	
	
]
