"
Adjust the size of the shapes
"
Class {
	#name : 'RSResize',
	#superclass : 'RSAbstractShapeHandling',
	#category : 'Roassal-Layouts-PositionAndResize',
	#package : 'Roassal-Layouts',
	#tag : 'PositionAndResize'
}

{ #category : 'accessing - computed' }
RSResize >> biggestExtent [
	fixedShape ifNotNil: [ ^ fixedShape extent ].
	^ shapes inject: 0 @ 0 into: [ :maxExtent :e |
			maxExtent max: e extent ]
]

{ #category : 'accessing - computed' }
RSResize >> biggestShape [
	^ shapes inject: shapes anyOne into: [ :biggestShape :e |
			biggestShape extent < e extent
				ifTrue: [ e ] ifFalse: [ biggestShape ] ]
]

{ #category : 'accessing - computed' }
RSResize >> highestShape [
	^ shapes inject: shapes anyOne into: [ :highestShape :e |
			highestShape extent y < e extent y
				ifTrue: [ e ] ifFalse: [ highestShape ] ]
]

{ #category : 'public' }
RSResize >> sameHeight [
	self ifNoFixedShapeThen: [ self useHighestShape ].
	shapes do: [ :e | e height: self fixedShape height ]
]

{ #category : 'public' }
RSResize >> sameSize [
	self ifNoFixedShapeThen: [ self useBiggestShape ].
	shapes do: [ :e | e extent: self fixedShape extent ]
]

{ #category : 'public' }
RSResize >> sameWidth [
	self ifNoFixedShapeThen: [ self useWidestShape ].
	shapes do: [ :e | e width: self fixedShape width ]
]

{ #category : 'public - configuration' }
RSResize >> useBiggestShape [
	self fixedShape: self biggestShape
]

{ #category : 'public - configuration' }
RSResize >> useHighestShape [
	self fixedShape: self highestShape
]

{ #category : 'public - configuration' }
RSResize >> useWidestShape [
	self fixedShape: self widestShape
]

{ #category : 'accessing - computed' }
RSResize >> widestShape [
	^ shapes inject: shapes anyOne into: [ :widestElement :e |
			widestElement extent x < e extent x
				ifTrue: [ e ] ifFalse: [ widestElement ] ]
]
