Extension { #name : #SequenceableCollection }

{ #category : #'*Roassal-Layouts-Util' }
SequenceableCollection >> asGroup [
	^ (RSGroup new: self size) addAll: self; yourself
]
