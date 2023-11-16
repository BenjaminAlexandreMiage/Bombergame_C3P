Class {
	#name : #StructuralBoardTest,
	#superclass : #TestCase,
	#category : #'Bomberman-Tests'
}

{ #category : #data }
StructuralBoardTest >> map [

^	'######
	 #@$  #
	 #$   #
	 ######
	'
]

{ #category : #tests }
StructuralBoardTest >> testBoardHeight [

	|board|
	
	board := BombermanBoard  createWithBoard:
						((MygLevelImporter
			          	fromString: '#@  # '
			          	fromPackage: BombermanBoard  package) collect: [ :each | each configured ]).
				
	self assert: board height equals: 1.
]

{ #category : #' tests' }
StructuralBoardTest >> testBoardWidth [

	|board|
	
	board := BombermanBoard  createWithBoard:
						((MygLevelImporter
			          	fromString: '#@  #'
			          	fromPackage: BombermanBoard  package) collect: [ :each | each configured ]).
				
	self assert: board width equals: 5.
]

{ #category : #'tests-building' }
StructuralBoardTest >> testPlayerPosition [

	|board|

	board := BombermanBoard  createWithBoard:
						((MygLevelImporter
			          	fromString: self map
			          	fromPackage: BombermanBoard  package) collect: [ :each | each configured ]).
				
			self assert: board player position x equals: 2.
			self assert: board player position y equals: 2.
			self assert: board player position x equals: 2.
]

{ #category : #'tests-building' }
StructuralBoardTest >> testVoisinPlayer [

	|board|

	board := BombermanBoard  createWithBoard:
						((MygLevelImporter
			          	fromString: self map
			          	fromPackage: BombermanBoard  package) collect: [ :each | each configured ]).
				
	self assert: 
		((board atPosition: CpDirection north * board player position)
			isKindOf: BombermanWall).
			
	self assert: 
		((board atPosition: CpDirection south * board player position)
			isKindOf: BombermanBox).
			
	self assert: 
		((board atPosition: CpDirection east * board player position)
			isKindOf: BombermanBox).
			
	self assert: 
		((board atPosition: CpDirection west * board player position)
			isKindOf: BombermanWall).
]
