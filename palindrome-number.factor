IN: leetcode
USING: kernel math combinators ;

: (reverse) ( acc x -- x )
    dup 0 =
    [ drop ]
    [ dup 10 /i [ [ 10 * ] [ 10 mod ] bi* + ] dip (reverse) ] if ;

: is-palindrome ( i -- ? )
    dup 0 swap (reverse)
    = ;
