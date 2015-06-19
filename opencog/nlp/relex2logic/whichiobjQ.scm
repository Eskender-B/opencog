; this rule would be correct but doesn't fire because the relex output doesn't output an _iobj
; or a _pobj for it, due to the syntax.  No way to write a set of conditions that will work for
; this one until I fix the relex error -- AN

(define whichiobjQ
    (BindLink
        (VariableList
            (TypedVariableLink
                (VariableNode "$a-parse")
                (TypeNode "ParseNode")
            )
            (TypedVariableLink
                (VariableNode "$subj")
                (TypeNode "WordInstanceNode")
            )
            (TypedVariableLink
                (VariableNode "$verb")
                (TypeNode "WordInstanceNode")
            )
            (TypedVariableLink
                (VariableNode "$obj")
                (TypeNode "WordInstanceNode")
            )
            (TypedVariableLink
                (VariableNode "$iobj")
                (TypeNode "WordInstanceNode")
            )
            (TypedVariableLink
                (VariableNode "$qVar")
                (TypeNode "WordInstanceNode")
            )		
        )
        (AndLink
            (WordInstanceLink
                (VariableNode "$subj")
                (VariableNode "$a-parse")
            )
            (WordInstanceLink
                (VariableNode "$verb")
                (VariableNode "$a-parse")
            )
            (WordInstanceLink
                (VariableNode "$obj")
                (VariableNode "$a-parse")
            )
            (WordInstanceLink
                (VariableNode "$iobj")
                (VariableNode "$a-parse")
            )
            (EvaluationLink
                (DefinedLinguisticRelationshipNode "_iobj")
                (ListLink
                    (VariableNode "$verb")
                    (VariableNode "$iobj")
                )
            )
			(EvaluationLink
   				(DefinedLinguisticRelationshipNode "_det")
  				 (ListLink
     					(VariableNode "$iobj")
      					(VariableNode "$qVar")
				)
			)
			(InheritanceLink
				(VariableNode "$qVar")
				(DefinedLinguisticConceptNode "which")
			)
        )
        (ExecutionOutputLink
       	   (GroundedSchemaNode "scm: pre-whichiobjQ-rule")
       	      (ListLink
       	         (VariableNode "$subj")
       	         (VariableNode "$verb")
       	         (VariableNode "$obj")
		(VariableNode "$iobj")
            )
        )
    )
)

(InheritanceLink (stv 1 .99) (ConceptNode "whichiobjQ-Rule") (ConceptNode "Rule"))

(ReferenceLink (stv 1 .99) (ConceptNode "whichiobjQ-Rule") whichiobjQ)

; This is function is not needed. It is added so as not to break the existing
; r2l pipeline.
(define (pre-whichiobjQ-rule subj verb obj iobj)
    (whichiobjQ-rule (word-inst-get-word-str subj) (cog-name subj)
              (word-inst-get-word-str verb) (cog-name verb)
              (word-inst-get-word-str obj) (cog-name obj)
              (word-inst-get-word-str iobj) (cog-name iobj)
    )
)


