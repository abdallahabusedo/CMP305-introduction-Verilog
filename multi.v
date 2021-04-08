**********************//////////////////////**********************
**********************// Verilog language //**********************
**********************//////////////////////**********************
/*
    - Standard Hardware description Language (HDL).
    - used to describe a digital system.
    # Behavior Modeling
        - A Component is described by its I/O response.
        = only the functionality of the circuit no structure.
    # Structural Modeling 
        - A component is described by interconnecting Lower-Level Component/primitives 
        = Both Functionality and structure of the circuit 
    # Register Transfer Level (RTL)
        - A type of behavioral modeling for the purpose of synthesis
        ## Synthesis : Translating HDL to a circuit and then optimizing the represented circuit
*/

/* Module declaration 
    1- begins with keyword module 
    2- provides module name 
    3- include port list
*/  
module multi (
    /* port_list types
        1- input  => input port 
        2- output => output port 
        3- inout  => bidirectional port 
    */
);
    // port declaration "<port_type> <port_name>;"
    /* data type declatation
        => Net Data type 
            -> represents physical interconnect between structures 
        -- wire 
        -- tri 
        -- supply0
           supply1
        example
            ```
                wire [7:0] out;
                tri enable;
            ```
        => Variable Data type 
            -> represent element to store data temporarily 
        -- reg 
        -- integer
        -- real
        -- time
        -- realtimer
    */  

    /* instantiation format 
        <component_name> #<delay> <instance_name> (port_list);
        #<delay> -> delay through component
        
    */
    // circuit functionality  
    // timing specifications 

endmodule //multi