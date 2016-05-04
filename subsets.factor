IN: leetcode
USING: locals math math.order sorting sequences kernel vectors ;

:: (search) ( nums idx acc cur -- )
    idx nums length =
    [ cur clone acc push ]
    [ idx nums nth cur push
      nums idx 1 + acc cur (search)
      cur pop drop
      nums idx 1 + acc cur (search) ] if ;

: subsets ( nums -- sets )
    [ <=> ] sort
    0
    0 <vector> dup
    0 <vector>
    swap
    [ (search) ] dip ;
