# GrafanaMonitoring
## Overview and Installation
Grafana is a web-based application used for monitoring and analyzing data [Grafana Docs](https://grafana.com/docs/grafana/latest/). Grafana can be installed [here](https://grafana.com/docs/installation/rpm/).

Graphite is a database tool for storing time-series metrics.  [Graphite Docs](https://graphite.readthedocs.io/en/latest/). Graphite can be installed [here](https://www.vultr.com/docs/how-to-install-and-configure-graphite-on-centos-7) (make sure all steps are followed; for any problems installing graphite check [here](https://graphite.readthedocs.io/en/latest/install-source.html#installing-carbon-in-a-custom-location)).

Graphite consists of 2 important software components which we use:
 * Carbon: A service that listens for time-series data, which we can send via the command line, using pickle via python, or using our C++ Sensors class.

 * Whisper: A simple database library used for storing the data.


----
## Giving Data to Graphite
First, start Grafana and Carbon:

 * To start Grafana, run the following command:
```
sudo service grafana-server start
```

 * To start Carbon, run the following 4 commands
```
sudo systemctl start carbon-cache
sudo systemctl enable httpd
sudo systemctl start httpd
/opt/graphite/bin/carbon-cache.py start
```


Following are 2 methods of sending data to .wsp files, or Whisper database files, which Graphite uses to store the data that is ultimately sent to Grafana.

1. Using netcat directly from the terminal:
 * The command
```
echo “data.test 4 `date +%s`” | nc 127.0.0.1 2003
```
This command:
 * Creates a whisper datafile PATH_TO_WSPFILES/data/test.wsp if it doesn't already exist. On the machine which I first tested this on, this path was `/var/lib/carbon/whisper/data/test.wsp`
 * Stores the value 4 in this file.
 * Uses the port 2003 to store data related to netcat (Graphite uses port 2003 for netcat and port 2004 for pickle).

2. Using pickle via python:
On Siqi's machine I wrote a python script /home/bkilian/work/grafanaPlotting/apollo_read.py which effectively does the same thing, writing a value to a whisper file every 60 seconds, incrementing the value each time.

## Connecting Data to Grafana
Once the Grafana dashboard is set up, go to Grafana at port 3000 on the machine. Select Data Sources -> Add Data Source -> Graphite and name your data source. For URL, enter http://localhost:80. For Access, select Server mode. Now, you should be ready to Save & Test.

Go to the dashboard and add a query (or edit the existing ones).

For the data source on the query￼, click the edit button (the little pencil) and add the path of your .wsp file within the "whisper" folder. In our example above, /var/lib/carbon/whisper/data/test.wsp, we would enter data.test in this field. This should render the data from that whisper file onto the graph.
