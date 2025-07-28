program main
   use sample, only: hello_there
   use second_sample, only: answer
   implicit none

   call hello_there()

   call answer()

end program main
