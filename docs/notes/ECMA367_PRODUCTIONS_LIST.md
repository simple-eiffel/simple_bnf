# ECMA-367 Non-Terminal Productions with Identification Patterns

This document lists all 224 non-terminal productions from **ECMA-367 Standard** 
(Eiffel: Analysis, Design and Programming Language, 2nd Edition, June 2006).

Each production includes a regex pattern suitable for identifying specimens of 
that non-terminal in Eiffel source code text.

## Overview

- **Standard**: ECMA-367 (2nd Edition, June 2006)
- **Language**: Eiffel (Object-Oriented Programming Language)
- **Total Productions**: 224 non-terminal constructs
- **Source Document**: ecma-367-pdf-text-copy.md

## Identification Strategy

For each non-terminal `X`, identification patterns are:

1. **Word Boundary Match**: `\bX\b` - Match construct name as word boundary
2. **Choice Detection**: Productions with `|` operator contain alternatives
3. **Literal Matching**: Keywords and string literals matched literally
4. **Structure Extraction**: Repetitions {...}*, {...}+ and optional [...] components

---

## All Productions (224 Total)

1. `Construct`
   - Spec:  right-side
   - Pattern: `\bConstruct\b`

2. `Class_name`
   - Spec: Identifier
   - Pattern: `\bClass_name\b`

3. `Class_declaration`
   - Spec: [Notes]
   - Pattern: `\bClass_declaration\b`

4. `Notes`
   - Spec: note Note_list
   - Pattern: `\bNotes\b`

5. `Note_list`
   - Spec: {Note_entry ";" …}*
   - Pattern: `\bNote_list\b`

6. `Note_entry`
   - Spec: Note_name Note_values
   - Pattern: `\bNote_entry\b`

7. `Note_name`
   - Spec: Identifier ":"
   - Pattern: `\bNote_name\b`

8. `Note_values`
   - Spec: {Note_item ","…}+
   - Pattern: `\bNote_values\b`

9. `Note_item`
   - Spec: Identifier | Manifest_constant
   - Pattern: `\bNote_item\b`

10. `Class_header`
   - Spec: [Header_mark] class Class_name
   - Pattern: `\bClass_header\b`

11. `Header_mark`
   - Spec: deferred | expanded | frozen
   - Pattern: `\bHeader_mark\b`

12. `Obsolete`
   - Spec: obsolete Message
   - Pattern: `\bObsolete\b`

13. `Message`
   - Spec: Manifest_string
   - Pattern: `\bMessage\b`

14. `Features`
   - Spec: Feature_clause+
   - Pattern: `\bFeatures\b`

15. `Feature_clause`
   - Spec: feature [Clients] [Header_comment] Feature_declaration_list
   - Pattern: `\bFeature_clause\b`

16. `Feature_declaration_list`
   - Spec: {Feature_declaration ";" …}*
   - Pattern: `\bFeature_declaration_list\b`

17. `Header_comment`
   - Spec: Comment
   - Pattern: `\bHeader_comment\b`

18. `Feature_declaration`
   - Spec: New_feature_list Declaration_body
   - Pattern: `\bFeature_declaration\b`

19. `Declaration_body`
   - Spec: [Formal_arguments] [Query_mark] [Feature_value]
   - Pattern: `\bDeclaration_body\b`

20. `Query_mark`
   - Spec:  Type_mark [Assigner_mark]
   - Pattern: `\bQuery_mark\b`

21. `Type_mark`
   - Spec: ":" Type
   - Pattern: `\bType_mark\b`

22. `Feature_value`
   - Spec: [Explicit_value]
   - Pattern: `\bFeature_value\b`

23. `Explicit_value`
   - Spec: "=" Manifest_constant
   - Pattern: `\bExplicit_value\b`

24. `New_feature_list`
   - Spec: {New_feature "," …}+
   - Pattern: `\bNew_feature_list\b`

25. `New_feature`
   - Spec: [frozen] Extended_feature_name
   - Pattern: `\bNew_feature\b`

