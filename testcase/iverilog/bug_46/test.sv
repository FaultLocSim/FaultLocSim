module m;
  int __current_scopes [$];
  int a;

  initial begin
    __current_scopes.push_front(10);
    __current_scopes.pop_back(); 
  end

endmodule : m
