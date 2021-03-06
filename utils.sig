sig utils.

% I/O PREDICATES

% [nl] prints a newline character to standard output.
type nl o.

% [println +S] prints string [S] to standard output followed by a
% newline character.
type println string -> o.

% [write +A] prints an arbitrary value to standard output.
type write A -> o.

% [writeln +A] prints an arbitrary value to standard output, appending
% a newline character.
type writeln A -> o.


% LIST PREDICATES

% [length +L N] returns length of list [L] in N.
type length list A -> int -> o.

% [nth +L +N X] returns [N]th element of list [L] in [X] if it exists.
type nth list A -> int -> A -> o.

% [rev L1 L2] list [L1] is the reverse of list [L2].
type rev list A -> list A -> o.

% [append L1 L2 L3] list [L1] appended to list [L2] yields list [L3].
type append list A -> list A -> list A -> o.

% [flatten L R] flattens list of lists [L] to list [R].
type flatten list (list A) -> list A -> o.

% [rev_append L1 L2 L3] list [L1] reversed and appended to list [L2]
% yields list [L3].
type rev_append list A -> list A -> list A -> o.

% [mapP +P +L R] maps predicate [P] over list [L] returning result in [R].
type mapP (A -> B -> o) -> list A -> list B -> o.

% [rev_mapP +P +L R] maps predicate [P] over list [L] returning the
% reversed result in [R].
type rev_mapP (A -> B -> o) -> list A -> list B -> o.

% [fold_leftP +P A +L R] accumulates a value [R] left-associatively
% walking over list [L], starting with accumulator [A] and using predicate
% [P].
type fold_leftP (A -> B -> A -> o) -> A -> list B -> A -> o.

% [fold_rightP +P +L A R] accumulates a value [R] right-associatively
% walking over list [L], starting with accumulator [A] and using predicate
% [P].
type fold_rightP (B -> A -> B -> o) -> list A -> B -> B -> o.

% [forall +P +L] checks whether predicate [P] holds for all elements of
% list [L].  Can also be used to iterate over a list.
type forall (A -> o) -> list A -> o.

% [exists +P +L] checks whether predicate [P] holds for at least one
% element of list [L].
type exists (A -> o) -> list A -> o.

% [mem +X +L] checks whether [X] is contained in list [L]. Does not
% backtrack to further solutions! (efficient).
type mem A -> list A -> o.

% [member X +L] checks whether [X] is contained in list [L]. Backtracks
% for further solutions!
type member A -> list A -> o.

% [find +P +L X] tries to find an element [X] of list [L] that satisfies
% predicate [P]. Backtracks for more solutions.
type find (A -> o) -> list A -> A -> o.

% [filter +P +L R] filters out all elements (in order) of list [L]
% that satisfy predicate [P], returning the result in [R].
type filter (A -> o) -> list A -> list A -> o.

% [partition +P +L Yes No] partitions list [L] into lists of elements
% that satisfy predicate [P] ([Yes]) or don't ([No]).
type partition (A -> o) -> list A -> list A -> list A -> o.

% [qsort +P +L R] sorts list [L] using order relation [P], returning
% the result in [R]. Uses the quicksort algorithm.
type qsort (A -> A -> o) -> list A -> list A -> o.


% GENERAL PREDICATES ON TERMS

% [contains T ST] checks whether some term [T] contains a subterm [ST].
type contains A -> B -> o.

% [elim_sub_term T ST F] eliminates subterm [ST] from term [T] using
% substitution function [F].
type elim_sub_term A -> B -> (B -> A) -> o.

% [elim_sub_patterns T PGen F] eliminates subpatterns generated by
% pattern generator [PGen] from term [T] using substitution function [F].
type elim_sub_patterns A -> (B -> o) -> (B -> A) -> o.
