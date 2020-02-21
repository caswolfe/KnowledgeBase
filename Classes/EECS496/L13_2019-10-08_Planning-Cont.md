# Lecture #13 (October 8th, 2019) - Planning Continued

- backward state space planning
	- forward search has irrelevant actions
	- by going backwards we remove these redundancies
- relevant actions	
	- if an action has an affect which aligns with the goal state
- backward algorithm
	1) start w/ goal state as the initial state
	1) for each relevant action A
		1) delete literals in G which are added by A
		1) add preconditions of A to G
	1) goal test

- remember plan space planners
	- planes generated w/ this method return *totally ordered plans*

## Ordered Plans

- **Totally Ordered Plans**
	- every pair of actions (ex: A<sub>1</sub> & A<sub>2</sub>) have temporal ordering constrains
- **Partially Ordered Plans**
	- some actrions w/ no ordering relationships
	- *START*
		- dummy state w/ effect of init state
	- *END*
		- dummy state w/ preconditions of goal state
- POP
	- represented as set of actions & ordering constraints
		- ex: <code>A<B</code>
	- POP allows f/ parallelism
	- flexibility
	- partial failure resilience
- finding POP's
	- plan space search
	- search space is incomplete POP's
	- state will have:
		1) incomplete POP
		1) list of open conditions
			- preconditions of an action in the plan that isn't in the effect of any action in the POP
			- terminate where the list is empty
			- init this is goal, represented by dummy *END* action
		1) causal link
			- action B has open precondition P
			- planner adds action A to POP that has p as an effect
			- cause f/ A is so it fulfills p for B
			- annotated in POP by causal link <code>A -p-> B</code>
- conflict & threats
	- suppose <code>A<B</code> on the condition of p
	- suppose C has ~p affect & could be executed after A but before B
	- we say C *conflicts with* or *threatens* the causal link <code>A -p-> B</code>
- consistent plans
	- a POP with:
		- no cycles
		- no conflicts
		- no open conditions
- POP search algorithm
	1) init state
		- <code>Plan = (START, END, (START<END))</code>
	1) open conditions are the preconditions of END
	1) search operators
		1) pick an open condition and an action to satisfy said open condition
		1) generate the next step (a new, consistent, possibly incomplete state)
- generating the next state
	1) remove p from open conditions
	1) add A to list of actions in POP
	1) add ordering constraints <code>(START<A, A<B, B<END)</code>
	1) add A's preconditions to the list of open conditions
	1) add causal link <code>A -p-> B</code>
- conflict resolution
	- add ordering constraints