Class {
	#name : 'RSLayoutTest',
	#superclass : 'RSLayoutTestCase',
	#instVars : [
		'shapes',
		'canvas'
	],
	#category : 'Roassal-Layouts-Tests',
	#package : 'Roassal-Layouts-Tests'
}

{ #category : 'testing' }
RSLayoutTest class >> isAbstract [
	^ self ==  RSLayoutTest
]

{ #category : 'utilities' }
RSLayoutTest >> apply [

	self subclassResponsibility
]

{ #category : 'running' }
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

{ #category : 'utilities' }
RSLayoutTest >> setUpGraphWithCycles [

	canvas := RSLayoutNode new.
	shapes := (1 to: 4) collect: [ :i |
			          (RSLayoutNode model: i)
				          size: 5;
				          yourself ].
	shapes first size: 200. "this tests specific infinite loop bug in tree layout"
	canvas addAll: shapes.
	RSLayoutLineBuilder new
		canvas: canvas;
		useAssociations: {
				(1 -> 2).
				(2 -> 3).
				(3 -> 4).
				(4 -> 2) } "cycle"
]

{ #category : 'tests' }
RSLayoutTest >> testLoop [

	self setUpGraphWithCycles.
	self apply
]
