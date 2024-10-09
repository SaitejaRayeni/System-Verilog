//Shallow copy allocates the memory, copies the variable values and returns the memory handle, In shallow copy, All of the variables are copied across: integers, strings, instance handles, etc.but Objects of nested class will not be copied, only their handles will be copied.
//SystemVerilog deep copy copies all the class members and its nested class members. unlike in shallow copy, only nested class handles will be copied. In shallow copy, Objects will not be copied, only their handles will be copied. to perform a full or deep copy, the custom method needs to be added.



//deepcopy


class first;
  logic [7:0] data ;
  
  
  function new();
    data = 25;
  endfunction
  
  function first copy();
    copy = new();
    copy.data = this.data;
  endfunction
  
endclass

class second;
  
  first f1;
  
  logic [3:0] addr ;
  
  
  function new();
    f1 = new();
    addr = 5;
  endfunction
  
  function second copy();
    copy = new();
    copy.addr = addr;
    copy.f1 = f1.copy();
  endfunction
  
  function void display();
    $display("second class data= %0d,addr = %0d",f1.data,addr);
  endfunction
  
endclass

module tb();
  
 // first f1;
  second s1,s2;
  
  initial
    begin
      s1 = new();
      s2 = new();
     //s2 = s1; assignemnet
     //s2 = new s1; //shallow copy
      s2 = s1.copy();
     
      s2.display();
      s1.display();
      
      s1.f1.data = 12;
      s1.addr = 6;
 
      s2.display();
      s1.display();

    end
  
endmodule
