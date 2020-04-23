lib LibShadow
  struct ShadowPassword
    name : UInt8*
    encrypted_password : UInt8*
    last_change : LibC::Long
    min_days : LibC::Long
    max_days : LibC::Long
    warn_days : LibC::Long
    inactivity_days : LibC::Long
    expire_date : LibC::Long
    flags : LibC::ULong
  end

  fun getspnam(name : UInt8*) : ShadowPassword*
end
