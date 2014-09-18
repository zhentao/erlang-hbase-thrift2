-module(hbase_thrift2_client).

-export([mutateRow/2, get/2, put/2]).

-include("hbase2_types.hrl").

%% this is just for demo only, so table name, column family, qualifier, row key and column values are all hard coded.
%% HBase thrift2 doesn't support create table yet, so the table "ups" is created via hbase shell before running this program.

%% performs multiple mutations atomically on a single row
mutateRow(Host, Port) -> 
	{ok, Client} = thrift_client_util:new(Host, Port, tHBaseService_thrift, []),
	{_C1, _Result} = thrift_client:call(Client, mutateRow, 
			["ups",  #tRowMutations{row="zhentao-key1", 
					mutations=[#tMutation{
									put=#tPut{row="zhentao-key1", 
									columnValues=[#tColumnValue{family="ui", qualifier="test", value="xyz"}]}},
							   #tMutation{
									put=#tPut{row="zhentao-key1", 
									columnValues=[#tColumnValue{family="ui", qualifier="test1", value="abc"}]}}
							  ]}
			]).

get(Host, Port) ->
	{ok, Client} = thrift_client_util:new(Host, Port, tHBaseService_thrift, []),
	thrift_client:call(Client, get, ["ups", #tGet{row="zhentao-key1"}]).

put(Host, Port) -> 
	{ok, Client} = thrift_client_util:new(Host, Port, tHBaseService_thrift, []),
	thrift_client:call(Client, put, ["ups", #tPut{row="zhentao-key1", 
												columnValues=[#tColumnValue{family="ui", qualifier="test", value="xyz1"},
															  #tColumnValue{family="ui", qualifier="test1", value="abc1"}]}
									
									]).
