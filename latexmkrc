add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$pdf_mode = 5;
$dvi_mode = $postscript_mode = 0;
$out_dir = "./outputs";
$view = "none";
@default_files = ('main.tex');
$xelatex = "xelatex -synctex=1 %O %S"
