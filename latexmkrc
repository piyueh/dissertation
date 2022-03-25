# append a search path to find tex files, including class/package definitions
ensure_path('TEXINPUTS', './gw-dissertation-class//');

# the directory to store generated files
$out_dir = "outputs";

# only have to provess main.tex; other tex files are included in main.tex
@default_files = ('main.tex');

# which compiler to use for generating PDF (5 means xelatex)
$pdf_mode = 5;

# don't generate the DVI version of the document
$dvi_mode = 0;

# don't generate the PostScript version of the document
$dvi_mode = 0;

# the command used for the xelatex compiler
$xelatex = "xelatex -synctex=1 %O %S";

# a Perl function converting nomenclature file .nlo to .nls file
sub makelos
{
    return system(
        "makeindex \"$_[0].nlo\" -s nomencl.ist -g \"$_[0].log\" -o \"$_[0].nls\""
    );
}

# let latexmk knows it has to convert .nlo files to .nls files
add_cus_dep("nlo", "nls", 0, "makelos");

# let latexmk knows .nlo and .nls files have to be cleaned when it does cleaning
push @generated_exts, "nlo", "nls";
