# Network Evaluation Scripts

This is a simple collection of scripts and notes supporting a simple network evaluation. These are associated with a series from my website, [Fixing My Home Network](https://robgillen.com/tags/homenetwork/).

## Setup

### Server

In order to run the evaluation tests, you need to have at least two machines. The first will be the _"server"_ and will run a copy of `iperf3` in server mode.  If you happen to be running a reasonably recent copy of Ubuntu, the [`setup_server.sh`](setup_server.sh) script should ensure you have what you need.

### Client

The _"client"_ is the machine that you will be moving around with, actually collecting the test results. This needs to be running `iperf3` as well as `speedtest`. You can install these directly, or if you happen to be running a recent copy of Ubuntu, the `setup_client.sh` script should get you ready.

## Local Network Evaluation

The first part of the tests involve transferring data across your network to evaluate the local performance

### Server

### Client
