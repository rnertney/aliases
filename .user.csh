#
# .user.csh
#
# 
# This script is intended to allow the user to override/extend the
# default user environment.
# 
# For best results, add entries in their related sections. Unexpected
# results could occur if entries are not placed properly.
# 
# Entry changes will (most likely) only be needed in the aliases and
# options sections. Carefully consider any changes to the path and env
# sections, it is likely the change involves an application. If so,
# contact the help desk to ensure that the application is setup
# properly.
# 
# If you have any difficulty, contact the help desk./home/paulg: 


#grab the current user's group ID
set user_grp = `id -g`

#echo "group id: "$user_grp
#echo "Shell value:" $SHLVL

#if it's not cdafae, and it's our first shell, change group
if ($user_grp != 10479) then
  if ($SHLVL == 1) then
    newgrp cdafae
  endif
endif

#continue

setenv GUUP_ROOT /tools/guup 


source ${GUUP_ROOT}/setup/env/.guup.csh
