module test;
typedef enum logic [8:0]
{ILLEGAL,
IA,
IB
} inst_t;
inst_t ipb_inst;

typedef struct packed
{
inst_t inst;
logic iw;
} ipb_data_t;
ipb_data_t ipb_d;

always
ipb_inst = ipb_d.inst;

endmodule
