#!/bin/bash

JBOSS_HOME=/opt/jboss/wildfly
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh
JBOSS_MODE=${1:-"standalone"}
JBOSS_CONFIG=${2:-"$JBOSS_MODE.xml"}

# Move all your application config updates to appropriate jboss folders
cp -vr /opt/jboss/wildfly/updates/modules/mysql $JBOSS_HOME/modules/system/layers/base/com
cp -vr /opt/jboss/wildfly/updates/modules/postgresql $JBOSS_HOME/modules/system/layers/base/org
cp -vr /opt/jboss/wildfly/updates/standalone.xml $JBOSS_HOME/standalone/configuration/standalone.xml

# Deploy the war
cp -vr /opt/jboss/wildfly/updates/deployments/app.war $JBOSS_HOME/$JBOSS_MODE/deployments/app.war

echo "=> Starting WildFly"
$JBOSS_HOME/bin/$JBOSS_MODE.sh -b 0.0.0.0 -c $JBOSS_CONFIG