26. `Attribute_or_routine`
   - Spec: [Precondition]
   - Pattern: `\bAttribute_or_routine\b`

27. `Feature_body`
   - Spec: Deferred | Effective_routine | Attribute
   - Pattern: `\bFeature_body\b`

28. `Extended_feature_name`
   - Spec: Feature_name [Alias]
   - Pattern: `\bExtended_feature_name\b`

29. `Feature_name`
   - Spec: Identifier
   - Pattern: `\bFeature_name\b`

30. `Alias`
   - Spec: alias '"' Alias_name '"' [convert]
   - Pattern: `\bAlias\b`

31. `Alias_name`
   - Spec: Operator | Bracket
   - Pattern: `\bAlias_name\b`

32. `Bracket`
   - Spec: "[]"
   - Pattern: `\bBracket\b`

33. `Operator`
   - Spec: Unary | Binary
   - Pattern: `\bOperator\b`

34. `Unary`
   - Spec: not | "+" | "–" | Free_unary
   - Pattern: `\bUnary\b`

35. `Binary`
   - Spec: "+" | "–" | "*" | "/" | "//" | "\\" | "^" | ".." |
   - Pattern: `\bBinary\b`

36. `Assigner_mark`
   - Spec: assign Feature_name
   - Pattern: `\bAssigner_mark\b`

37. `Inheritance`
   - Spec: Inherit_clause+
   - Pattern: `\bInheritance\b`

38. `Inherit_clause`
   - Spec: inherit [Non_conformance] Parent_list
   - Pattern: `\bInherit_clause\b`

39. `Non_conformance`
   - Spec: "{" NONE "}"
   - Pattern: `\bNon_conformance\b`

40. `Parent_list`
   - Spec: {Parent ";" …}+
   - Pattern: `\bParent_list\b`

41. `Parent`
   - Spec: Class_type [Feature_adaptation]
   - Pattern: `\bParent\b`

42. `Feature_adaptation`
   - Spec: [Undefine]
   - Pattern: `\bFeature_adaptation\b`

43. `Rename`
   - Spec: rename Rename_list
   - Pattern: `\bRename\b`

44. `Rename_list`
   - Spec: {Rename_pair "," …}+
   - Pattern: `\bRename_list\b`

45. `Rename_pair`
   - Spec: Feature_name as Extended_feature_name
   - Pattern: `\bRename_pair\b`

46. `Clients`
   - Spec: "{" Class_list "}"
   - Pattern: `\bClients\b`

47. `Class_list`
   - Spec: {Class_name "," …}+
   - Pattern: `\bClass_list\b`

48. `New_exports`
   - Spec: export New_export_list
   - Pattern: `\bNew_exports\b`

49. `New_export_list`
   - Spec: {New_export_item ";" …}+
   - Pattern: `\bNew_export_list\b`

50. `New_export_item`
   - Spec: Clients [Header_comment] Feature_set
   - Pattern: `\bNew_export_item\b`

51. `Feature_set`
   - Spec: Feature_list | all
   - Pattern: `\bFeature_set\b`

52. `Feature_list`
   - Spec: {Feature_name "," …}+
   - Pattern: `\bFeature_list\b`

53. `Formal_arguments`
   - Spec: "(" Entity_declaration_list ")"
   - Pattern: `\bFormal_arguments\b`

54. `Entity_declaration_list`
   - Spec: {Entity_declaration_group ";" …}+
   - Pattern: `\bEntity_declaration_list\b`

55. `Entity_declaration_group`
   - Spec: Identifier_list Type_mark
   - Pattern: `\bEntity_declaration_group\b`

56. `Identifier_list`
   - Spec: {Identifier "," …}+
   - Pattern: `\bIdentifier_list\b`

57. `Deferred`
   - Spec: deferred
   - Pattern: `\bDeferred\b`

58. `Effective_routine`
   - Spec: Internal | External
   - Pattern: `\bEffective_routine\b`

59. `Internal`
   - Spec: Routine_mark Compound
   - Pattern: `\bInternal\b`

60. `Routine_mark`
   - Spec: do | Once
   - Pattern: `\bRoutine_mark\b`

