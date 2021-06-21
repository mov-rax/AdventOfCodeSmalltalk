Class {
	#name : #Lazy3DSpace,
	#superclass : #Object,
	#instVars : [
		'dict'
	],
	#category : #'AdventOfCode-AOC2020'
}

{ #category : #initialization }
Lazy3DSpace class >> default [
	"Creates a new Lazy3DSpace"
			
	| temp |
	temp := self new.
	temp setDict: (Dictionary new).
	^temp
]

{ #category : #accessing }
Lazy3DSpace >> getAtCoord: coord [
	"Gets object at a location specified by coord (a 3-sized array with numbers). If the object does not exist 
	then nil gets returned."
	
	^[ dict at: coord ] on: KeyNotFound do: [ nil ]
]

{ #category : #modifying }
Lazy3DSpace >> setAtCoord: coord withValue: val [
	"Sets the value of an object at a coordinate."
			
	dict at: coord put: val.
]

{ #category : #internal }
Lazy3DSpace >> setDict: d [
	"Sets the internal dictionary."
			
	dict := d
]
