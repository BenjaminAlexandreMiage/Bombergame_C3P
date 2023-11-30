Class {
	#name : #Bomberman,
	#superclass : #Object,
	#category : #Bomberman
}

{ #category : #'instance creation' }
Bomberman class >> open [

	| space randomMenu levelMenu helpMenu bar title |
	
title := self title.
	space := BlSpace new.
	

space root addChild: title.

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
