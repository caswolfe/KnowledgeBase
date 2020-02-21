# Lecture #02 (September 3d, 2019) - Conjunctive Normal Form

- conjunctive normal form
	- conjunction of disjunctions
	- ex: (L11 **OR** L12 .. **OR** L1k) **AND** (L21 **OR** L22 ... **OR** L2k)
	- every sentence in propositional logic can be transformed into a 3CNF formula

## Satisfiability as a Goal-Directed Search

- initial state no value assignment
- search operators: assinging values to literals
- cost: uniform
- goal state is a model

## DPLL

- input: CNF formula
- output: satisfying assignment (if any)
- algorithm: DFS of space f/ models
	- uses heuristics to guide search (prune search space)
	- complete (will find answere if any exists)
- at each depth restrict to one literal change to prevent duplication
- heuristics
	- pure literals
		- a literal which appears entirly negated or un-negated
		- if the CNF is valid, the **whole** pure literal will be true (A = TRUE, or ~A = TRUE)
		- ex:
			- (A **OR** ~B) **AND** (~B **OR** ~C) **AND** (C **OR** ~A)
			- A & B are pure literals
			- C is not a pure literal
	- unit propagation
		- if a clause has all but one literal evaulate to FALSE, then that last literal must be set to TRUE
		- ex:
			- (A **OR** ~B) **AND** (~B **OR** ~C) **AND** (C **OR** ~A)
			- B = TRUE -> ~B = FALSE -> A = TRUE -> ~C = TRUE
	- early termination
		- in a CNF, every clause has to be true
		- therefore, any partial assignment which sets a clause to FALSE can be pruned
		- since a clause is a disjunction, a single TRUE literals means the clause is TRUE
- algorithm
	1) start w/ empty model
	1) if all clauses TRUE, return TRUE
	1) if any clause is FALSE, return FALSE
	1) if unassigned pure literal, set true then DPLL
	1) else if unassiged unit clause, set true then DPLL
	1) else pick a random symbol, return DPLL w/ symbol set to TRUE **OR**'d with DPLL with the symbol set to FALSE

## Satisfiability by Optimization (Local Search)

- can't use partial valued assignments, need to change search space to match
- allows to determine goal progress
- search operator will invert random symbol to find a state which goal trends correctly

## WalkSAT

- algorithm
	1) start w/ init complete assignment
	1) repeat MAX_FLIPS times
		1) if al clauses TRUE, return current assignment
		1) else pick random unsatisified clause and w/ probability 1-p:
			1) flip the assignment of the variable in the clause that maximizes satisfied clauses
			1) else flip the assignment of a random variable in the clause
- properties of WalkSAT
	- not complete
- HardSAT
	- for a CNF,
		- m is the # of clauses
		- n is the # of literals
	- m/n determines if the CNF is HardSAT
- intuition
	- for m << n, probability of finding a model is ~1
	- for m >> n, probability of finding a model is ~0
	- [0, 3.5] is easy w/ prob ~1
	- [3.5, 5.5] is hard
	- [5.5, infinity] is easy w/ prob ~0