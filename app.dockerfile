FROM jboss/wildfly:9.0.2.Final

ADD updates /opt/jboss/wildfly/updates/

EXPOSE 9991 9994 7009 7080 7443 13628 3729 14712 14713 25

CMD ["/opt/jboss/wildfly/updates/execute.sh"]

