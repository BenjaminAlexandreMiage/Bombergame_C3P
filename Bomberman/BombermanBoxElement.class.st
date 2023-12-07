Class {
	#name : #BombermanBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'board',
		'positionInField'
	],
	#classVars : [
		'Icons'
	],
	#classInstVars : [
		'positionInField'
	],
	#category : #Bomberman
}

{ #category : #'as yet unclassified' }
BombermanBoxElement class >> boxAnimationExplosion [

	^ nil
]

{ #category : #'accessing - icons' }
BombermanBoxElement class >> boxIcon [
	"Private - Generated method"

	^ Icons at: #boxIcon ifAbsentPut: [
		  Form fromBinaryStream:
			  self boxIconContents base64Decoded asByteArray readStream ]
]

{ #category : #'as yet unclassified' }
BombermanBoxElement >> backgroundPaint [ 
	^ Color transparent
]

{ #category : #'as yet unclassified' }
BombermanBoxElement >> board [ 
	^ board 
]

{ #category : #'as yet unclassified' }
BombermanBoxElement >> board: aBombermanBoard [

	board := aBombermanBoard.

	self
		constraintsDo: [ :c | c horizontal matchParent ]
		"addEventHandlerOn: BlElementBackgroundChangedEvent do: [ :evt |
			self transformDo: [ :builder |
					builder
						topLeftOrigin;
						scaleBy: evt currentTarget extent / self background image extent.
					self halt ] ]"
]

{ #category : #'as yet unclassified' }
BombermanBoxElement >> box [ 
	^ box 
]

{ #category : #'as yet unclassified' }
BombermanBoxElement >> box: aBombermanElement [

	box := aBombermanElement.
]

{ #category : #accessing }
BombermanBoxElement >> initialize [

	super initialize.

	self
		background: self backgroundPaint;
		geometry: BlSquareGeometry new;
		layout: BlSquaredLayout new
]

{ #category : #'as yet unclassified' }
BombermanBoxElement >> positionInField [

	^ positionInField
]

{ #category : #'as yet unclassified' }
BombermanBoxElement >> positionInField: aPoint [

	positionInField := aPoint
]

{ #category : #accessing }
BombermanBoxElement >> updateBackgroundColor [

	| bg |
	bg := self box backgroundRepresentation.
	bg class = Form ifTrue: [
		| size boardElement space |
		
		boardElement := self parent parent parent.
		space := boardElement space.
		size := space extent / boardElement board width
		        - boardElement firstChild layout cellSpacing.
		bg := bg scaledIntoFormOfSize: size ].
	self background: bg
]
