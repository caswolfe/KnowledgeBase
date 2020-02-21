# Lecture #12 (October 3d, 2019) - Automated Planning

- Given
	1) init state of the world
	2) set of goal conditions
	3) set of actions in logic
- Find sequence of actions that will move the world from the init state to the goal state
	- aka *a plan*

## "Classic" Planning

- World Properties
	1) static
	1) deterministic
	1) fully observable
	1) discrete
	1) actions are instant
	- Note that this is the simplest setup, as algorithms/solutions exist in worlds with relaxed properties
- make-span
	- duration of the plan
		- want to minimize
- syntax
	- extent PL
	- ex: <code>Holding(A)</code>
	- <code>Holding(X)</code>
		- takes a variable argument
		- map to <code>Holding_A, Holding_B, ...</code>

## STRIPS

- represent states, actions, & goals
- note other languages exist to better describe the world (PDDL, Situational Calculus)
- syntax
	- conjunction of unnegated ground literals
	- closed world assumption
		- anything not explicitly listed as a part of a state is defined as false
	- goals
		- collections of state
		- conjunction of unnegated, function free literals
		- doesn't have to determine the full goal state of the world
	- representing actions
		- <code>Pickup_From_Table(X)</code>
		- **Preconditions**: <code>Block(X), Gripper_Empty, Clear(X), ON(X, TABLE)</code>
		- **Add List**: <code>Holding(X)</code>
		- **Delete List**: <code>Gripper_Empty, On(X, TABLE)</code>

- planning
	- state space planners
	- plan space planners

## State Space Search

- setup
	- states = world description in strips
	- init state = strips init state
	- search operators = strips action schema (those which are applicable to the current state)
	- goal state = strips goal state
	- cost = 1, all uniform
- can use any search algorithm ex: A*
	- heuristics based on planning ideas
- heuristics
	- estimate # of actions 'till goal
	- two common answers
		1) relax planning problem
		1) consider sub-problems
- relaxing planning problems
	- ignore delete effects
		- gives admissible heuristics
		- to estimate cost, need to run internal planning loop; but this is usually very fast
- sub-problems
	- achieve sub-set of goal conditions
	- use max function to find admissible cost heuristics
- can use both relaxed planning & subproblems @ the same time.