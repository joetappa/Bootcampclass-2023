add-content -path c:/users/Isaac/.ssh/config -value @'

Host ${user}
   HostName ${hostname}
   User ${user}
   IdentityFile ${IdentityFile}
'@