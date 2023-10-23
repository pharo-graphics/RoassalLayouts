"
Use this trait to define nodes
"
Trait {
	#name : 'RSTNode',
	#category : 'Roassal-Layouts-Traits',
	#package : 'Roassal-Layouts',
	#tag : 'Traits'
}

{ #category : 'accessing - nodes' }
RSTNode >> allRecursiveConnectedNodes [
	"Return the set of all recursively connected shapes."
	| r |
	r := Set new.
	self allRecursiveConnectedNodesIn: r.
	^ r
]

{ #category : 'accessing - nodes' }
RSTNode >> allRecursiveConnectedNodesIn: aCollection [
	"Private method"

	"If we already went through me, there is nothing to do"
	(aCollection includes: self) ifTrue: [ ^ self ].

	"Else, we add it and we do the recursion"
	aCollection add: self.
	self incomingNodes do: [ :s | s allRecursiveConnectedNodesIn: aCollection ].
	self outgoingNodes do: [ :s | s allRecursiveConnectedNodesIn: aCollection ]
]

{ #category : 'accessing - lines' }
RSTNode >> connectedLines [
	^ self explicitRequirement
]

{ #category : 'accessing' }
RSTNode >> encompassingRectangle [
	^ self explicitRequirement
]

{ #category : 'accessing' }
RSTNode >> extent [
	^ self explicitRequirement
]

{ #category : 'accessing' }
RSTNode >> extent: aPoint [
	self explicitRequirement
]

{ #category : 'testing' }
RSTNode >> hasLines [
	^ self explicitRequirement
]

{ #category : 'accessing' }
RSTNode >> height [
	^ self explicitRequirement
]

{ #category : 'accessing' }
RSTNode >> height: aNumber [
	self explicitRequirement
]

{ #category : 'accessing - nodes' }
RSTNode >> incomingNodes [
	^ self explicitRequirement
]

{ #category : 'accessing - nodes' }
RSTNode >> outgoingNodes [
	^ self explicitRequirement
]

{ #category : 'accessing - lines' }
RSTNode >> updateLinesOFF [
	self explicitRequirement
]

{ #category : 'accessing - lines' }
RSTNode >> updateLinesON [
	self explicitRequirement
]

{ #category : 'accessing' }
RSTNode >> width [
	^ self explicitRequirement
]

{ #category : 'accessing' }
RSTNode >> width: aNumber [
	self explicitRequirement
]
