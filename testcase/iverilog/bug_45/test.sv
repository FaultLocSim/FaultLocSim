`define uvm_field_utils_end \
     if(what__ inside {UVM_SETINT,UVM_SETSTR,UVM_SETOBJ}) begin \
        // remove all scopes recorded (through super and other objects visited before) \
          __current_scopes.pop_back()); \
        __m_uvm_status_container.m_uvm_cycle_scopes = __current_scopes; \
     end \

module m;
endmodule : m
