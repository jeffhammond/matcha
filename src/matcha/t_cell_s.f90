submodule(t_cell_m) t_cell_s
  implicit none

contains
  
  module procedure initialize_positions

    double precision, parameter :: scaling_factor  = 100.

    !     Assign initial positions to T cells randomly in a cube with sides of length scaling_factor
    x = random_positions(:,1)*scaling_factor
    y = random_positions(:,2)*scaling_factor
    z = random_positions(:,3)*scaling_factor

  end procedure initialize_positions

end submodule t_cell_s