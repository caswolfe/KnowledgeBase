# Machine Learning

## Table of Contents
Item | Link
:-: | :-:
Introduction | [Link](#Introduction)
Review of Prob and Stats | [link](#Review-of-Probability-and-Statists)
Machine Learning Intro | [link](#Machine-Learning-Intro)
Decision Tree Classifiers | [link](#Decision-Tree-Classifiers)

### Terms and Definitions
Term | Definition
:- | :-
E | Examples
P | Performance Measure


### Introduction
- class logistics
    - full name in zoom participants tab please
    - no camera needed
    - use raise hand to ask a question
    - if Prof. Ray drops, he will send an email as a last mode of communication
    - all classes recorded
    - potential in-person meetings later in the semester (depends)
        - will be announced ahead of time on canvas
- LOG ONTO CSEVSC YA FOOL
- books (recommended)
    - Machine Learning by Tom Mitchell
        - old book, great structure / layout
    - Pattern Recognition and Machine Learning by Christopher Bishop
        - updated source
- office hours
    - F 9-10am (use zoom link)
    - or by appointment
- TA's
    - Kyle Pham
    - Robie Dozier
    - Naren Nallapareddy
- email
    - *you know his email and this is a public repo...*
    - prefix "EECS 440"
    - Prof. Ray will send emails to class list, make sure official SIS address can receive emails
- assignments
    - weekly written and programming due Friday 11:59pm
    - written
        - 2-3 a week
        - submit pdf's for each question individually
    - programming
        - python
        - some util code will be provided
        - ne external libraries expect data structures and math (eg numpy, scipy, cvxopt and wquivalent)
        - weekly commits for each person
            - must show progress
            - README too, you know the deal (*round 3*)
        - py file, note a python notebook
            - maybe dev in a python notebook still?
    - class project
        - comparative analysis of algorithms
        - write technical report on your work (due end of semester)
        - code submitted through git repo
        - sounds like the same project from last year
    - Midterm Exam
        - October 22nd
        - on whatever has been covered up to that point
        - will serve as the "comprehensive exam" for MS(C) students
    - +10% bonus for turning in assignments a week early
        - subjective bonus on programming from TA's, listed in assignment directions
    - partial credit for everything
    - 20% penalty from day-late assignments
        - after the day grace period, assignments will not be accepted without acceptable reason (illness, etc)
    - projects done in groups of 6
- Grading
    - everything is a quarter
        - written, programming, project, and exam

### Review of Probability and Statists
- Probability Theory
    - "degrees of belief"
    - **Random Variable** (R.V.)
        - a variable that refers to an uncertain fact
        - domain can be discrete or continuous
    - Joint Probability
        - <code>Pr(-1 < x, y < 1) = 0.2</code>
- Axioms of Probability
    - For any event *E*, <code>0 <= Pr(E) <= 1</code>
    - <code>Pr(&Omega;)=1</code>
    - For *mutually disjoint* events, the probability of the union is given by
        - **GET-EQU-SLIDE-11**
- Probability Density Functions
    - A function that maps every value of an R.V. to a probability is called a probability density function (pdf)
- Conditional Probability
    - **GET-EQU-SLIDE-19**
    - <code>P<sub>X|Y</sub>(X=x|Y=y) = [P<sub>X,Y</sub>(X=x,Y=y)] / [P<sub>y</sub>(Y=y)]</code>
- Product Rule
    - **GET-EQU-SLIDE-20**
- Marginalization
    - **GET-EQU-SLIDE-21**
- Conditioning
    - **GET-EQU-SLIDE-22**
- Bayes' Rule
    - **GET-EQU-SLIDE-23**
- Statistical Independence
    - **GET-EQU-SLIDE-25**
- Conditional Independence
    - **GET-EQU-SLIDE-27**
- IID random variables
    - independent AND
    - identically distributed (density functions are the same)
- Summarizing a PDF
    - Expectation and Variance
    - (statistics)
- Variance
    - the variance of a RV is <code>V(X) = E([X-E(X)]<sup>2</sup> = &Sigma;<sub>x</sub>(x-E(X))<sup>2</sup>p<sub>x</sub>(x)</code>

### Machine Learning Intro
- "Machine"
    - autonomous system
    - no (or limited) human intervention
- "Learning"
    - "... changes in the system that enable the system to do the same task more effectively the next time." - Herbert Simon
- Specification for a learning system
    - Given: Task goal, task examples *E*, performance measure *P*
    - Do: produce a **concept** that is good with respect to *P* on <u>all</u> examples of the task
        - measured by proxy on E
- 2 phases
    - learning
    - testing
- Learning methods
    - Batch / Offline
        - one learning phase, large set of examples
    - Online
        - one at a time
- **Inductive Generalization**
    - in all ML, need to reason from specific examples to a general case
    - Memorization != Learning
    - other kinds of reasoning
        - deduction
        - abduction (most probably reason)
- **Target Concept**
    - this is what we are trying to learn
    - typically, *P* will be a measure of difference between the learner's concept and the target concept, with respect to *E*
- **Hypothesis Space**
    - the space of general concepts in which the learning system will consider
    - no way to guarantee that the target concept is in the hypothesis space
        - also can't have a hypothesis space which covers all possible concepts
        - time complexity of a large hypothesis is doubly exponential, universe will die before an answer is computed
    - No "Tabula Rasa" Learning
        - Hypothesis space must be limited, else there will be no basis for learning and memoization will occur instead.
- **Inductive Bias**
    - set of assumptions used by a learning system to restrict its hypothesis space
    - more assumptions -> "stronger" bias
    - can quantify bias (will see later)
- **Supervised Learning**
    - Examples *E* are annotated with target concept's output by a teacher/oracle
    - learning system must find a concept that matches annotations (*P*)
- Example Representation
    - this choice affects reasoning
- Feature Vector Representation
    - examples are **attribute-value pairs**
    - number of attributes are fixed
    - can be written as a *n*-by-*m* matrix
- types of features
    - discrete, nominal
    - continuous
    - discrete, ordered
    - hierarchical
- feature space
    - can think of examples embedded in an *n* dimensional vector space

### Decision Tree Classifiers
- Mitchel's Ch 3
- 1980's
- very popular
- Tree
    - directed acyclic graph
    - internal nodes
        - attribute tests
    - leaf nodes
        - classifier labels
- decision tree induction
    - at each step, algorithm will choose an attribute to test
    - the chosen test will partition the examples into disjoint partitions
    - the algorithm will then recursively call itself on each partition until
        - a partition only has data from one class (pure node) OR
        - it runs out of attributes
- what attribute should we choose to test first?
    - The one that splits the test the most
    - entropy!
    - ```IG(X)``` = reduction in entropy of the class label if the data is partitioned using X
    - ```IG(X) = H(Y) - H(Y|X)``
- GainRatio
    - normalize IG with entropy of the attribute's distribution (computed from training data)
    - ```GR(X) = [IG(X)] / [H(X)]```
- Continuous Attributes
    - Consider boolean tests for attribute pairs where the splitting of one creates a border for the other?
- Issues
    - real data is noisy
- Over-fitting
    - wrong order can/will increase false positives / false negatives
    - Early Stopping
        - stopping the tree growth before we cross into over fitting (```IG(X)=0 for all X```)
        - easy to implement, not very effective
        - in some branches, you may be cutting off tot early or too late
    - greedy post-pruning
        - hold aside some training examples at start (validation set)
        - grow tree as usual on remainder
        - run a <i>greedy pruning</i> algorithm
        - for each node, construct a tree without that node
            - convert node to leaf by predicting majority class
            - delete subtree below
        - evaluate this tree on the <i>validation set</i>
        - find the node that improves performance the most over the un-pruned tree and remove it
        - repeat steps above until no node removal improves performance
        - if the data is bad you're kinda screwed
            - can use other algorithms to analyze the data
        - computational intensive
    - <b>decision trees are bad with smooth boundaries</b>
- Pros and Cons of Decision Trees
    pros | cons  
    :- | :-  
    doesn't require metric space representation | attributes with a lot of values (including continuous attributes)
    produces human-comprehensible concepts | attributes with complex interactions
    can produce concepts with range of complexity | partitioning strategy means easier to over-fit as depth increases
    easily extendable to various other scenarios |  
### evaluation methodology and metrics
- ideally lots of data to train on
- n-fold cross validation
    - training sets need to be as large as possible
    - for good estimates of future performance, test sets must be independent of the training set
    - partition data into folds
        - train on all but one fold, test on the remaining fold
- stratified cross validation
    - proportion of class labels will be equivalent between partitions and in relation to the data as a whole
    - generally more stable estimates and generally used