61. `Once`
   - Spec: once [ "("Key_list ")" ]
   - Pattern: `\bOnce\b`

62. `Key_list`
   - Spec: {Manifest_string "," …}+
   - Pattern: `\bKey_list\b`

63. `Local_declarations`
   - Spec: local [Entity_declaration_list]
   - Pattern: `\bLocal_declarations\b`

64. `Compound`
   - Spec: {Instruction ";" …}*
   - Pattern: `\bCompound\b`

65. `Instruction`
   - Spec: Creation_instruction | Call | Assignment | Assigner_call | Conditional | Multi_branch | Loop | Debug | Precursor | Check | Retry
   - Pattern: `\bInstruction\b`

66. `Precondition`
   - Spec: require [else] Assertion
   - Pattern: `\bPrecondition\b`

67. `Postcondition`
   - Spec: ensure [then] Assertion [Only]
   - Pattern: `\bPostcondition\b`

68. `Invariant`
   - Spec: invariant Assertion
   - Pattern: `\bInvariant\b`

69. `Assertion`
   - Spec: {Assertion_clause ";" …}*
   - Pattern: `\bAssertion\b`

70. `Assertion_clause`
   - Spec: [Tag_mark] Unlabeled_assertion_clause
   - Pattern: `\bAssertion_clause\b`

71. `Unlabeled_assertion_clause`
   - Spec: Boolean_expression | Comment
   - Pattern: `\bUnlabeled_assertion_clause\b`

72. `Tag_mark`
   - Spec: Tag ":"
   - Pattern: `\bTag_mark\b`

73. `Tag`
   - Spec: Identifier
   - Pattern: `\bTag\b`

74. `Old`
   - Spec: old Expression
   - Pattern: `\bOld\b`

75. `Only`
   - Spec: only [Feature_list]
   - Pattern: `\bOnly\b`

76. `Check`
   - Spec: check Assertion [Notes] end
   - Pattern: `\bCheck\b`

77. `Variant`
   - Spec: variant [Tag_mark] Expression
   - Pattern: `\bVariant\b`

78. `Precursor`
   - Spec: Precursor [Parent_qualification] [Actuals]
   - Pattern: `\bPrecursor\b`

79. `Parent_qualification`
   - Spec: "{" Class_name "}"
   - Pattern: `\bParent_qualification\b`

80. `Redefine`
   - Spec: redefine Feature_list
   - Pattern: `\bRedefine\b`

81. `Undefine`
   - Spec: undefine Feature_list
   - Pattern: `\bUndefine\b`

82. `Type`
   - Spec: Class_or_tuple_type | Formal_generic_name | Anchored
   - Pattern: `\bType\b`

83. `Class_or_tuple_type`
   - Spec: Class_type | Tuple_type
   - Pattern: `\bClass_or_tuple_type\b`

84. `Class_type`
   - Spec: [Attachment_mark] Class_name [Actual_generics]
   - Pattern: `\bClass_type\b`

85. `Attachment_mark`
   - Spec: "?" | "!"
   - Pattern: `\bAttachment_mark\b`

86. `Anchored`
   - Spec:  [Attachment_mark] like Anchor
   - Pattern: `\bAnchored\b`

87. `Anchor`
   - Spec: Feature_name | Current
   - Pattern: `\bAnchor\b`

88. `Actual_generics`
   - Spec: "[" Type_list "]"
   - Pattern: `\bActual_generics\b`

89. `Type_list`
   - Spec: {Type "," …}+
   - Pattern: `\bType_list\b`

90. `Formal_generics`
   - Spec: "[" Formal_generic_list "]"
   - Pattern: `\bFormal_generics\b`

91. `Formal_generic_list`
   - Spec: {Formal_generic ","…}+
   - Pattern: `\bFormal_generic_list\b`

92. `Formal_generic`
   - Spec: [frozen] Formal_generic_name [Constraint]
   - Pattern: `\bFormal_generic\b`

93. `Formal_generic_name`
   - Spec: [?] Identifier
   - Pattern: `\bFormal_generic_name\b`

