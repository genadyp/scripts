#! /usr/bin/perl

# look at http://search.cpan.org/~gbrown/X11-WMCtrl-0.01/lib/X11/WMCtrl.pm

$DBG = 0;
$user = getlogin;

if ($DBG) {
  $res = `ps -fu $user | grep -c gnome-terminal`;  
  open(FILE, ">>/home/genadyp/dbg.log") || die "$!";
  print FILE $res;
  print FILE `ps -fu $user | grep gnome-terminal`;
  close FILE;
}

# there are at least 2 processes that suite grep condition:
#   whole system expression in if condition
#   grep call itself
if (`ps -fu $user | grep -c gnome-terminal` < 3) {
  system("gnome-terminal && cd /home/genadyp");
} else {
  system("wmctrl -a Terminal");
}
#print $res;
