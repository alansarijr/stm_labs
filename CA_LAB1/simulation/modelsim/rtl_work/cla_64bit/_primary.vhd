library verilog;
use verilog.vl_types.all;
entity cla_64bit is
    port(
        A               : in     vl_logic_vector(63 downto 0);
        B               : in     vl_logic_vector(63 downto 0);
        Cin             : in     vl_logic;
        Sum             : out    vl_logic_vector(63 downto 0);
        Cout            : out    vl_logic
    );
end cla_64bit;
