TestCase subclass: #LandingScreenTest
    instanceVariableNames: 'landingScreen'
    classVariableNames: ''
    package: 'Bomberman-UITests'

LandingScreenTest >> setUp [
    landingScreen := LandingScreen new.
]

{ #category : #' tests' }
LandingScreenTest >> testMenuBar [
    | menuBar |
    menuBar := landingScreen class menuBar.

    self assert: menuBar isKindOf: ToMenuBar.
    self assert: menuBar hMatchParent equals: true.
    self assert: menuBar vFitContent equals: true.
    self assert: menuBar background equals: Color veryPaleRed.
    self assert: menuBar border equals: (BlBorder paint: Color veryDarkGray).
]

{ #category : #' tests' }
LandingScreenTest >> testMenuHelp [
    | menu |
    menu := landingScreen class menuHelp.

    self assert: menu label text equals: 'Help'.
    self assert: menu icon inner equals: (Smalltalk ui icons iconNamed: #glamorousHelp).

{ #category : #' tests' }
LandingScreenTest >> testMenuBarLayoutConstraints [
    | menuBar |
    menuBar := landingScreen class menuBar.

    self assert: menuBar layoutConstraints size = 2.
    self assert: (menuBar layoutConstraints anySatisfy: [:constraint | constraint isKindOf: BlHorizontalConstraint]).
    self assert: (menuBar layoutConstraints anySatisfy: [:constraint | constraint isKindOf: BlVerticalConstraint]).
]

{ #category : #' tests' }
LandingScreenTest >> testMenuHelpItemCreation [
    | menu |
    menu := landingScreen class menuHelp.

    self assert: menu items size equals: 1.
    self assert: (menu items first label text equals: 'Help').
]

{ #category : #' tests' }
LandingScreenTest >> testMenuHelpAction [
    | menu |
    menu := landingScreen class menuHelp.
    self assert: menu action isNotNil.
]

{ #category : #' tests' }
LandingScreenTest >> testMenuHelpIconValidity [
    | menu |
    menu := landingScreen class menuHelp.

    self assert: menu icon isKindOf: ToImage.
    self assert: menu icon inner isNotNil.
]

