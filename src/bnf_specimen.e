note
	description: "[
		A concrete instance manifesting the structure of a syntactic construct.

		Per ECMA-367 section 8.2.2, a specimen is a component of a kind described
		by a certain construct. For example, any class text is a specimen of the
		construct Class. An identifier such as `your_variable` is a specimen of
		the construct Identifier.

		This class represents a single specimen with its source text and the
		construct it belongs to.
	]"
	author: "Larry Rix"
	date: "$Date$"
	standards: "ECMA-367:2026 section 8.2.2 (Definition: Component, Construct, Specimen)"

class
	BNF_SPECIMEN

create
	make,
	make_with_text

feature {NONE} -- Initialization

	make (a_construct_name: READABLE_STRING_GENERAL)
			-- Initialize specimen for given construct.
		require
			name_not_empty: not a_construct_name.is_empty
		do
			create construct_name.make_from_string (a_construct_name.to_string_32)
			create source_text.make_empty
		ensure
			construct_set: construct_name.same_string (a_construct_name.to_string_32)
			source_empty: source_text.is_empty
		end

	make_with_text (a_construct_name: READABLE_STRING_GENERAL; a_text: READABLE_STRING_GENERAL)
			-- Initialize specimen with construct name and source text.
		require
			name_not_empty: not a_construct_name.is_empty
			text_not_void: a_text /= Void
		do
			create construct_name.make_from_string (a_construct_name.to_string_32)
			create source_text.make_from_string (a_text.to_string_32)
		ensure
			construct_set: construct_name.same_string (a_construct_name.to_string_32)
			source_set: source_text.same_string (a_text.to_string_32)
		end

feature -- Access

	construct_name: STRING_32
			-- Name of the construct this specimen belongs to.
		attribute
			create Result.make_empty
		end

	source_text: STRING_32
			-- The actual source code text of this specimen.
		attribute
			create Result.make_empty
		end

feature -- Status report

	has_source: BOOLEAN
			-- Does this specimen have non-empty source text?
		do
			Result := not source_text.is_empty
		ensure
			definition: Result = not source_text.is_empty
		end

invariant
	construct_name_not_empty: not construct_name.is_empty

end
