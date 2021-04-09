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
<hr>
<div align="center">

# Numbers
</div>

1) Sized -> 3'b010 = 3bits wide binary number
    - 3 indicated the size of number 

2) Unsized -> 123 = 32bit decimal number 

### Base Formats

- Decimal (d || D ) => 16'd255
- Hexadecimal (h || H) => 8'h9a
- Binary (b || B) => b1010
- Octal (o || O) => o21
- Signed (s || S) 16'shFA

### Negative numbers 

- legal ==> -8'd3
- illegal ==> 4'd-2 ERROR

### Special Number Characters

- underlined ( _ ) used for readability 
    - 32'h21_65_bc_fe
- X or x unknown value 
    - 12'h12x
- z or Z high impedance value 
    - 1'bz 
<hr>
<div align="center">

# Arithmetic operators  
</div>
<pre>
ain =5 ; bin =10 ; cin =2'b01; din =2'b0z
1) "+" => Add      |  bin+cin => 11
2) "-" => Subtract |  bin-cin => 9
3) "*" => Multiply |  ain*bin => 50
4) "/" => Divide   |  bin/ain => 2
5) "%" => Modulus  |  bin%ain => 0
6) "**"=> Exponent |  ain**2  => 25
</pre>
<div align="center">

# Bitwise operators  
</div>
<pre>
1) "~" =>  | invert each bit  
2) "&" =>  | And 
3) "|" =>  | OR
4) "^" =>  | XOR 
5) "^~" => | XNOR
</pre>
<div align="center">

# Reduction operators  
</div>
<pre>
1) "&" =>          | AND  
2) "~&" =>         | NAND 
3) "|" =>          | OR
4) "~|" =>         | NOR 
5) "^" =>          | XOR
6) "~^" or "^~" => | XNOR
</pre>
<div align="center">

# Relational operators  
</div>
<pre>
1) ">" =>  | Grater than  
2) "<" =>  | Less than
3) ">=" => | Greater than or equal
4) "<=" => | Less than or equal
</pre>
<div align="center">

# Equality operators  
</div>
<pre>
1) "==" =>  | Equality
2) "!=" =>  | inEquality
3) "===" => | Case Equality
4) "!==" => | Case inEquality
</pre>
<div align="center">

# Logical operators  
</div>
<pre>
1) "!" =>  | Not
2) "&&" => | AND 
3) "||" => | OR
</pre>
<div align="center">

# Shift operators  
</div>
<pre>
1) "<<" =>  | logical shift left
2) ">>" =>  | logical shift right
3) "<<<" => | Arithmetic shift left
3) ">>>" => | Arithmetic shift right
</pre>
<div align="center">

# Miscellaneous operators  
</div>
<pre>
1) "?:" =>   | Conditional test
2) "{}" =>   | Concatenate
3) "{{}}" => | Replicate
</pre>
<hr>
<div align="center">

# Making Assignments
</div>

## 1) Continuous Assignment Statement
```
wire[15:0] adder_out =mult_out + out;
```
equivalent to 
```
wire[15:0] adder_out;
assign adder_out = mult_out + out;
```
when the RHS changes , expression is evaluated and LHS net is updated immediately.

## 2) Procedural Assignment Blocks
* Initial => used to initialized behavioral statements for simulation 
    * start at time 0 
    * execute only once during simulation then does not execute again 
    * statements inside execute sequentially 
    * Keywords begin and end must be used if block contains more than one statement
    * Examples 
        * Initialization 
        * Monitoring 
        * any functionality that needs to be turned on just once 
* Always => used to describe te circuit functionality using behavioral statements
    * Blocks execute concurrently 
    * start at time 0 
    * and continuously in a looping fashion 
    * Behavioral statements inside an initial block execute sequentially
    * Examples 
        * Modeling a digital circuit
        * any Process or functionality needs to be executed continuously 

- each one represent a separate process 
- each consists of behavioral statements

Example on Always and initial statements 

```
module clk_gen
    #(parameters period =50)
(
    output reg clk
);
    initial clk = 1'b0;

    always 
        #(period/2)clk =~clk;
    
    initial #100 $finish;

endmodule
```

## Two Types of Procedural Assignments 

1) Blocking Assignments = 
    - executed in the order they are specified in the seq. way 

Example a=1 b=2
```
initial 
    begin 
        a = #5 b ;
        c = #10 a;
    end
``` 

<pre>
|
|   a=b=2       c=a=2
|_____|_____|_____|_____|_
0     5     10    15    20
</pre>

2) Nonblocking Assignments <=
    - allow scheduling of assignments without blocking execution of the statements that follow in a seq block

Example a=1 b=2
```
initial 
    begin 
        a <= #5 b ;
        c <= #10 a;
    end
```
<pre>
|
|   a=b=2  c=a=1
|_____|_____|_____|_____|_
0     5     10    15    20
</pre>

- = for combinatorial logic
- <= for sequential logic 
<hr>
<div align="center">

# Tow types of RTL processes
</div>

1) Combinatorial Processes
-   sensitive to all inputs used in the Combinatorial logic

```
always @(a,b,sel)
always @* 
```
2) Clocked Processes
-   sensitive to clock or/and control signals 

```
always @(Posedge clk , negedge clr_n)
```
<hr>

<div align="center">

# Behavioral Statements
</div>

1) if-else 
```
always @* begin
if(s)
    q=a;
else if(sb)
    q=b;
else
    q=c;
end
```
2) case
 ```
always @* begin
case(s)
    2'b00 : q = a;
    2'b01 : q = b;
    2'b10 : q = c;
    default : q =d;
endcase
end
```
3) Loop
    - forever loop 
    ```
    initial begin 
        clk=0
        forever #25 clk =~clk;
    end
    ```
    - repeat loopp
    ```
    if(rotate ==1)
        repeat (8) begin
            tmp= data[15];
            data={data<< 1 ,tmp};
        end
    ```
    - while loop
    ```
    initial begin 
        count =0;
        while (count < 101) begin 
            count = count+1;
        end
    end
    ```
    - for loop 
    ```
    integer i;
    always @(inp, cnt) begin 
        result[7:4]=0;
        result[3:0]=inp;
        if(cnt==1) begin
            for(i=4; i<= 7 ; i=i+1) begin
                result[i]=result[i-4];
            end
            result[3:0]=0;
        end
    end
    ```
<hr>

<div align="center">

# Function and Tasks
</div>

1) Function 
    - return one value
    - produces combinatorial logic
    - used in expressions
    ```assign mult_out = mult(ina,inb); ```


2) Tasks
    - can return multi values
    - can be combinatorial or registered
    - task are invoked as statement 
    ```stm_out(nxt,first,sel,filter); ```

there are more some differences between Function and Task 
go and watch the video for more info and examples 

thanks for reading 

you are legend 😎