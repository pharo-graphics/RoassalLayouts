"
A RSDominanceTreeLayoutTest is a test class for testing the behavior of RSDominanceTreeLayout
"
Class {
	#name : 'RSDominanceTreeLayoutTest',
	#superclass : 'RSLayoutTest',
	#category : 'Roassal-Layouts-Tests',
	#package : 'Roassal-Layouts-Tests'
}

{ #category : 'utilities' }
RSDominanceTreeLayoutTest >> apply [

	RSDominanceTreeLayout new on: shapes
]
