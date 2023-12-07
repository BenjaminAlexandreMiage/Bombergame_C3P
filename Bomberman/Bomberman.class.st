Class {
	#name : #Bomberman,
	#superclass : #Object,
	#category : #Bomberman
}

{ #category : #'as yet unclassified' }
Bomberman class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color veryVeryLightGray;
		border: (BlBorder paint: Color veryDarkGray).
	^ bar
]

{ #category : #accessing }
Bomberman class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Help').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousHelp)).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text: ('How to play:
		 
Bomberman is a game created by Hudson Soft where the player plays a bomber, the goal being to blow up opponents/enemies to win. 

Have fun !' asRopedText foreground: Color white).
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color veryDarkGray;
			             padding: (BlInsets all: 15);
			             layout: BlLinearLayout vertical;
			             constraintsDo: [ :c |
				             c horizontal fitContent.
				             c vertical fitContent ].
		container addChild: lab.
		space := BlSpace new.
		space root
			layout: BlFrameLayout new;
			addChild: container;
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : #'instance creation' }
Bomberman class >> open [

	| space  helpMenu bar title |
		helpMenu := self menuHelp.
		bar := self menuBar.
      title := self title.
	   space := BlSpace new.
      space root addChild: title.
      bar addMenu: helpMenu.
	   space root addChild: bar.
	   space extent: 300 @ 300.
	   space show
]

{ #category : #accessing }
Bomberman class >> title [

	| title |
	title := BlElement new background: Color brown  .
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Bomberman' asRopedText
				   fontName: 'Phosphate';
				   foreground: Color white;
				   fontSize: 50)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]
