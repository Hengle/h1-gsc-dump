// H1 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "body_sas_woodland_soldier_02" );
    self attach( "head_sas_ct_assault_benjamin_nomask", "", 1 );
    self.headmodel = "head_sas_ct_assault_benjamin_nomask";
    self.voice = "british";
    self setclothtype( "vestlight" );
}

precache()
{
    precachemodel( "body_sas_woodland_soldier_02" );
    precachemodel( "head_sas_ct_assault_benjamin_nomask" );
}
