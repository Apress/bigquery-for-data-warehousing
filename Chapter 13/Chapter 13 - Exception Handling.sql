BEGIN
SELECT 1/0; -- attempts to divide by zero
EXCEPTION WHEN ERROR THEN
SELECT "what are you even doing there";
END;

EXCEPTION WHEN ERROR THEN
SELECT FORMAT("Hey, you. When you executed %s at %s, it caused an error: %s. Please don't do that.", 
              @@error.statement_text, 
              @@error.formatted_stack_trace, 
              @@error.message);
END;

RAISE USING message = "Error.";