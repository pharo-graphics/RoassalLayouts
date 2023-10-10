Class {
	#name : #RSLayoutTestCase,
	#superclass : #TestCase,
	#category : #'Roassal-Layouts-Tests'
}

{ #category : #asserting }
RSLayoutTestCase >> assertIntegerPosition: aGroupOfShapes equals: anArray [
	| col |
	col := aGroupOfShapes collect: [ :each | each position asIntegerPoint ] as: Array.
	self assert: col size equals: anArray size.
	col do: [ :each | self assert: (anArray includes: each) ]
]
