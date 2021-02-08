# <b>Machine Learning</b>

## <b>Table of Contents</b>
Item | Link
:-: | :-:
Introduction | [Link](#Introduction)
Review of Prob and Stats | [link](#Review-of-Probability-and-Statists)
Machine Learning Intro | [link](#Machine-Learning-Intro)
Decision Tree Classifiers | [link](#Decision-Tree-Classifiers)
Optimization Review | [link](#Optimization-Review)
Artificial Neural Networks | [link](#Artificial-Neural-Networks)
Neural Networks and Deep Learning | [link](#Neural-Networks-and-Deep-Learning)

### <b>Terms and Definitions</b>
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
- Contingency Table
    . | Positive | Negative
    :-: | :-: | :-:
    Positive | True Positive (TP) | False Positive (FP) (Type 1 err)
    Negative | False Negatives (FN) (Type 2 err) | True Negatives (TN)
    - ```Accuracy = (TP + TN) / (TP + FP + FN + TN)```
    - does not account for
        - skewed class distributions
        - differential misclassification costs
        - confidence estimates from learning algorithms
- Weighted/Balanced Accuracy
    - Corrects for skewed class distributions
    - GET_EQU
- better metrics ignore true negatives, focus on the other three
- precision
    - ```TP / (TP + FP)```
- recall / TP rate / sensitivity
    - ```TP / (TP + FN) = TP / Allpos```
- specificity / TN rate
    - ```TN / (TN + FP) = TN / Allneg```
- as such: ```WAcc = 0.5(Sensitivity + Specificity)```
- F<sub>1</sub> score
    - <code>F<sub>1</sub> = 2 / [(1 / Precision) + (1 / Recall)]</code>
    - "harmonic mean"???
    - specific index of F<sub>&beta;</sub> metric
- beyond point estimates
    - everything above is a "point estimate"
    - can compute variance from sample
    - important to show stability of solutions
- learning curves
    - Metric (eg: accuracy) vs Training Sample Size (y vs x respectively)
    - shows "how many samples does this algorithm need to be a viable solution"
- metrics with confidence measures
    - many algos also provide confidence values
    - in this case, can plot Precision-Recall (PR) and Receiver Operating Characteristic (ROC)
    - ROC will misrepresent when the proportion of examples is extremely skewed

<i>(9/17/2020)</i>

### optimization review
- (CSDS 447, MATH 427, or MATH 433)
- Find the extreme values of a function (aka "objective function")
    - sometimes interested in the arguments themselves, not the value (argmax, argmin)
- types of optimization problems
    - discrete vs continuous
    - unconstrained vs constrained
    - this class will focus continuous, constrained & unconstrained
- we will only be thinking about minimization function, but they work the same for maximization optimization

#### unconstrained optimization
- <u><b>bold x means a set of variables, not single</u></b>
- Jacobian
    - J = df / dxi = 0
    - <code>J = (&delta;f / &delta;x<sub>i</sub>) = 0</code>
- Hessian
    - <code>H = (&delta;<sup>2</sup>f / &delta;<sub><b>x</b><sub>i</sub></sub>&delta;<sub><b>x</b><sub>j</sub></sub>) > 0</code>
- both of these equations constitute a system of non-linear equations (which must be set equal to zero)
- gradient ascent/descent
    - <code><b>x</b><sub>new</sub> = <b>x</b><sub>old</sub> - &alpha;&nabla;f<sub><b>x</b></sub>(<b>x</b>)</code>
    - <code>&alpha;</codE> is the step size
    - function gradient evaluated at <code>x<sub>old</sub></code>
    - slow convergence near the end, fast away from it
- Newton-Raphson Method
    - GET_EQU_SLIDE_10
    - first equ is a tailor series
    - fast convergence near solution, slow away from it
- quasi-newton methods
    - NR is expensive
        - <code>O(n<sup>2</sup>)</code>
    - quasi-newton methods exist to approximate NR
- characterizing solutions
    - global min/max
    - local min/max
    - plateau
- note: no algorithm guarantees finding global optimum of an arbitrary function
    - however, there is a class of functions (convex?) where we can guarantee discovery of optimization
- convex sets
    - a set <b>C</b> is convex if for any <b>x</b><sub>1</sub>, <b>x</b><sub>2</sub> in <b>C</b>, <code>&lambda;<b>x</b><sub>1</sub> + (1 - &lambda;)<b>x</b><sub>2</sub></code> is also in <b>C</b>
- convex function
    - epi graph
        - for all points <code>{x, y | y >= f(x)}</code>
        - graph is convex if its epigraph is a convex set
    - for a point
        - <code>(&lambda;<b>x</b><sub>1</sub> + (1 - &lambda;)<b>x</b><sub>2</sub>, &lambda;f(<b>x</b><sub>1</sub>) + (1 - &lambda;)f(<b>x</b><sub>2</sub>))</code>
    - Jensen's inequality
        - <code>[&lambda;<b>x</b><sub>1</sub> + (1 - &lambda;)<b>x</b><sub>2</sub>] <= [&lambda;f(<b>x</b><sub>1</sub>) + (1 - &lambda;)f(<b>x</b><sub>2</sub>)]</code>
    - for a convex function, every local optimum is also a global optimum

#### constrained optimization
- linear programming
    - a special case of constrained optimization where the objective and the constraints are all linear functions
    - can cast from linear to matrix notation
        - <i>f in chat for my 0 lin-alg classes i've taken</i>
    - creates geometry bound by planes
        - its a convex set!
- simplex algorithm
    - walk around the polyhedron
    - from any feasible vertex, walk along the edges of the polyhedron following the vertices
    - once you find the local minimum, we know that it's the global minium b/c it's a convex set
    - simple and easy to implement
    - exponentially many vertices for <i>n</i> constraints, worst case runtime is exponential
        - on average distributions have been shown to by polynomial
    - other algorithms exist, such as "interior points methods", which have polynomial bounds*
        - *more generalized than Turing computation b/c turing's doesn't deal with real number
- duality in linear programming
    - for any LP, we can derive a "dual" LP
    - GET_EQU_22
        - u = unknown
        - \# of u's = to \# of constraints
- primal and dual LPs
    - the primal has a solution iff the dual has one
- Karush-Kuhn-Tucker conditions
    - @ optimal solution, <b>x</b> and <b>u</b> are feasible and the objective function <code>c<sup>T</sup><b>x</b></code> and <code>b<sup>T</sup><b>u</b></code> are equal
        - other stuff to come later in the class

<i>(9/22/2020)</i>

### Artificial Neural Networks
- Perceptron / Linear Threshold Unit
    - Rosenblatt (1957)
- Loss function
    -  difference betwen our current estimates of y (y hat) and the tru y (which is known) over all training, with respect to w & &sigma;
    - want to minimize this function

<i>(9/29/2020)</i>

- Prof. Ray forgot his notes in his office (couldn't get em b/c of the presidential debate), skipping ahead then doing the actual lecture later
- looking at algo's that explicitly estimate probabilities of class membership
    - ```P(X, Y)```
    - ```P(Y | X)```
    - ```P(X | Y)``` ("class conditional distribution")
- Bayesian Decision Theory
    - optimal thing to do is to choose hypothesis to minimize <i>expected risk</i>
    - GET_EQU_SLIDE_5
- Why?
    - naturally produce "confidence estimates"
    - naturally incorporate "prior knowledge"
    - can also give tools to analyze some algo'sd
- probabilistic classification
    - p(x, y)
- discriminative classification
    - p(y|x)
- generative approaches
    - remember product rule f/ probabilities
        - <code>p(x,y) = p(x|y)p(y)</code>
    - choose a class, then choose  an instance, then "generate" the observed data.
    - handles missing values
    - "more work" than necessary
- discriminative approaches
    - only interested in <code>p(y|x)</code>
    - no way to recover / "generate" the data
    - robust to modeling errors
    - usually more accurate than generative, but some evidence suggests that convergence is slower
- Naive Bayes
    - simplest generative classifier for discrete data
    - very large table if we were to notate the PDF
    - Naive Bayes assumption
        - features are independent from class labels
        - not normally the actually case, but the results still work pretty good
    - GET_EQU_SLIDE_11
    - linear runtime with optimization instead of exponential (<code>2<sup>n+1</sup></code> => <code>2n+1</code>)
- posterior probability
    - GET_EQU_SLIDE_20
    - probability of a hypothesis given data
- MAP Hypothesis
    - GET_EQU_SLIDE_21
- maximum likelihood (ML)
    - <code>h<sub>ML</sub>=argmax<sub>(h &epsilon; H)</sub>Pr(D|h)</code>
- <i>remember to smooth your estimates so you don't get cascading 0's</i>

<i>10/1/2020</i>

### Neural Networks and Deep Learning
- be aware of vanishing gradients problem f/ back propagation
- Network as a Computation Graph
    - each layer can be viewed as a matrix/vector operation on the previous layer
    - GET_EQU_SLIDE_6
- interpretation of hidden units
    - key problem in ML: how to auto design representations that enable effective learning
- deep learning
    - try to learn a good representations at different levels of abstraction
    - generating good features
        - allow long computational paths
        - aggregate information across many different parts of the input
    - problem
        - as the netwoek grows, the number of parameters scale quadratically with layer size
        - ex: 256x256 image
            - equal number of hidden units => <code>(256)<sup>4</sup> = 4e9</code>
        - can structure to limit
            - locality
            - invariance
    - locality
        - let each hidden unit only look at a small part of the input
    - invariance
        - let the weights connecting a local region to a hidden unit be the same for every hidden unit
- convolutional neural networks
    - Introduce a <b>kernel</b> <i>k</i> that is a set of weights replicated across multiple local regions
        - NOTE: kernel is an overloaded term in AI, watch out
    - the operation of applying the kernel to the input is called convolution
- Tensor
    - each convolutional kernel can be considered one "feature detector"
    - Typically, will have many kernels
    - to maintain locality and invariance, instead of concatenating these kernels we stack them along a new dimension
    - if the input has 2+ dimensions, then this results in a multidimensional matrix at each layer
        - aka "tensors"
        - <i>tensor was appropriated from Math by us AI folk</i>
- pooling
    - a pooling layer aggregates information from an adjacent layer
    - avg pooling: <code>k=(1/l, 1/l, ... 1/l)</code>
    - max pooling: computes max val of <i>l</i> something
- residual networks
    - key problem in ANN's is vanishing gradients
        - b/c each layer learns a completely new representation from the previous layer
        - errors can the cascade forward in the network and poison the response
    - instead, each layer can perturb the learned representation of the previous layer
        - allows building much deeper structure robustly
        - prevents catastrophic failure do to a single error
    - GET_EQU_SLIDE 21

<i>10/6/2020</i>

- over fitting in ANN's
    - idea: weight decay
        - GET_EQ_SLIDE_5
    - careful, if we force the weights to too small the sigmoid will act as a linear function because it will be too bound
        - GET_FIG_SLIDE_6
    - dropout
        - each backprop step, randomly sample a set of hidden units to <i>leave out of the update</i>
        - unknown why exactly this works

    - <i><b>missed a bunch of stuff cause i was in the restroom, fill it in ya fool</b></i>

    - 