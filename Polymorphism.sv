//A polymorphism has multiple forms. In SystemVerilog, polymorphism gives an object the ability to take on multiple forms.

//The super-class method handle can be set to refer to the subclass function; this enables polymorphism or many variations of the same function.

class parent;
  
  logic [3:0] data = 10;
  
  virtual function void display();
    $display("parent class data = %0d",data); 
  endfunction
  
endclass

class child extends parent;
  logic [3:0] data = 15;
  
  function void display();
    $display("child class data = %0d",data); 
  endfunction
  
endclass
  

module tb();
  
  child c1;
  parent p1;
  
  initial
    begin
      c1 = new();
      p1 = new();
      p1 = c1;
      p1.display();
      c1.display();
      #5;
      $finish;
    end
  
endmodule
