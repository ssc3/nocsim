nocsim
======

Modification and evaluation of a Network on chip simulator. Implemented in C

   ECE 6101 Final Project
Archana Srinivasan
Vaibhav Desai
Shubhojit Chattopadhyay

         Evaluation of NOC different Routing Protocols

Introduction

A Network­on­Chip is an approach to designing the communication subsystems between different IP 
cores in a System­on­a­Chip (SOC). NoC applies networking theory and methods to on­chip 
communication and brings notable improvements over conventional bus and crossbar interconnections. 
NoC improves the scalability of SoCs, and the power efficiency of complex SoCs compared to other 
designs.
Traditionally, ICs have been designed with dedicated point­to­point connections, with one wire 
dedicated to each signal. For large designs, in particular, this has several limitations from a physical 
design viewpoint. The wires occupy much of the area of the chip, and in nanometer CMOS technology, 
interconnects dominate both performance and dynamic power dissipation, as signal propagation in 
wires across the chip requires multiple clock cycles.
NoC links can reduce the complexity of designing wires for predictable speed, power, noise, reliability, 
etc., thanks to their regular, well controlled structure. From a system design viewpoint, with the advent 
of multi­core processor systems, a network is a natural architectural choice. An NoC can provide 
separation between computation and communication, support modularity and IP reuse via standard 
interfaces, handle synchronization issues, serve as a platform for system test, and, hence, increase 
engineering productivity.
Although NoCs can borrow concepts and techniques from the well­established domain of computer 
networking, it is impractical to blindly reuse features of "classical" computer networks and symmetric 
multiprocessors. In particular, NoC switches should be small, energy­efficient, and fast. Neglecting 
these aspects along with proper, quantitative comparison was typical for early NoC research but 
nowadays they are considered in more detail. The routing algorithms should be implemented by simple 
logic, and the number of data buffers should be minimal. Network topology and properties may be 
application­specific.

Scope of Project:

A NoC is a set of interconnected switches, with IP cores connected to these switches. Four main 
components compose a switch: a router, to define a path between input and output switch ports; an 
arbiter, to grant access to a given port when multiple input requests arrive in parallel; buffers, to store 
intermediate data, and a flow control module to regulate the data transfer to the next switch. The goal 
of this work is to compare the performance of four routing algorithms for mesh based packet switching NoCs. The simulations will be performed in NOXIM, an NOC simulator designed at the University of 
Catania.
In this project, we aim to study different Routing Protocols and Selection Strategies present in the NOC 
Paradigm. Routing algorithms define the path taken by a packet between source and target switches. 
Routing algorithms can be classified according to the three different criteria: (i) where he routing 
decisions are taken; (ii) how a path is defined, and (iii) the path length. According to where routing 
decisions are taken, it is possible to classify the routing in source and distributed routing. Depending 
how a path is defined, routing can be classified as deterministic or adaptive. Regarding the path length 
criterion, routing can be minimal or nonminimal. In this report, we will be exploring six routing 
protocols:

XY (deterministic)
West first (partially adaptive)
North­last (partially adaptive)
Negative­first. (partially adaptive)
Odd­even(partially adaptive)
Fully­Adaptive




A selection strategy is used to choose the channel that will allow the packet to be routed to its 
destination along a path that is as free as possible of congested nodes. This is different from Routing 
protocols. Routing protocols define the overall path from the source to the destination node. In 
selection strategy, we define the manner in which each node decides the next hop (very similar to 
forwarding techniques in classical networks). In the project we will be analyzing 3 different selection 
strategies:

• Random
• Buffer­level
• Neighbours­on­path

Random Selection: 
• Outgoing path of a packet is selected based on probability calculation
• No network information is needed
• Route is typically not least cost nor minimum hop
• Network traffic not taken into consideration, may take a while to reach final destination

Buffer­level based Selection:
• Outgoing path of a packet is selected based on buffer­levels in the network
• Network information is used to obtain better performance than random selection.

Neighbors – on – path (nop) Selection:(a) Node (1, 1) has to choose between two possible candidates. 
(b) Nodes (2, 1) and (1, 2) receive information about buffer availability from their neighbors. 
(c) Node (1, 1) figure out which output channels would return routing function applied at nodes (1, 2) 
and (2, 1).
(d) Node (1, 1) exploit buffer availability of its Neighbors­ on­Path. 


NOXIM (NOC Simulator)
The Noxim simulator is developed using SystemC, a system description language based on C++, and it 
can be downloaded from SourceForge under GPL license terms.
Noxim has a command line interface for defining several parameters of a NoC. In particular the user 
can customize the network size, buffer size, packet size distribution, routing algorithm, selection 
strategy, packet injection rate, traffic time distribution, traffic pattern, hot­spot traffic distribution.
The simulator allows NoC evaluation in terms of throughput, delay and power consumption. This 
information is delivered to the user both in terms of average and per­communication results.
In detail, the user is allowed to collect different evaluation metrics including the total number of 
received packets/flits, global average throughput, max/min global delay, total energy consumption, 
per­communications delay/throughput/energy etc.
The Simulator has a very simple definition for various abstractions of the network, defined as structs 
and classes. For example, NoximCoord class takes in the X and Y co­ordinates of the mesh it is 
simulating. Also, the packet structure is defined as follows:
struct NoximPacket {
int src_id;
int dst_id;double timestamp; // SC timestamp at packet generation
int size;
int flit_left; // Number of remaining flits inside the packet
// Constructors
NoximPacket() { }
NoximPacket(const int s, const int d, const double ts, const int sz) {
make(s, d, ts, sz);
}
void make(const int s, const int d, const double ts, const int sz) {
src_id = s;
dst_id = d;
timestamp = ts;
size = sz;
flit_left = sz;
}
};
Similar C/C++ abstractions are used to represent flits and routes as well. Using this simulator, we have 
performed many analysis. The results may be found in FinalReport.pdf
