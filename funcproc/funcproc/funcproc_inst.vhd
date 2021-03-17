	component funcproc is
		port (
			source : out std_logic_vector(79 downto 0);                    -- source
			probe  : in  std_logic_vector(39 downto 0) := (others => 'X')  -- probe
		);
	end component funcproc;

	u0 : component funcproc
		port map (
			source => CONNECTED_TO_source, -- sources.source
			probe  => CONNECTED_TO_probe   --  probes.probe
		);

