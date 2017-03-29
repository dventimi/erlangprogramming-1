-module(db).
-export([
	 new/0,
	 destroy/1,
	 write/3,
	 delete/2,
	 read/2,
	 match/2
	]).

%% Exercise 3-4: Database Handling Using Lists 

%% Write a module db.erl that creates a database and is able to store,
%% retrieve, and delete elements in it. The destroy/1 function will
%% delete the database. Considering that Erlang has garbage
%% collection, you do not need to do anything. Had the db module
%% stored everything on file, however, you would delete the file. We
%% are including the destroy function to make the interface
%% consistent.  You may not use the lists library module, and you have
%% to implement all the recursive functions yourself.  

%% Hint: use lists and tuples as your main data structures.  When
%% testing your program, remember that Erlang variables are
%% single-assignment:

%% Interface: 
%% db:new() ⇒ Db. 
%% db:destroy(Db) ⇒ ok. 
%% db:write(Key, Element, Db) ⇒ NewDb. 
%% db:delete(Key, Db) ⇒ NewDb. 
%% db:read(Key, Db) ⇒{ok, Element} | {error, instance}. 
%% db:match(Element, Db) ⇒ [Key1, ..., KeyN].

new() ->
    [].

destroy(_Db) ->
    ok.

write(Key, Element, Db) ->
    [{Key,Element}|delete(Key, Db)].

read(_Key, []) ->
    {error, instance};
read(Key, [{Key,Value}|_Rest]) ->
    {ok, Value};
read(Key, [_Tuple|Rest]) ->
    read(Key, Rest).

delete(_Key, []) ->
    [];
delete(Key, [{Key,_Value}|Rest]) ->
    Rest;
delete(Key, [Tuple|Rest]) ->
    [Tuple|delete(Key,Rest)].

match(_Element, []) ->
    [];
match(Element, [{Key,Element}|Rest]) ->
    [Key|match(Element, Rest)];
match(Element, [_Tuple|Rest]) ->
    match(Element, Rest).
