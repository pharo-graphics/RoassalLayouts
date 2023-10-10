Class {
	#name : #RSLayoutTest,
	#superclass : #RSLayoutTestCase,
	#instVars : [
		'shapes',
		'canvas'
	],
	#category : #'Roassal-Layouts-Tests'
}

{ #category : #testing }
RSLayoutTest class >> isAbstract [
	^ self ==  RSLayoutTest
]

{ #category : #running }
RSLayoutTest >> setUp [
	| eb |
	super setUp.

	canvas := RSLayoutNode new.
	shapes := (1 to: 10) collect: [ :i | 
		(RSLayoutNode model: i) 
			size: 5;
			yourself ].
	canvas addAll: shapes.

	eb := RSLayoutLineBuilder new.
	eb canvas: canvas.
	eb shapes: shapes.
	eb connectFrom: [ :nb | nb // 2 ]
]
