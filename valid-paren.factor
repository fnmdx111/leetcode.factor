IN: leetcode
USING: combinators sequences
       lists kernel combinators prettyprint unicode assocs sets ;
: (matching-paren) ( ch -- ch )
    { { CHAR: ) CHAR: ( }
      { CHAR: ] CHAR: [ }
      { CHAR: } CHAR: { } } at ;

: valid-paren ( str -- ? )
    nil [ {
        { [ dup "([{" in? ] [ swap cons ] }
        { [ dup ")]}" in? ]
          [ swap dup +nil+? {
              { t [ f swap cons [ drop ] dip ] }
              { f [ swap (matching-paren)
                    [ [ cdr ] [ car ] bi ] dip =
                    [ ]
                    [ f swap cons ] if ] }
          } case ] }
        [ . ]
    } cond ] reduce llength 0 = ;

