-module(exercises).
-export([
	 concatenate/1,
	 create/1,
	 filter/2,
	 flatten/1,
	 print_integers/1,
	 print_even_integers/1,
	 reverse/1,
	 reverse_create/1,
	 sum/1,
	 sum/2
	]).

%% Exercise 3-1:  Evaluating Expressions

sum(0) ->
    0;
sum(N) when N>0 ->
    N+sum(N-1).

sum(N,N) ->
    N;
sum(N,M) when N =< M ->
    M+sum(N,M-1).

%% Exercise 3-2:  Creating Lists

create(N) ->
    create(1,N).

create(I,N) when I==N ->
    [I|[]];
create(I,N) when I=<N ->
    [I|create(I+1,N)].

reverse_create(1) ->
    [1];
reverse_create(N) when N>1 ->
    [N|reverse_create(N-1)].

%% Exercise 3-3: Side Effects 

%% Write a function that prints out the integers between 1 and
%% N. Hint: use io:format("Number:~p~n",[N]) . Write a function that
%% prints out the even integers between 1 and N. Hint: use guards.

print_integers([]) ->
    ok;
print_integers([X|Xs]) ->
    io:format("Number:~p~n",[X]),
    print_integers(Xs);
print_integers(N) -> 
    print_integers(create(N)).

print_even_integers([]) ->
    ok;
print_even_integers([X|Xs]) when X rem 2 == 0 ->
    io:format("Number:~p~n",[X]),
    print_even_integers(Xs);
print_even_integers([_X|Xs]) ->
    print_even_integers(Xs);
print_even_integers(N) -> 
    print_even_integers(create(N)).

%% Exercise 3-5: Manipulating Lists

filter([],_N) ->
    [];
filter([X|Xs],N) when X=<N ->
    [X|filter(Xs,N)];
filter([_X|Xs],N) ->
    filter(Xs,N).

reverse(List) ->
    reverse(List,[]).

reverse([],List) ->
    List;
reverse([X|Xs], List) ->
    reverse(Xs, [X|List]).

concatenate([]) ->
    [];
concatenate([[]|Rest]) ->
    concatenate(Rest);
concatenate([[X|Xs]|Rest]) ->
    [X|concatenate([Xs|Rest])].

flatten([]) ->
    [];
flatten([List|Rest]) ->
    concatenate([flatten(List),flatten(Rest)]);
flatten(X) ->
    [X].

   
    
