IN: leetcode
USING: kernel locals sequences math math.order sorting combinators ;

:: (two-sum) ( h r arr tgt -- h r )
    h r >
    [ -1 -1 ]
    [ h r [ arr nth ] bi@ +
      tgt <=> {
          { +lt+ [ h 1 + r arr tgt (two-sum) ] }
          { +gt+ [ h r 1 - arr tgt (two-sum) ] }
          { +eq+ [ h r ] }
      } case ] if ;

:: sorted-two-sum ( arr tgt -- h r )
    0
    arr length 1 -
    arr
    tgt
    (two-sum) ;