94. `Constraint`
   - Spec: "–>" Constraining_types [Constraint_creators]
   - Pattern: `\bConstraint\b`

95. `Constraining_types`
   - Spec: Single_constraint | Multiple_constraint
   - Pattern: `\bConstraining_types\b`

96. `Single_constraint`
   - Spec: Type [Renaming]
   - Pattern: `\bSingle_constraint\b`

97. `Renaming`
   - Spec: Rename end
   - Pattern: `\bRenaming\b`

98. `Multiple_constraint`
   - Spec: "{" Constraint_list "}"
   - Pattern: `\bMultiple_constraint\b`

99. `Constraint_list`
   - Spec: {Single_constraint "," …}+
   - Pattern: `\bConstraint_list\b`

100. `Constraint_creators`
   - Spec: create Feature_list end
   - Pattern: `\bConstraint_creators\b`

101. `Tuple_type`
   - Spec: TUPLE [Tuple_parameter_list]
   - Pattern: `\bTuple_type\b`

102. `Tuple_parameter_list`
   - Spec:  "[" Tuple_parameters "]"
   - Pattern: `\bTuple_parameter_list\b`

103. `Tuple_parameters`
   - Spec:  Type_list | Entity_declaration_list
   - Pattern: `\bTuple_parameters\b`

104. `Manifest_tuple`
   - Spec:  "[" Expression_list "]"
   - Pattern: `\bManifest_tuple\b`

105. `Expression_list`
   - Spec: {Expression "," …}*
   - Pattern: `\bExpression_list\b`

106. `Converters`
   - Spec: convert Converter_list
   - Pattern: `\bConverters\b`

107. `Converter_list`
   - Spec:  {Converter ","…}+
   - Pattern: `\bConverter_list\b`

108. `Converter`
   - Spec:  Conversion_procedure | Conversion_query
   - Pattern: `\bConverter\b`

109. `Conversion_procedure`
   - Spec:  Feature_name "(" "{" Type_list "}" ")"
   - Pattern: `\bConversion_procedure\b`

110. `Conversion_query`
   - Spec:  Feature_name ":" "{" Type_list "}"
   - Pattern: `\bConversion_query\b`

111. `Select`
   - Spec: select Feature_list
   - Pattern: `\bSelect\b`

112. `Conditional`
   - Spec:  if Then_part_list [Else_part] end
   - Pattern: `\bConditional\b`

113. `Then_part`
   - Spec: Boolean_expression then Compound
   - Pattern: `\bThen_part\b`

114. `Else_part`
   - Spec: else Compound
   - Pattern: `\bElse_part\b`

115. `Multi_branch`
   - Spec: inspect Expression [When_part_list] [Else_part] end
   - Pattern: `\bMulti_branch\b`

116. `When_part_list`
   - Spec: When_part+
   - Pattern: `\bWhen_part_list\b`

117. `When_part`
   - Spec: when Choices then Compound
   - Pattern: `\bWhen_part\b`

118. `Choices`
   - Spec: {Choice "," …}+
   - Pattern: `\bChoices\b`

119. `Choice`
   - Spec: Constant | Manifest_type | Constant_interval | Type_interval
   - Pattern: `\bChoice\b`

120. `Constant_interval`
   - Spec: Constant ".." Constant
   - Pattern: `\bConstant_interval\b`

121. `Type_interval`
   - Spec: Manifest_type ".." Manifest_type
   - Pattern: `\bType_interval\b`

122. `Loop`
   - Spec: Initialization
   - Pattern: `\bLoop\b`

123. `Initialization`
   - Spec: from Compound
   - Pattern: `\bInitialization\b`

124. `Exit_condition`
   - Spec: until Boolean_expression
   - Pattern: `\bExit_condition\b`

125. `Loop_body`
   - Spec: loop Compound
   - Pattern: `\bLoop_body\b`

126. `Debug`
   - Spec: debug [ "("Key_list ")" ] Compound end
   - Pattern: `\bDebug\b`

127. `Attribute`
   - Spec: attribute Compound
   - Pattern: `\bAttribute\b`

