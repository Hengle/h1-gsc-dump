// H1 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_russian_loyalist_c" );
    self attach( "head_russian_loyalist_c", "", 1 );
    self.headmodel = "head_russian_loyalist_c";
    self.voice = "russian";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_russian_loyalist_c" );
    precachemodel( "head_russian_loyalist_c" );
}
