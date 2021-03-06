
# JBoss, Home of Professional Open Source
# Copyright 2016, Red Hat, Inc., and others contributors as indicated
# by the @authors tag. All rights reserved.
# See the copyright.txt in the distribution for a
# full listing of individual contributors.
# This copyrighted material is made available to anyone wishing to use,
# modify, copy, or redistribute it subject to the terms and conditions
# of the GNU Lesser General Public License, v. 2.1.
# This program is distributed in the hope that it will be useful, but WITHOUT A
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
# You should have received a copy of the GNU Lesser General Public License,
# v.2.1 along with this distribution; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA  02110-1301, USA.

# ALLOW JOBS TO BE BACKGROUNDED
set -m

echo "Running recovery quickstart"

# To run an example use the maven java exec pluging. For example to run the second recovery example
mvn compile exec:java -Dexec.mainClass=org.jboss.narayana.jta.quickstarts.recovery.DummyRecovery -Dexec.args="-f"
# We expect this to fail
#if [ "$?" != "0" ]; then
#	exit -1
#fi
mvn compile exec:java -Dexec.mainClass=org.jboss.narayana.jta.quickstarts.recovery.DummyRecovery -Dexec.args="-r"
if [ "$?" != "0" ]; then
    echo "Dummy example failed"
	exit -1
else
    echo "Dummy example succeeded"
fi

# And to run the JMS recovery example:
mvn compile exec:java -Dexec.mainClass=org.jboss.narayana.jta.quickstarts.recovery.JmsRecovery -Dexec.args="-f"
# We expect this to fail
#if [ "$?" != "0" ]; then
#	exit -1
#fi
mvn compile exec:java -Dexec.mainClass=org.jboss.narayana.jta.quickstarts.recovery.JmsRecovery -Dexec.args="-r"
if [ "$?" != "0" ]; then
	exit -1
    echo "JMS example failed"
else
    echo "JMS example succeeded"
fi

echo "All recovery examples succeeded"
