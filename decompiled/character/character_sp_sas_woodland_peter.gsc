// H1 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sp_sas_woodland_assault_a" );
    self attach( "head_sp_sas_woodland_peter", "", 1 );
    self.headmodel = "head_sp_sas_woodland_peter";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sp_sas_woodland_assault_a" );
    precachemodel( "head_sp_sas_woodland_peter" );
}
