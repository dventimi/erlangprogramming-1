-module(examples).
-compile(export_all).

next(Seq) ->
    fun() ->
	    [Seq|next(Seq+1)] end.


