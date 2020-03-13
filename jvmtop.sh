#!/bin/sh
# jvmtop - java monitoring for the command-line 
# launch script
#
# author: Markus Kolb
# 

DIR=`cd "\`dirname "$0"\`" && pwd`

if [ -z "$JAVA_HOME" ] ; then
        JAVA_HOME=`readlink -f \`which java 2>/dev/null\` 2>/dev/null | \
        sed 's/\/bin\/java//'`
fi

"$JAVA_HOME"/bin/java $JAVA_OPTS  -cp "$DIR/jvmtop.jar" \
--add-opens jdk.management.agent/jdk.internal.agent=ALL-UNNAMED \
--add-opens java.rmi/sun.rmi.server=ALL-UNNAMED \
--add-opens java.rmi/sun.rmi.transport=ALL-UNNAMED \
--add-opens jdk.internal.jvmstat/sun.jvmstat.monitor=ALL-UNNAMED \
com.jvmtop.JvmTop "$@"
exit $?
