// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

/*
    ----- WARNING: -----

    This GSC dump may contain symbols that H1-mod does not have named. Navigating to https://github.com/h1-mod/h1-mod/blob/develop/src/client/game/scripting/function_tables.cpp and
    finding the function_map, method_map, & token_map maps will help you. CTRL + F (Find) and search your desired value (ex: 'isplayer') and see if it exists.

    If H1-mod doesn't have the symbol named, then you'll need to use the '_ID' prefix.

    (Reference for below: https://github.com/mjkzy/gsc-tool/blob/97abc4f5b1814d64f06fd48d118876106e8a3a39/src/h1/xsk/resolver.cpp#L877)

    For example, if H1-mod theroetically didn't have this symbol, then you'll refer to the '0x1ad' part. This is the hexdecimal key of the value 'isplayer'.
    So, if 'isplayer' wasn't defined with a proper name in H1-mod's function/method table, you would call this function as 'game:_id_1AD(player)' or 'game:_ID1AD(player)'

    Once again, you may need to do this even though it's named in this GSC dump but not in H1-Mod. This dump just names stuff so you know what you're looking at.
    --------------------

*/

main()
{
    level._effect["headshot1"] = loadfx( "fx/impacts/flesh_hit_head_fatal_exit" );
    level._effect["headshot2"] = loadfx( "fx/impacts/flesh_hit_splat_large" );
    level._effect["headshot3"] = loadfx( "fx/impacts/flesh_hit_body_fatal_exit" );
    level._effect["blood_pool"] = loadfx( "fx/impacts/deathfx_bloodpool" );
    level._effect["flesh_hit"] = loadfx( "fx/impacts/flesh_hit" );
    level._effect["blood"] = loadfx( "fx/impacts/sniper_escape_blood" );
    level._effect["cloud"] = loadfx( "fx/misc/ac130_cloud" );
    level._effect["cloud_tunnel"] = loadfx( "fx/weather/cloud_tunnel" );
    level._effect["light_beams"] = loadfx( "fx/smoke/light_beam_airplane" );
    level._effect["light_beams_lg"] = loadfx( "fx/smoke/light_beam_airplane_lg" );
    level._effect["cloud_windows"] = loadfx( "fx/weather/h1_airplane_window_clouds" );
    level._effect["suitcase_explosion"] = loadfx( "fx/explosions/h1_airplane_explode" );
    level._effect["airplane_explosion"] = loadfx( "fx/explosions/h1_airplane_explode" );
    level._effect["player_death_explosion"] = loadfx( "fx/explosions/player_death_explosion" );
    level._effect["fuselage_explosion1"] = loadfx( "fx/explosions/fuselage_explosion1" );
    level._effect["fuselage_explosion10"] = loadfx( "fx/explosions/decompression_exp1" );
    level._effect["fuselage_explosion_wind_suck"] = loadfx( "fx/dust/decompression_exitdoor_dust" );
    level._effect["fuselage_explosion_cabin_dust1"] = loadfx( "fx/dust/decompression_cabin_dust" );
    level._effect["fuselage_explosion_cabin_dust2"] = loadfx( "fx/dust/decompression_cabin_dust_short" );
    level._effect["fuselage_breach_airleak1"] = loadfx( "fx/misc/cargoship_sinking_steam_leak" );
    level._effect["fuselage_breach_airleak2"] = loadfx( "fx/smoke/decompression_leak" );
    level._effect["exit_door_dust"] = loadfx( "fx/dust/decompression_cabin_dust" );
    level._effect["exit_door_wind_suck"] = loadfx( "fx/dust/decompression_exitdoor_dust" );
    level._effect["door_kick_dust"] = loadfx( "fx/dust/dust_airplane_doorkick" );
    level._effect["goggles_cracks"] = loadfx( "vfx/ui/goggles_cracks" );
    level._effect["slow_mo_overlay"] = loadfx( "vfx/ui/h1_airplane_slow_mo_overlay" );
    maps\createfx\airplane_fx::main();
    maps\createfx\airplane_sound::main();
}
