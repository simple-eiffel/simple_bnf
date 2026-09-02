note
	description: "[
		An abstract syntactic rule or pattern describing the structure of BNF-E language components.

		Per ECMA-367 section 8.2.2, a Construct is the formal description of the structure of all specimens
		of a non-terminal construct. Every construct has exactly one production defining how specimens
		of that construct must be structured.

		This class represents the metadata and specification for a linguistic construct, enabling
		grammar definition, validation, and language processing.
	]"
	author: "Eiffel Language Committee"
	date: "$Date$"
	revision: "$Revision$"
	standards: "ECMA-367:2026 section 8.2.2 (Definition: Component, Construct, Specimen)"
	see_also: "[
		- BNF_COMPONENT: A concrete piece of Eiffel source code conforming to this construct
		- BNF_SPECIMEN: A concrete instance manifesting this construct's structure
		- Production: The formal description of specimens for this construct
	]"

class
	BNF_CONSTRUCT

feature {NONE} -- Initialization

	make
			-- Initialize construct with default empty name.
		do
			create name.make_empty
		ensure
			name_empty: name.is_empty
		end

feature -- Access

	name: STRING_32
			-- The identifier or label for this construct.
		attribute
			create Result.make_empty
		end

end
