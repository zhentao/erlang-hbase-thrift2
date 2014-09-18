erlang-hbase-thrift2
====================

See blog [post](http://zhentao-li.blogspot.com/2014/09/hbase-thrift2-and-erlang-on-mac.html)

TODO: investigate -f option when start Thrift2.

#Use framed transport， This transport is required when using a non-blocking server. It sends data in frames, where each frame is preceded by length information. Node.js is no-blocking server, we must use "-f" option, or connection lost.
