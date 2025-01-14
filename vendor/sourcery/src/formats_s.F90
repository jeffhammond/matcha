submodule(formats_m) formats_s
  !! Construct separated-value formats 
  
#ifdef USE_CAFFEINE
   use caffeine_m, only : error_stop => caf_error_stop
#endif
  
  implicit none

contains

  module procedure separated_values
    character(len=*), parameter :: prefix = "(*(G0,:,'"
    character(len=*), parameter :: suffix =           "'))"
    character(len=*), parameter :: complex_prefix = "(*('(',G0,',',G0,')',:,'" 

#ifndef NAGFOR
    select rank(mold)
      rank(1)
#endif
        select type(mold)
          type is(complex)
            format_string = complex_prefix // separator // suffix
          type is(real)
            format_string = prefix // separator // suffix
          type is(integer)
            format_string = prefix // separator // suffix
          type is(character(len=*))
            format_string = prefix // separator // suffix
          class default
#ifdef USE_CAFFEINE
             call error_stop("format_s separated_values: unsupported type")
#else
             error stop "format_s separated_values: unsupported type"
#endif
        end select
#ifndef NAGFOR
      rank default
#ifdef USE_CAFFEINE
        call error_stop("formats_s separated_values: unsupported rank")
#else
        error stop "formats_s separated_values: unsupported rank"
#endif
    end select
#endif
  end procedure

end submodule formats_s
