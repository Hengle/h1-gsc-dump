// H1 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    level.tweakfile = 1;

    if ( isusinghdr() )
        maps\createart\mp_countdown_fog_hdr::setupfog();
    else
        maps\createart\mp_countdown_fog::setupfog();

    visionsetnaked( "mp_countdown", 0 );
}
