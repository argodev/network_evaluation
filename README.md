# Network Evaluation Scripts

This is a simple collection of scripts and notes supporting a simple network evaluation. These are associated with a series from my website, [Fixing My Home Network](https://robgillen.com/tags/homenetwork/).

## Setup

### Server

In order to run the evaluation tests, you need to have at least two machines. The first will be the _"server"_ and will run a copy of `iperf3` in server mode.  If you happen to be running a reasonably recent copy of Ubuntu, the [`setup_server.sh`](setup_server.sh) script should ensure you have what you need.

### Client

The _"client"_ is the machine that you will be moving around with, actually collecting the test results. This needs to be running `iperf3` as well as `speedtest`. You can install these directly, or if you happen to be running a recent copy of Ubuntu, the [`setup_client.sh`](setup_client.sh) script should get you ready.

## Local Network Evaluation

The first part of the tests involve transferring data across your network to evaluate the local performance

### Server

Running the server for this test is fairly straight forward. You simply need to run `iperf3 -s` and let it sit. If it is helpful, the [`local_server.sh]`(local_server.sh) script will run this for you.

> **NOTE:** If you are running a firewall on your server (`iptables` or `ufw` or similar), you must ensure that port `5201/tcp` is open for incoming traffic.

### Client

Running the client is similarly easy, but requires a few steps.

1. You need to make a copy of `client_vars.sample` and save it as `client_vars.sh`.
1. You should edit this new file and customize the properties in it to match your enviornment (iperf3 server, number of iterations, etc.)
1. Then, you should be able to run `./local_client.sh` and it will run through the test loops.
   1. For each loop, it will collect data in both directions (client --> server, server --> client)
   1. Output files (`*.json`) will be stored in a directory named based on the current date: `./data/YYMMDD/`

