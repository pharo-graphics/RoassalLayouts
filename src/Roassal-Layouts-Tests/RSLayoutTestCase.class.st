Class {
	#name : #RSLayoutTestCase,
	#superclass : #TestCase,
	#category : #'Roassal-Layouts-Tests'
}

{ #category : #asserting }
RSLayoutTestCase >> assertIntegerPosition: aGroupOfShapes equals: anArray [
	| block |
	block := [ :a :b | a x = b x ifTrue: [ a y < b y ] ifFalse: [ a x < b x ] ].
	self 
		assert: ((aGroupOfShapes collect: [ :each | each position asIntegerPoint ] as: Array) sortedAs: block )
		equals: (anArray sortedAs: block)
]
