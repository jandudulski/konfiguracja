D = Steep::Diagnostic

target :lib do
  signature "sig"

  check "lib"
  check "Gemfile"

  configure_code_diagnostics(D::Ruby.strict)
end
