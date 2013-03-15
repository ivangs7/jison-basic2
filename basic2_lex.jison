/* description: Basic grammar that contains a nullable A nonterminal. */

%lex
%%

\s+               {/* skip whitespace */}
[a-zA-Z_]\w*      {return 'x';}

/lex

%%

S   : A
           { return $1+" identifiers"; }
    ;
A   : /* empty */  
           { 
              console.log("starting"); 
              $$ = 0; 
           }
    | A x  { 
              $$ = $1 + 1;  
              console.log($$)
           }
    ;

/* Asociado a cada regla yo puedo asociar una acción semántica 
 * Cada vez que detecte que una regla de producción se aplica, 
 * realizará la acción semántica
 * Cada uno de los elementos que aparecen en las reglas de producción
 * tienes asociado un atributo. 
 *      A    -> A  x
 *      $$      $1 $2 .... $loquesea
 */

/* El árbol se construye de abajo a arriba y de izquierda a derecha */
