minimum([X], X, []).
minimum([X | List], X, List) :- minimum(List, Y, ListRemoved), X < Y.
minimum([X | List], Y, [X | ListRemoved]) :- minimum(List, Y, ListRemoved), X > Y.
selectionsort([], []).
selectionsort(List, [Head | Remainder]) :- minimum(List, Head, ListRemoved), selectionsort(ListRemoved, Remainder).

merge([], List2, List2).
merge(List1, [], List1).
merge([Head1 | Tail1], [Head2 | Tail2], [Head1 | Tail3]) :- merge(Tail1, [Head2 | Tail2], Tail3), Head1 < Head2. 
merge([Head1 | Tail1], [Head2 | Tail2], [Head2 | Tail3]) :- merge(Tail2, [Head1 | Tail1], Tail3), Head2 < Head1.
mergesort([], []).
mergesort([X], [X]).
mergesort(Unsorted, Sorted) :- halve(Unsorted, Left, Right),  mergesort(Left, LeftSorted), mergesort(Right, RightSorted), merge(LeftSorted, RightSorted, Sorted). 
halve(List, Left, Right) :- length(List, Len), Mid is truncate(Len / 2), split_at(List, Left, Right, Mid).
split_at(List, Left, List, 0).
split_at([X | List], [X | Left], Right, Index) :- NewIndex is Index - 1, split_at(List, Left, Right, NewIndex).

