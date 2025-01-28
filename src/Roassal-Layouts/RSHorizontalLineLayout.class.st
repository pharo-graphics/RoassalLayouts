"
A RSHorizontalLineLayout locates all the elements horizontally.

You can use label alignment to align labels based on baseline of each font.

"
Class {
	#name : 'RSHorizontalLineLayout',
	#superclass : 'RSAbstractLineLayout',
	#category : 'Roassal-Layouts-Line',
	#package : 'Roassal-Layouts',
	#tag : 'Line'
}

{ #category : 'alignment' }
RSHorizontalLineLayout >> alignBottom [
	self alignment: #bottom
]

{ #category : 'alignment' }
RSHorizontalLineLayout >> alignLabel [
	"Align shapes along the label baseline. It is here assumed that shapes are labels"
	self alignment: #label
]

{ #category : 'alignment' }
RSHorizontalLineLayout >> alignMiddle [
	"Make the element middle"
	self alignment: #middle
]

{ #category : 'alignment' }
RSHorizontalLineLayout >> alignTop [
	self alignment: #top
]

{ #category : 'hook' }
RSHorizontalLineLayout >> deltaFor: anRSShape [
	| delta |
	delta := 0.
	alignment == #bottom ifTrue: [ delta := anRSShape height ].
	alignment == #middle ifTrue: [ delta := anRSShape height / 2.0 ].
	alignment == #label
		ifTrue: [ delta := anRSShape y_bearing negated ].
	^ 0 @ delta
]

{ #category : 'hook' }
RSHorizontalLineLayout >> movePointer: pointer accordingToFigure: anRSShape [
	^ (pointer x + anRSShape width + self horizontalGap) @ pointer y
]

{ #category : 'hook' }
RSHorizontalLineLayout >> positionOriginalPointer: aCollectionOfShapes [
	| maxHeight delta |
	delta := 0.
	alignment == #bottom ifTrue: [
		maxHeight := aCollectionOfShapes maxValue: #height.
		delta := maxHeight ].
	alignment == #middle ifTrue: [
		maxHeight := aCollectionOfShapes maxValue: #height.
		delta := maxHeight / 2.0 ].
	^ (0) @ ((0) + delta)
]
