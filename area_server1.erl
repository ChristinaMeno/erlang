-module(area_server1).
-export([loop/0, rpc/2]).

rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        Response ->
            Response
    end.

loop() ->
    receive
    {From, {rectangle, Width, Ht}} ->
        From ! {self(), Width * Ht},
        loop();
        
    {From, {circle, R}} ->
        From ! {self(), R * R  * 3.14159},
        loop();
    {From, Other} ->
        From ! {self(), {error, Other}},
        loop()
    end.
