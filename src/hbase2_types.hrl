-ifndef(_hbase2_types_included).
-define(_hbase2_types_included, yeah).

-define(hbase2_TDeleteType_DELETE_COLUMN, 0).
-define(hbase2_TDeleteType_DELETE_COLUMNS, 1).

-define(hbase2_TDurability_SKIP_WAL, 1).
-define(hbase2_TDurability_ASYNC_WAL, 2).
-define(hbase2_TDurability_SYNC_WAL, 3).
-define(hbase2_TDurability_FSYNC_WAL, 4).

%% struct tTimeRange

-record(tTimeRange, {minStamp :: integer(),
                     maxStamp :: integer()}).

%% struct tColumn

-record(tColumn, {family :: string() | binary(),
                  qualifier :: string() | binary(),
                  timestamp :: integer()}).

%% struct tColumnValue

-record(tColumnValue, {family :: string() | binary(),
                       qualifier :: string() | binary(),
                       value :: string() | binary(),
                       timestamp :: integer(),
                       tags :: string() | binary()}).

%% struct tColumnIncrement

-record(tColumnIncrement, {family :: string() | binary(),
                           qualifier :: string() | binary(),
                           amount = 1 :: integer()}).

%% struct tResult

-record(tResult, {row :: string() | binary(),
                  columnValues = [] :: list()}).

%% struct tAuthorization

-record(tAuthorization, {labels :: list()}).

%% struct tCellVisibility

-record(tCellVisibility, {expression :: string() | binary()}).

%% struct tGet

-record(tGet, {row :: string() | binary(),
               columns :: list(),
               timestamp :: integer(),
               timeRange :: #tTimeRange{},
               maxVersions :: integer(),
               filterString :: string() | binary(),
               attributes :: dict(),
               authorizations :: #tAuthorization{}}).

%% struct tPut

-record(tPut, {row :: string() | binary(),
               columnValues = [] :: list(),
               timestamp :: integer(),
               attributes :: dict(),
               durability :: integer(),
               cellVisibility :: #tCellVisibility{}}).

%% struct tDelete

-record(tDelete, {row :: string() | binary(),
                  columns :: list(),
                  timestamp :: integer(),
                  deleteType = 1 :: integer(),
                  attributes :: dict(),
                  durability :: integer()}).

%% struct tIncrement

-record(tIncrement, {row :: string() | binary(),
                     columns = [] :: list(),
                     attributes :: dict(),
                     durability :: integer(),
                     cellVisibility :: #tCellVisibility{}}).

%% struct tAppend

-record(tAppend, {row :: string() | binary(),
                  columns = [] :: list(),
                  attributes :: dict(),
                  durability :: integer(),
                  cellVisibility :: #tCellVisibility{}}).

%% struct tScan

-record(tScan, {startRow :: string() | binary(),
                stopRow :: string() | binary(),
                columns :: list(),
                caching :: integer(),
                maxVersions = 1 :: integer(),
                timeRange :: #tTimeRange{},
                filterString :: string() | binary(),
                batchSize :: integer(),
                attributes :: dict(),
                authorizations :: #tAuthorization{},
                reversed :: boolean()}).

%% struct tMutation

-record(tMutation, {put :: #tPut{},
                    deleteSingle :: #tDelete{}}).

%% struct tRowMutations

-record(tRowMutations, {row :: string() | binary(),
                        mutations = [] :: list()}).

%% struct tIOError

-record(tIOError, {message :: string() | binary()}).

%% struct tIllegalArgument

-record(tIllegalArgument, {message :: string() | binary()}).

-endif.
