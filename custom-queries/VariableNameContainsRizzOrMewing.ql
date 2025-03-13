import swift

predicate variableNameContainsRizzOrMewing(string name) {
  name = /.*rizz.*/ or
  name = /.*mewing.*/
}

from Variable v
where variableNameContainsRizzOrMewing(v.getName())
select v, "Variable name contains 'rizz' or 'mewing'."