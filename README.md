# CMP305-introduction-Verilog
introduction to Verilog in Integrated Circuit Design And VLSI technology


<div align="center">
  
# THIS IS A NOTES FOR MYSELF TAKEN FROM THIS VIDEO  [LINK_OF_THE_VIDEO](https://www.youtube.com/watch?v=PJGvZSlsLKs)
<span style="display:block;text-align:center">

# Verilog language 
</div>

- Standard Hardware description Language (HDL).
- used to describe a digital system.
<div align="center">

## Behavior Modeling
</div>
- A Component is described by its I/O response.
- only the functionality of the circuit no structure.
<div align="center">

## Structural Modeling 
</div>
- A component is described by interconnecting Lower-Level Component/primitives 
- Both Functionality and structure of the circuit 
<div align="center">

## Register Transfer Level (RTL)
</div>
- A type of behavioral modeling for the purpose of synthesis
### Synthesis : Translating HDL to a circuit and then optimizing the represented circuit
<div align="center">

# Module declaration 
</div>
1) begins with keyword module 
2) provides module name 
3) include port list

```
module multi (
        // port_list types
        1- input  => input port 
        2- output => output port 
        3- inout  => bidirectional port 
    
);
    // port declaration 
    "<port_type> <port_name>;"
    
    // data type declatation
        => Net Data type 
            -> represents physical interconnect between structures 
        -- wire 
        -- tri 
        -- supply0
           supply1
        example
        wire [7:0] out;
        tri enable;
        
        => Variable Data type 
            -> represent element to store data temporarily 
        -- reg 
        -- integer
        -- real
        -- time
        -- realtimer

    // instantiation format 
        <component_name> #<delay> <instance_name> (port_list);
        #<delay> -> delay through component
        
    // circuit functionality  
    // timing specifications 

endmodule //multi
```
<div align="center">

# Connecting Module Instantiation Ports 
</div>

#### Two Methods to define ports connections 
## 1) By Ordered list 
- port connections defined by the order of the port list in the lower-level module declaration 
```
module half_adder ( co , sum , a , b ); 
```
```
half_adder u1 ( c1 , s1 , a , b );
```
- the order dose matter 
co -> c1 | sum -> S1 | a -> a | b -> b

## 2) By Name *(RECOMMENDED METHOD)*
- Port connections defined by name 
- order does not matter 

<div align="center">

# Parameters
</div>

- Value assigned to a symbolic name 
- must resolve to a constant at compile time 
- can be overwritten at compile time 
- "localparam" -> same as parameters but cannot be overwritten

ex
```
parameters size = 8; // can be overwritten 
localparam outsize = 16; //can't be overwritten
```

<div align="center">

# Numbers
</div>

1) Sized -> 3'b010 = 3bits wide binary number
    - 3 indicated the size of number 

2) Unsized -> 123 = 32bit decimal number 

## Base Formats

- Decimal (d || D ) => 16'd255
- Hexadecimal (h || H) => 8'h9a
- Binary (b || B) => b1010
- Octal (o || O) => o21
- Signed (s || S) 16'shFA
