Class {
	#name : #Bomberman,
	#superclass : #Object,
	#instVars : [
		'map',
		'board',
		'vision',
		'space',
		'container',
		'eventManage'
	],
	#category : #Bomberman
}

{ #category : #'instance creation' }
Bomberman class >> open [
	|f c|
	
	c := BlElement new
		             background: Color lightRed;
	
	f: BlSpace new.
	
	f root addChild: c.
	f extent: 1000 @ 1000.
	^ f show.
		
		
]

{ #category : #'as yet unclassified' }
Bomberman >> downEvent [ 

	|player|
	
	player := board player.
	
	player move: CpDirection south.
	
	self rechargeBoard.
	
	space show.
]

{ #category : #initialization }
Bomberman >> initialize [ 

map :=
'#####################
# @ $  ##D######  $ #
# $$  $        $  $$#
#    ###  ##  ###   #
# $  #      $     $ #
# $  ######$######$ #
# $$ #   D       $$ #
# $  #############  #
# $  $          $  $#
#    ##  ####  ##   #
# $$$$  ##  ##  $$$ #
#        $ $        #
#####################'.

	
	board := BombermanBoard  createWithBoard:
		         ((MygLevelImporter
			           fromString: map
			           fromPackage: BombermanBoard  package) do: [ :each |
			          each configured ]).
	
	vision := BombermanVision new.
	eventManage := BombermanEvent new.
	
	space := BlSpace new.
	space extent: 500@500.
	
	container := BlElement new
		             background: Color lightGray;
		             layout: (BlGridLayout  horizontal 
										rowCount: board height;
										columnCount: board width;
										cellSpacing:2 );
						 constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical fitContent   ].
		
	"board grid do: [ :each|container addChild: (vision coloringElement: each to: container)]."
	1 to: board height do: [ :y | 
		1 to: board width do: [ :x | container addChild:(vision coloringElement: (board atColumn: x atRow: y) to: container)] ].
	
	space root addChild:container.
]

{ #category : #'as yet unclassified' }
Bomberman >> leftEvent [ 

	|player|
	
	player := board player.
	
	player move: CpDirection west.

	self rechargeBoard.
	
	space show.
]

{ #category : #initialization }
Bomberman >> manageEvent: anEvent [

	 |touche|
	
	touche := anEvent key asString asUppercase.
	touche := touche substrings second.
		
	(touche = 'DOWN') ifTrue: [ ^self downEvent  ].
	(touche = 'UP') ifTrue: [ ^self upEvent  ].
	(touche = 'RIGHT') ifTrue: [ ^self rightEvent ].
	(touche = 'LEFT') ifTrue: [ ^self leftEvent ].
	(touche = 'SPACE') ifTrue: [ ^self placeBombEvent ].  
]

{ #category : #'instance creation' }
Bomberman >> open [
 
	self initialize.
	space show.
	
	space when: BlKeyUpEvent do: [ :event | self manageEvent: event ].
	


]

{ #category : #'as yet unclassified' }
Bomberman >> rechargeBoard [ 

	container := BlElement new
		             background: Color lightGray;
		             layout: (BlGridLayout  horizontal 
										rowCount: board height;
										columnCount: board width;
										cellSpacing:2 );
						 constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical fitContent   ].
		
	"board grid do: [ :each|container addChild: (vision coloringElement: each to: container)]."
	1 to: board height do: [ :y | 
		1 to: board width do: [ :x | container addChild:(vision coloringElement: (board atColumn: x atRow: y) to: container)] ].
	
space root addChild:container.
]

{ #category : #'as yet unclassified' }
Bomberman >> rightEvent [ 

	|player|
	
	player := board player.
	
	player move: CpDirection east.
	
	self rechargeBoard.
	
	space show.
]

{ #category : #'as yet unclassified' }
Bomberman >> spaceEvent [ 
    | playerPosition bomb delay |

    playerPosition := board player position.
    bomb := BombermanBombe new.

    board atColumn: playerPosition x atRow: playerPosition y put: bomb.

    delay := Delay forSeconds: 3.

    [delay wait. bomb explose] fork.

    self rechargeBoard.

    space show.


]

{ #category : #accessing }
Bomberman >> upEvent [ 

	|player|
	
	player := board player.
	
	player move: CpDirection north.
	
	self rechargeBoard.
	
	space show.
]
