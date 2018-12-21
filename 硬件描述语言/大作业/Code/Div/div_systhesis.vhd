library ieee;
use ieee.std_logic_1164.all;

entity div_systhesis is
  port(
    clk : in std_logic;
    start : in std_logic;
    A : in std_logic_vector(7 downto 0);
    B : in std_logic_vector(7 downto 0);
    QL : out std_logic_vector(7 downto 0);
    QH : out std_logic_vector(7 downto 0)
  );
end div_systhesis;

architecture rtl of div_systhesis is
  component arictl is
    port(
      clk : in std_logic;
      start : in std_logic;
      clkout : out std_logic;
      rstall : out std_logic;
      ariend : out std_logic
    );
  end component;
  
  component subtractor is
    port(
      cin1 : in std_logic;
      cin2 : in std_logic;
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      S : out std_logic_vector(7 downto 0);
      cout : out std_logic
    );
  end component;
  
  component reg16b is
    port(
      clk : in std_logic;
      cin : in std_logic;
      load : in std_logic;
      ariend : in std_logic;
      a : in std_logic_vector(7 downto 0);
      d : in std_logic_vector(7 downto 0);
      qh : out std_logic_vector(7 downto 0);
      ql : out std_logic_vector(7 downto 0)
    );
  end component;
  
  component compare8 is
    port(
      IA_more_than_B : in std_logic;
      IB_more_than_A : in std_logic;
      IA_equal_B     : in std_logic;
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      OA_more_than_B : out std_logic;
      OB_more_than_A : out std_logic;
      OA_equal_B : out std_logic
    );
  end component;
  
  signal s_clk_out : std_logic;
  signal s_rstall : std_logic;
  signal s_ariend : std_logic;
  signal s_qh : std_logic_vector(7 downto 0);
  signal s_ql : std_logic_vector(7 downto 0);
  signal s_oa_more_than_b : std_logic;
  signal s_ob_more_than_a : std_logic;
  signal s_oa_equal_b : std_logic;
  signal s_d : std_logic_vector(7 downto 0);
  signal s_cout : std_logic;
begin
  i_compare8 : compare8
  port map(
    IA_more_than_B => '0',
    IB_more_than_A => '0',
    IA_equal_B => '1',
    A => s_qh,
    B => B,
    OA_more_than_B => s_oa_more_than_b,
    OB_more_than_A => s_ob_more_than_a,
    OA_equal_B => s_oa_equal_b
  );
  
  i_arictl : arictl
  port map(
    clk => clk,
    start => start,
    clkout => s_clk_out,
    rstall => s_rstall,
    ariend => s_ariend
  );
  
  i_subtractor : subtractor
  port map(
    cin1 => s_oa_more_than_b,
    cin2 => s_oa_equal_b,
    A => s_qh,
    B => B,
    S => s_d,
    cout => s_cout
  );
  
  i_reg16b : reg16b
  port map(
    clk => s_clk_out,
    cin => s_cout,
    load => s_rstall,
    ariend => s_ariend,
    a => A,
    d => s_d,
    ql => s_ql,
    qh => s_qh
  );
  
  QL <= s_ql;
  QH <= s_qh;
end rtl;