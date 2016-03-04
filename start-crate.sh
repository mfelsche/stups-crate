#!/usr/bin/env bash
#
# simple script to hand over some explicit environment variables
# configured in the senza definition
# can be overridden by using $CRATE_JAVA_OPTS
/crate/bin/crate -Des.cluster.name="$CLUSTER_NAME" \
                 -Des.discovery.ec2.groups="$AWS_SECURITY_GROUP" \
                 -Des.discovery.ec2.availability_zones="$AVAILABILITY_ZONES" \
                 -Des.discovery.zen.minimum_master_nodes="$MINIMUM_MASTER_NODES" \
                 "$@" # provide additional options using docker CMD
