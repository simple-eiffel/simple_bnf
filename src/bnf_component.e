note
	description: "[
		A concrete piece of Eiffel source code text representing a syntactically meaningful part of a class.

		Per ECMA-367 section 8.2.2, a Component is any class text or syntactically meaningful part of it,
		such as an instruction, an expression, or an identifier. Components form the basic building blocks
		of Eiffel programs and are organized according to the syntactic constructs defined in BNF-E.

		This class represents the structural metadata and specimen relationships for a linguistic component,
		enabling program analysis, AST construction, and grammar validation.

		8.2.2 Definition: Component, construct, specimen
				Any class text, or syntactically meaningful part of it, such as an instruction, an expression
				or an identifier, is called a component.

				The structure of any kind of components is described by a construct. A component of a kind
				described by a certain construct is called a specimen of that construct.

				Informative text

				For example, any particular class text, built according to the rules given in this language
				description, is a component. The construct Class describes the structure of class texts; any
				class text is a specimen of that construct. At the other end of the complexity spectrum, an
				identifier such as your_variable is a specimen of the construct Identifier.

				Although we could use the term "instance" in lieu of "specimen", it could cause confusion
				with the instances of an Eiffel class — the run-time objects built according to the class
				specification.

	]"
	author: "Larry Rix"
	date: "$Date$"
	revision: "$Revision$"
	standards: "ECMA-367:2026 section 8.2.2 (Definition: Component, Construct, Specimen)"
	see_also: "[
		- BNF_CONSTRUCT: The abstract syntactic rule describing component structure
		- BNF_SPECIMEN: A concrete instance of a syntactic construct
		- SIMPLE_GRAPH [BNF_SPECIMEN]: Collection of related specimens forming a component tree
	]"

class
	BNF_COMPONENT

create
	make,
	make_named,
	make_terminal,
	make_with_specimen,
	make_from_construct

feature {NONE} -- Initialization

	make
			-- Initialize empty component with default name and specimen graph
		do
			create name.make_empty
			create specimen.make
		ensure
			name_empty: name.is_empty
			specimen_created: specimen /= Void
			specimen_count_zero: specimen.node_count = 0
		end

	make_named (a_name: STRING_32)
			-- Initialize component with given name `a_name'.
		require
			name_not_empty: not a_name.is_empty
		do
			name := a_name
			create specimen.make
		ensure
			name_set: name.is_equal (a_name)
			specimen_created: specimen /= Void
			specimen_count_zero: specimen.node_count = 0
		end

	make_terminal (a_name: STRING_32)
			-- Initialize terminal component with name `a_name'.
		require
			name_not_empty: not a_name.is_empty
		do
			name := a_name
			create specimen.make
			is_terminal := True
		ensure
			name_set: name.is_equal (a_name)
			specimen_created: specimen /= Void
			specimen_empty: specimen.node_count = 0
			is_terminal: is_terminal
		end

	make_with_specimen (a_name: STRING_32; a_specimen: SIMPLE_GRAPH [BNF_SPECIMEN])
			-- Initialize component with name `a_name' and specimen graph `a_specimen'.
		require
			name_not_empty: not a_name.is_empty
		do
			name := a_name
			specimen := a_specimen
		ensure
			name_set: name.is_equal (a_name)
			specimen_set: specimen = a_specimen
		end

	make_from_construct (a_construct: BNF_CONSTRUCT)
			-- Initialize component from construct `a_construct'.
		do
			name := a_construct.name
			create specimen.make
		ensure
			name_set: name.is_equal (a_construct.name)
			specimen_created: specimen /= Void
		end

feature -- Access

	name: STRING_32
			-- The identifier or label for this component.
		attribute
			create Result.make_empty
		end

	specimen: SIMPLE_GRAPH [BNF_SPECIMEN]
			-- The graph of specimens comprising this component.
		attribute
			create Result.make
		end

feature -- Status report

	is_terminal: BOOLEAN
			-- Is this a terminal component (atomic token)?

	is_reserved_word: BOOLEAN
			-- Is this a reserved word component?

invariant
	name_exists: not name.is_empty
	specimen_exists: specimen /= Void

end
