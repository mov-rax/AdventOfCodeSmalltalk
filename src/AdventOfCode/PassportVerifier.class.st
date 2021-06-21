"
This Passport Class is used to verify an individual's passport.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	byr:		<Object>
	cid:		<Object>
	ecl:		<Object>
	eyr:		<Object>
	hcl:		<Object>
	hgt:		<Object>
	iyr:		<Object>
	pid:		<Object>


    Implementation Points
"
Class {
	#name : #PassportVerifier,
	#superclass : #Object,
	#category : #'AdventOfCode-AOC2020'
}

{ #category : #access }
PassportVerifier class >> checkBirthYear: byr [ 
	"Checks to see if birth year is correct"
	| temp |
	temp := self fromLine: byr grabField: 'byr'.
	temp ifNil: [ ^false ].
	(temp size = 4) ifFalse: [ ^false ].
	^((temp asNumber) between: 1920 and: 2002)
]

{ #category : #access }
PassportVerifier class >> checkExpirationYear: eyr [
	"Checks the issue year."
	| temp |
	temp := self fromLine: eyr grabField: 'eyr'.
	temp ifNil: [ ^false ].
	(temp size = 4) ifFalse: [ ^false ].
	^((temp asNumber) between: 2020 and: 2030)
]

{ #category : #access }
PassportVerifier class >> checkEyeColor: ecl [
	"Verifies eye color."
	| temp |
	temp := self fromLine: ecl grabField: 'ecl'.
	temp ifNil: [ ^false ].
	^(('(amb|blu|brn|gry|grn|hzl|oth)' asRegex) matchesIn: temp) size = 1
		
	
]

{ #category : #access }
PassportVerifier class >> checkHairColor: hcl [
	"Verifies hair color."
	| value temp |
	"Does what fromline: grabField: would do, but with a #"
	temp := (('hcl\:#\w+') asRegexIgnoringCase) matchesIn: hcl.
	(temp size = 1) ifFalse: [ ^false ].
	temp := ((temp at: 1) splitOn: ':') at: 2.
	
	(temp at: 1) = $# ifFalse: [ ^false ].
	value := ('[0-9 | a-f]+' asRegexIgnoringCase) matchesIn: temp.
	(value size) = 1 ifFalse: [ ^false ].
	^(value at:1) size = 6.
				
	
]

{ #category : #access }
PassportVerifier class >> checkHeight: hgt [
	"Checks the issue year."
	| isCm num temp |
	
	temp := self fromLine: hgt grabField: 'hgt'.
	temp ifNil: [ ^false ].
	
	num := (('[0-9]+' asRegex) matchesIn: temp).
	num size = 1 ifFalse: [ ^false ].
	
	isCm := ((('cm' asRegex) matchesIn: temp) size = 1).
	(isCm or: ((('in' asRegex) matchesIn: temp) size) = 1) ifFalse: [ ^false ].
	num := (num at: 1) asNumber.
	isCm ifTrue: [  
		^(num between: 150 and: 193)
		] ifFalse: [  
		^(num between: 59 and: 76)
		].
	
	 
]

{ #category : #access }
PassportVerifier class >> checkIssueYear: iyr [
	"Checks the issue year."
	| temp |
	temp := self fromLine: iyr grabField: 'iyr'.
	temp ifNil: [ ^false ].
	
	(temp size = 4) ifFalse: [ ^false ].
	^((temp asNumber) between: 2010 and: 2020)
	
]

{ #category : #access }
PassportVerifier class >> checkPassport: passport [
	"Checks all fields in a passport. If valid, returns true"

	(self checkBirthYear: passport) ifFalse: [ ^false ].
	(self checkIssueYear: passport) ifFalse: [ ^false ].
	(self checkExpirationYear: passport) ifFalse: [ ^false ].
	(self checkHeight: passport) ifFalse: [ ^false ].
	(self checkHairColor: passport) ifFalse: [ ^false ].
	(self checkEyeColor: passport) ifFalse: [ ^false ].
	^(self checkPassportID: passport)
]

{ #category : #access }
PassportVerifier class >> checkPassportID: pid [
	"Checks passport ID validity."
	| temp |
	temp := self fromLine: pid grabField: 'pid'.
	temp ifNil: [ ^false ].
	
	(temp size = 9) ifFalse: [ ^false ].
	 ^(temp isAllDigits)

			
	
]

{ #category : #access }
PassportVerifier class >> fromLine: line grabField: fieldName [ 
	"comment stating purpose of class-side method"
			
	|temp|
	
	temp := ((fieldName ,'\:\w+') asRegexIgnoringCase ) matchesIn: line.
	(temp size = 1) ifFalse: [ ^nil ].
	temp := ((temp at: 1) splitOn: ':') at: 2.
	^temp
	
	
]
