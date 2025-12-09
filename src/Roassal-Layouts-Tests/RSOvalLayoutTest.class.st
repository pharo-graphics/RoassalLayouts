Class {
	#name : 'RSOvalLayoutTest',
	#superclass : 'RSLayoutTest',
	#category : 'Roassal-Layouts-Tests',
	#package : 'Roassal-Layouts-Tests'
}

{ #category : 'utilities' }
RSOvalLayoutTest >> apply [

	RSOvalLayout on: canvas nodes
]

{ #category : 'tests' }
RSOvalLayoutTest >> testSimple [
	RSOvalLayout on: canvas nodes.

]
