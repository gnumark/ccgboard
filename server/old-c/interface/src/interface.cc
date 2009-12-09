// generated 2004/2/8 21:52:22 CET by newmark@molly.(none)
// using glademm V2.0.0
//
// newer (non customized) versions of this file go to interface.cc_new

// This file is for your program, I won't touch it again!

#include <gtkmm/main.h>

#include "main.hh"

int main(int argc, char **argv)
{  
#if defined(ENABLE_NLS)
   bindtextdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR);
   textdomain (GETTEXT_PACKAGE);
#endif //ENABLE_NLS
   
   Gtk::Main m(&argc, &argv);

main *main = new class main();
   m.run(*main);
delete main;
   return 0;
}