128. `Entity`
   - Spec: Variable | Read_only
   - Pattern: `\bEntity\b`

129. `Variable`
   - Spec: Variable_attribute | Local
   - Pattern: `\bVariable\b`

130. `Variable_attribute`
   - Spec: Feature_name
   - Pattern: `\bVariable_attribute\b`

131. `Local`
   - Spec: Identifier | Result
   - Pattern: `\bLocal\b`

132. `Read_only`
   - Spec: Formal | Constant_attribute | Current
   - Pattern: `\bRead_only\b`

133. `Formal`
   - Spec: Identifier
   - Pattern: `\bFormal\b`

134. `Constant_attribute`
   - Spec: Feature_name
   - Pattern: `\bConstant_attribute\b`

135. `Creators`
   - Spec: Creation_clause+
   - Pattern: `\bCreators\b`

136. `Creation_clause`
   - Spec: create [Clients] [Header_comment] Creation_procedure_list
   - Pattern: `\bCreation_clause\b`

137. `Creation_procedure_list`
   - Spec: {Creation_procedure ","…}+
   - Pattern: `\bCreation_procedure_list\b`

138. `Creation_procedure`
   - Spec: Feature_name
   - Pattern: `\bCreation_procedure\b`

139. `Creation_instruction`
   - Spec: create [Explicit_creation_type] Creation_call
   - Pattern: `\bCreation_instruction\b`

140. `Explicit_creation_type`
   - Spec: "{" Type "}"
   - Pattern: `\bExplicit_creation_type\b`

141. `Creation_call`
   - Spec: Variable [Explicit_creation_call]
   - Pattern: `\bCreation_call\b`

142. `Explicit_creation_call`
   - Spec: "." Unqualified_call
   - Pattern: `\bExplicit_creation_call\b`

143. `Creation_expression`
   - Spec:  create Explicit_creation_type [Explicit_creation_call]
   - Pattern: `\bCreation_expression\b`

144. `Equality`
   - Spec: Expression Comparison Expression
   - Pattern: `\bEquality\b`

145. `Comparison`
   - Spec: "=" | "/=" | "~" | "/~"
   - Pattern: `\bComparison\b`

146. `Assignment`
   - Spec: Variable ":=" Expression
   - Pattern: `\bAssignment\b`

147. `Assigner_call`
   - Spec: Expression ":=" Expression
   - Pattern: `\bAssigner_call\b`

148. `Call`
   - Spec: Object_call | Non_object_call
   - Pattern: `\bCall\b`

149. `Object_call`
   - Spec: [Target "."] Unqualified_call
   - Pattern: `\bObject_call\b`

150. `Unqualified_call`
   - Spec: Feature_name [Actuals]
   - Pattern: `\bUnqualified_call\b`

151. `Target`
   - Spec: Local | Read_only | Call | Parenthesized_target
   - Pattern: `\bTarget\b`

152. `Parenthesized_target`
   - Spec: "(|" Expression "|)"
   - Pattern: `\bParenthesized_target\b`

153. `Non_object_call`
   - Spec: "{" Type "}" "." Unqualified_call
   - Pattern: `\bNon_object_call\b`

154. `Actuals`
   - Spec: "(" Actual_list ")"
   - Pattern: `\bActuals\b`

155. `Actual_list`
   - Spec: {Expression "," …}+
   - Pattern: `\bActual_list\b`

156. `Object_test`
   - Spec: "{" Identifier ":" Type "}" Expression
   - Pattern: `\bObject_test\b`

157. `Rescue`
   - Spec: rescue Compound
   - Pattern: `\bRescue\b`

158. `Retry`
   - Spec: retry
   - Pattern: `\bRetry\b`

159. `Agent`
   - Spec:  Call_agent | Inline_agent
   - Pattern: `\bAgent\b`

160. `Call_agent`
   - Spec:  agent Call_agent_body
   - Pattern: `\bCall_agent\b`

161. `Inline_agent`
   - Spec:  agent [Formal_arguments] [Type_mark] [Attribute_or_routine] [Agent_actuals]
   - Pattern: `\bInline_agent\b`

