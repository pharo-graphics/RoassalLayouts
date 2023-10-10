"
Used in tests to create lines, use RSLineBuilder
"
Class {
	#name : #RSLayoutLineBuilder,
	#superclass : #Object,
	#instVars : [
		'canvas',
		'nodes'
	],
	#category : #'Roassal-Layouts-Util'
}

{ #category : #accessing }
RSLayoutLineBuilder >> canvas [
	^ canvas ifNil: [ canvas := nodes anyOne parent ]
]

{ #category : #testing }
RSLayoutLineBuilder >> canvas: aNode [
	canvas := aNode
]

{ #category : #public }
RSLayoutLineBuilder >> connectFrom: aBlock [
	| fromNode |
	nodes do: [ :n |
		fromNode := self nodeFor: (aBlock value: n model).
		fromNode ifNotNil: [ self newLine from: fromNode to: n ]
		].
]

{ #category : #accessing }
RSLayoutLineBuilder >> newLine [
	| line |
	line := RSLayoutLine new.
	self canvas add: line.
	^ line
]

{ #category : #public }
RSLayoutLineBuilder >> nodeFor: model [
	^ self nodes detect: [ :node | node model = model ] ifNone: [ nil ]
]

{ #category : #accessing }
RSLayoutLineBuilder >> nodes [
	^ nodes ifNil: [ nodes := canvas nodes ]
]

{ #category : #accessing }
RSLayoutLineBuilder >> shapes: aCollection [
	nodes := aCollection
]

{ #category : #public }
RSLayoutLineBuilder >> useAssociations: aCollection [
	^ aCollection do: [ :assoc |
		self newLine
			from: (self nodeFor: assoc key)
			to: (self nodeFor: assoc value)
		 ]
	
]
