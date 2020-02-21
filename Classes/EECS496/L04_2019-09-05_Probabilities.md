# Lecture #03 (September 5th, 2019) - Probabilities

- propositional logic w/ "degrees of belief"

- **Random Variable**
	- refers to uncertain fact
	- can denote degree of belief
- **Atomic Events**
	- set of all variables assigned
	- analogous to a row in a truth table
	- mutually exclusive & exhaustive
		- at most one true set
		- all state must represent
	- **event** collection of atomic events
	- **sample space** is the collection of all atomic events (&Omega;)
- Joint Probability
	- we can assign degrees of belief to both individual atomic events as well as a group of atomic events
- Axioms of Probability
	1) For any event <code>E, 0 <= Pr(E) <= 1</code>
	1) <code>Pr(&Omega;) = 1</code>
	1) For mutually disjoint events, probability of a union is <code>Pr(Union<sub>(E)</sub> = SUM(Pr(E))</code>
- probability theory will beat any other axioms of probability
- **Probability Density Functions**
	- PDF over group of random variables
	- all PDF's must sum to 1

## Probability Rules

- **Conditional Probability**
	- <code>Pr<sub>x|y</sub>(X=x|Y=y) = [Pr<sub>x,y</sub>(X=x,Y=y)]/[Pr<sub>y</sub>(Y=y)]</code>
- **Product Rule**
	- <code>Pr<sub>x,y</sub>(X=x,Y=y) = Pr(Y=y|X=x)Pr(X=x)</code>
- **Marginalization**
	- <code>P<sub>x</sub>(X=x) = SUM<sub>y</sub>P<sub>x,y</sub>(X=x,Y=y)</code>
- **Conditioning**
	- <code>P(X=x) = SUM<sub>y</sub>P<sub>x,y</sub>(X=x,Y=y)</code>
	- <code> = SUM<sub>y</sub>Pr(X=x|Y=y)Pr(Y=y)</code>
- **Bayes Rule**
	- <code>Pr(C=c|E=e) = [Pr(C=c,E=e)]/[Pr(E=e)]</code>

## Working with Probability

- Summarizing PDF's
	- expected value <code>E(X) = SUM<sub>x</sub>xPr<sub>x</sub>(x)</code>
	- variance
		- <code>V(X) = E([X-E(X)]<sup>2</sup>)</code>
		- <code> = SUM<sub>x</sub>[(x-E(x))<sup>2</sup>p<sub>x</sub>(x)]</code>
		- "average spread of the variable"
		- similar to distribution
		- can take the square-root to get the standard deviation
- statistical independence
	- to rv's are statistically independent if <code>Pr<sub>x,y</sub>(X=x,Y=y) = Pr<sub>x</sub>(X=x)Pr<sub>y</sub>(Y=y)</code>
- conditional independence
	- <code>Pr<sub>x,y|r</sub>(X=x, Y=y|R=r) = Pr<sub>x|r</sub>(X=x,R=r)Pr<sub>y|r</sub>(Y=y|R=r)</code>
	- grants independence under the condition of R
- probabilistic inference
	- observe variables as evidence
	- events are described by query variables
- inference by enumeration
	1) given PDF of X
	1) observe evidence E=e
	1) interested in V
	1) let Y denote X without E or V
		- Note: <code>X = Y Union E Union V </code>
	1) we want <code>Pr(V|E)</code>

	Math | Method
	:-: | :-:
	<code>P(V=v\|E=e) = [Pr(V=v,E=e)]/[Pr(E=e)]</code> | start  
	... | ...
	... | ...
	... | ...
	... | ...
	<code>P(V=v\|E=e) = [SUM<sub>y</sub>(Pr(V=v,E=e,Y=y))]/[SUM<sub>v</sub>(SUM<sub>y</sub>(Pr(V=v,E=e,Y=y)))]</code> | end
	
	- can optimize by solving numerator w/ different values of V