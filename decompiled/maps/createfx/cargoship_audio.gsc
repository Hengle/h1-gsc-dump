// H1 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    thread init_animsounds();
}

init_animsounds()
{
    waittillframeend;
    maps\_anim::addonstart_animsound( "end_hands", "player_rescue", "cargoship_jumpforheli" );
}
