"
This class is used in AdventOfCode2020 puzzle 6.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #GroupVerifier,
	#superclass : #Object,
	#category : #'AdventOfCode-AOC2020'
}

{ #category : #calculating }
GroupVerifier class >> countForGroup2: group [
	"Trys a different method."
			
	| lines count req result |
	lines := group splitOn: Character lf.
	^lines
	
	
	
]

{ #category : #calculating }
GroupVerifier class >> countForGroup: group [
	"Returns the number of answers that exist in all members of a group."
			
	| list temp |
	list := group splitOn: (Character lf asString).
	^((list at: 1) count: [ :char |
		temp := (((char asString) asRegex) matchesIn: group).
		(temp size) = (list size)
		 ])
	
]