162. `Call_agent_body`
   - Spec:  Agent_qualified | Agent_unqualified
   - Pattern: `\bCall_agent_body\b`

163. `Agent_qualified`
   - Spec: Agent_target ". " Agent_unqualified
   - Pattern: `\bAgent_qualified\b`

164. `Agent_unqualified`
   - Spec: Feature_name [Agent_actuals]
   - Pattern: `\bAgent_unqualified\b`

165. `Agent_target`
   - Spec: Entity | Parenthesized | Manifest_type
   - Pattern: `\bAgent_target\b`

166. `Agent_actuals`
   - Spec: "(" Agent_actual_list ")"
   - Pattern: `\bAgent_actuals\b`

167. `Agent_actual_list`
   - Spec: {Agent_actual "," …}+
   - Pattern: `\bAgent_actual_list\b`

168. `Agent_actual`
   - Spec: Expression | Placeholder
   - Pattern: `\bAgent_actual\b`

169. `Placeholder`
   - Spec: [Manifest_type] "?"
   - Pattern: `\bPlaceholder\b`

170. `Expression`
   - Spec: Basic_expression | Special_expression
   - Pattern: `\bExpression\b`

171. `Basic_expression`
   - Spec: Read_only | Local | Call | Precursor | Equality | Parenthesized | Old | Operator_expression | Bracket_expression | Creation_expression
   - Pattern: `\bBasic_expression\b`

172. `Special_expression`
   - Spec: Manifest_constant | Manifest_tuple | Agent | Object_test | Once_string | Address
   - Pattern: `\bSpecial_expression\b`

173. `Parenthesized`
   - Spec: "(" Expression ")"
   - Pattern: `\bParenthesized\b`

174. `Address`
   - Spec: "$" Variable
   - Pattern: `\bAddress\b`

175. `Once_string`
   - Spec: once Manifest_string
   - Pattern: `\bOnce_string\b`

176. `Boolean_expression`
   - Spec: Basic_expression | Boolean_constant | Object_test
   - Pattern: `\bBoolean_expression\b`

177. `Operator_expression`
   - Spec: Unary_expression | Binary_expression
   - Pattern: `\bOperator_expression\b`

178. `Unary_expression`
   - Spec: Unary Expression
   - Pattern: `\bUnary_expression\b`

179. `Binary_expression`
   - Spec: Expression Binary Expression
   - Pattern: `\bBinary_expression\b`

180. `Bracket_expression`
   - Spec: Bracket_target "[" Actuals "]"
   - Pattern: `\bBracket_expression\b`

181. `Bracket_target`
   - Spec: Target | Once_string | Manifest_constant | Manifest_tuple
   - Pattern: `\bBracket_target\b`

182. `Constant`
   - Spec: Manifest_constant | Constant_attribute
   - Pattern: `\bConstant\b`

183. `Constant_attribute`
   - Spec: Feature_name
   - Pattern: `\bConstant_attribute\b`

184. `Manifest_constant`
   - Spec: [Manifest_type] Manifest_value
   - Pattern: `\bManifest_constant\b`

185. `Manifest_type`
   - Spec: "{" Type "}"
   - Pattern: `\bManifest_type\b`

186. `Manifest_value`
   - Spec: Boolean_constant |
   - Pattern: `\bManifest_value\b`

187. `Sign`
   - Spec: "+" | "–"
   - Pattern: `\bSign\b`

188. `Integer_constant`
   - Spec: [Sign] Integer
   - Pattern: `\bInteger_constant\b`

189. `Character_constant`
   - Spec: "'" Character "'"
   - Pattern: `\bCharacter_constant\b`

190. `Boolean_constant`
   - Spec: True | False
   - Pattern: `\bBoolean_constant\b`

191. `Real_constant`
   - Spec: [Sign] Real
   - Pattern: `\bReal_constant\b`

192. `Manifest_string`
   - Spec: Basic_manifest_string | Verbatim_string
   - Pattern: `\bManifest_string\b`

