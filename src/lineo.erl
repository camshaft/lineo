-module(lineo).

-export([parse_transform/2]).

parse_transform(Forms, Options) ->
  {Forms2, _} = parse_trans:transform(fun do_transform/4, undefined, Forms, Options),
  Out = parse_trans:revert(Forms2),
  %% parse_trans:pp_src(Out, "transformed.rebind.erl"),
  Out.

do_transform(attribute, {attribute,_,file,{_,Line}} = Form, _Context, _) ->
  {Form, true, Line};
do_transform(_Type, Form, _Context, undefined) ->
  {Form, true, undefined};
do_transform(_Type, Form, _Context, Line) ->
  Reverted = erl_syntax:revert(Form),
  Form2 = case element(1, Reverted) of
    tree ->
      Reverted;
    _ ->
      setelement(2, erl_syntax:revert(Form), Line)
  end,
  {Form2, true, Line}.