module top(
    o___one, o___two,
    o__signed_one, o__signed_two,
    o__unsigned_one, o__unsigned_two,
    o_signed__one, o_signed__two,
    o_signed_signed_one, o_signed_signed_two,
    o_signed_unsigned_one, o_signed_unsigned_two,
    o_unsigned__one, o_unsigned__two,
    o_unsigned_signed_one, o_unsigned_signed_two,
    o_unsigned_unsigned_one, o_unsigned_unsigned_two
);

`define TEST_RAW(name, port, data) \
    output port name; \
    wire data name; \
    assign name = 1'sb1; \
    wire [$bits(name):0] tmp_``name = name; \
    initial #1 $display(`"name %b %b`", name, tmp_``name);

`define TEST_SG(port_sg, data_sg) \
    `TEST_RAW(o_``port_sg``_``data_sg``_one, port_sg      , data_sg      ) \
    `TEST_RAW(o_``port_sg``_``data_sg``_two, port_sg [1:0], data_sg [1:0]) \

    `TEST_SG(        ,         )
    `TEST_SG(        ,   signed)
    `TEST_SG(        , unsigned)
    `TEST_SG(  signed,         )
    `TEST_SG(  signed,   signed)
    `TEST_SG(  signed, unsigned)
    `TEST_SG(unsigned,         )
    `TEST_SG(unsigned,   signed)
    `TEST_SG(unsigned, unsigned)
endmodule