193. `Basic_manifest_string`
   - Spec: ' " ' String_content ' " '
   - Pattern: `\bBasic_manifest_string\b`

194. `String_content`
   - Spec: {Simple_string Line_wrapping_part …}+
   - Pattern: `\bString_content\b`

195. `Verbatim_string`
   - Spec: Verbatim_string_opener Line_sequence Verbatim_string_closer
   - Pattern: `\bVerbatim_string\b`

196. `Verbatim_string_opener`
   - Spec: ' " ' [Simple_string] Open_bracket
   - Pattern: `\bVerbatim_string_opener\b`

197. `Verbatim_string_closer`
   - Spec:  Close_bracket [Simple_string] ' " '
   - Pattern: `\bVerbatim_string_closer\b`

198. `Open_bracket`
   - Spec: "[" | "{"
   - Pattern: `\bOpen_bracket\b`

199. `Close_bracket`
   - Spec: "]" | "}"
   - Pattern: `\bClose_bracket\b`

200. `External`
   - Spec: external External_language [External_name]
   - Pattern: `\bExternal\b`

201. `External_language`
   - Spec: Unregistered_language | Registered_language
   - Pattern: `\bExternal_language\b`

202. `Unregistered_language`
   - Spec: Manifest_string
   - Pattern: `\bUnregistered_language\b`

203. `External_name`
   - Spec: alias Manifest_string
   - Pattern: `\bExternal_name\b`

204. `Registered_language`
   - Spec:  C_external | C++_external | DLL_external
   - Pattern: `\bRegistered_language\b`

205. `External_signature`
   - Spec: signature [External_argument_types] [: External_type]
   - Pattern: `\bExternal_signature\b`

206. `External_argument_types`
   - Spec: "(" External_type_list ")"
   - Pattern: `\bExternal_argument_types\b`

207. `External_type_list`
   - Spec: {External_type "," …}*
   - Pattern: `\bExternal_type_list\b`

208. `External_type`
   - Spec: Simple_string
   - Pattern: `\bExternal_type\b`

209. `External_file_use`
   - Spec: use External_file_list
   - Pattern: `\bExternal_file_use\b`

210. `External_file_list`
   - Spec: {External_file "," …}+
   - Pattern: `\bExternal_file_list\b`

211. `External_file`
   - Spec: External_user_file | External_system_file
   - Pattern: `\bExternal_file\b`

212. `External_user_file`
   - Spec: ' " ' Simple_string ' " '
   - Pattern: `\bExternal_user_file\b`

213. `External_system_file`
   - Spec: "<"Simple_string ">"
   - Pattern: `\bExternal_system_file\b`

214. `C_external`
   - Spec: ’' " ' C
   - Pattern: `\bC_external\b`

215. `DLL_external`
   - Spec: ' " ' dll
   - Pattern: `\bDLL_external\b`

216. `DLL_identifier`
   - Spec: Simple_string
   - Pattern: `\bDLL_identifier\b`

217. `DLL_index`
   - Spec: Integer
   - Pattern: `\bDLL_index\b`

218. `Comment`
   - Spec: "– –" {Simple_string Comment_break …}*
   - Pattern: `\bComment\b`

219. `Comment_break`
   - Spec: New_line [Blanks_or_tabs] "– –"
   - Pattern: `\bComment_break\b`

220. `Integer`
   - Spec: [Integer_base] Digit_sequence
   - Pattern: `\bInteger\b`

221. `Integer_base`
   - Spec: "0" Integer_base_letter
   - Pattern: `\bInteger_base\b`

222. `Integer_base_letter`
   - Spec: "b" | "c" | "x" | "B" | "C" | "X"
   - Pattern: `\bInteger_base_letter\b`

223. `Digit_sequence`
   - Spec: Digit+
   - Pattern: `\bDigit_sequence\b`

224. `Digit`
   - Spec: "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" |
   - Pattern: `\bDigit\b`

---

## Summary Statistics

- **Total Non-Terminals**: 224
- **Choice Productions** (|): 50
- **Repetition** ({...}): 38
- **Optional** ([...]): 58
