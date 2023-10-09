Class {
	#name : #RSLayoutTestCase,
	#superclass : #TestCase,
	#category : #'Roassal-Layouts-Tests'
}

{ #category : #asserting }
RSLayoutTestCase >> assertIntegerPosition: aGroupOfShapes equals: anArray [
	self 
		assert: (aGroupOfShapes collect: [ :each | each position asIntegerPoint ] as: Array)
		equals: anArray
]
