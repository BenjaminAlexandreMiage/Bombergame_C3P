Class {
	#name : #SituationTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #tests }
SituationTest >> testBasicMoveInformation [

	| board position |
	board := BombermanBoard createWithBoard:
		         ((MygLevelImporter
			          fromString: '#@  $#'
			          fromPackage: BombermanBoard package) do: [ :each | each configured ]).
		
	position := board player position.
	self assert: (board player move: CpDirection east).
	"The player has moved!"
	"No check that the player position is correct."
	self
		assert: board player position x
		equals: (CpDirection east * position) x.
	self assert: board player position x equals: 3.
	self assert: board asciiString equals: '# @ $#'
]

{ #category : #tests }
SituationTest >> testPlayerMoveBox [

	| board position player |
	
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@$#'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
		
	player := board atColumn: 2 atRow: 1.
	
	position := board player position.
	
	self deny: (board player move: CpDirection east).
	
	self assert: player position x equals: 2.
	
	self assert: player position y equals: 1.

	self assert: board asciiString equals: '#@$#'.
]

{ #category : #move }
SituationTest >> testPlayerMoveGround [

	| board position player |
	
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '#@ #'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
		
		player := board atColumn: 3 atRow: 1.
		position := board player position.
		
		self assert: (board player move: CpDirection east).
		
		self assert: board player position x equals: (CpDirection east * position) x.
		
		self assert: board player position y equals: (CpDirection east * position) y.
		
		self assert: player position x equals: 3.
		
		self assert: board asciiString equals: '# @#'.
		
		
]

{ #category : #tests }
SituationTest >> testPlayerMoveWall [

	| board position player |
	
	board := MygSkBoard createWithBoard:
		         ((MygLevelImporter
			           fromString: '# @#'
			           fromPackage: MygSkBoard package) do: [ :each |
			          each configured ]).
		
	player := board atColumn: 3 atRow: 1.
	
	position := board player position.
	
	self deny: (board player move: CpDirection east).
	
	self assert: player position x equals: 3.
	
	self assert: player position y equals: 1.

	self assert: board asciiString equals: '# @#'.
]
