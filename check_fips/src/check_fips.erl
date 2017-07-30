-module(check_fips).

-export([main/1]).

%% escript Entry point
main(_Args) ->
    application:load({application, crypto, [{env, [{fips_mode, true}]}]}),
    crypto:start(),
    InfoFIPS = crypto:info_fips(),
    crypto:stop(),
    case InfoFIPS of
        enabled ->
            io:format("FIPS mode works~n"),
            erlang:halt(0);
        not_enabled ->
            io:format("[Error] FIPS mode not enabled"),
            erlang:halt(1);
        not_supported ->
            io:format("[Error] FIPS mode not supported"),
            erlang:halt(1)
    end.
