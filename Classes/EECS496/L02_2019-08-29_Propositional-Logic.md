# Lecture #02 (August 29th, 2019) - Propositional Logic

- "Decision Making" agent choosing actions
- "Sequential" choices effect future outcomes & choices
- Agent Environment Loop
	- Agent -> Environment
		- Agent sends an Action
	- Environment -> Agent
		- Environment sends State and Feedback
	- Feedback isn't garenteed
- Recall types of environments from into to AI
	1) Fully Observable vs Partial Observable
	2) Deterministic vs Stochostic
	3) Discrete vs Contineous
	4) Single Agent vs Multiple Agent
	5) Non-Sequential vs Sequential

## propositional logic

- gives agent facts about the enbironment & inferenct algorithms
- syntax: what strings are allowed in the sentence
- semantics: given correct syntax, what does the sentence mean?
- wff aka "well formed formula"
	- any symbol "P, Q, rainTommorrow"
	- two special symbols "TRUE" and "FALSE"

### knowledge base (KB)

- container of literials

### entailment

- given a KB, what can be deduced?
- alpha entails beta
	-iff every model of alpha is also a model of beta
	- alpha entails beta IS NOT EQUIVELENT TO beta entails alpha
	- alpha does not entail beta IS NOT EQUIVELENT TO alpha entails not beta
- entailment is a "meta-logical" symbol, can't be used in wff's

### inference by enumeration

- alpha is valid if it is true in every model (tautology)
- alpha is satisfiable if it's true in some model
- proof by refutation
	- satisfiability & inference are linked
	- alpha entails beta iff (alpha ^ ~beta) has no model (unsatisfiability)