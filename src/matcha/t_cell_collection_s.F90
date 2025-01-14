! Copyright (c), The Regents of the University of California
! Terms of use are as specified in LICENSE.txt
submodule(t_cell_collection_m) t_cell_collection_s
 
#ifdef USE_CAFFEINE
   use caffeine_assert_m, only : assert
#else
   use assert_m, only : assert
#endif
 
  implicit none
  
contains
      
  module procedure construct
    t_cell_collection%positions_ = positions
    t_cell_collection%time_ = time
  end procedure 
  
  module procedure positions
    call assert(allocated(self%positions_), "t_cell_collection_t%positions: allocated(positions_)")
    my_positions = self%positions_
  end procedure
  
  module procedure time
    my_time = self%time_
  end procedure
    
end submodule t_cell_collection_s
