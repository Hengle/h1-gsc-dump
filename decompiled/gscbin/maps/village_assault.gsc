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

dead_script()
{
    common_scripts\_ca_blockout::init();
    maps\createart\village_assault_art::main();
    maps\village_assault_fx::main();
    maps\village_assault_precache::main();
    _id_A550::main();
    maps\village_assault_anim::main();
    level thread maps\village_assault_amb::main();
    maps\village_assault_lighting::main();
}

main()
{
    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    maps\village_assault_code::precachelevelstuff();
    _id_A5A4::_id_079C( "town", ::start_town, &"STARTS_TOWN" );
    _id_A5A4::_id_079C( "alasad_barn", ::start_alasad_barn, &"STARTS_ALASADBARN" );
    _id_A5A4::_id_079C( "alasad_house", ::start_alasad_house, &"STARTS_ALASADHOUSE" );
    _id_A5A4::_id_278B( ::start_start );
    maps\village_assault_precache::main();
    maps\createart\village_assault_art::main();
    maps\village_assault_fx::main();
    maps\_c4::main();
    maps\_hiding_door_anims::main();
    thread common_scripts\_pipes::main();
    thread maps\_leak::main();
    _id_A550::main();
    maps\_hiding_door::init_hiding_door();
    _id_A55E::main();
    _id_A550::_id_7E9E( "viewhands_player_sas_woodland" );
    maps\_javelin::init();
    _id_A52C::init();
    animscripts\dog\dog_init::_id_4DAB();
    maps\village_assault_code::setleveldvars();
    maps\village_assault_lighting::main();
    maps\village_assault_aud::main();
    thread maps\village_assault_code::scriptcalls();
    _id_A5A4::_id_0764( "armor_damage", &"SCRIPT_ARMOR_DAMAGE", undefined );
    thread maps\village_assault_code::add_objective_building( "1" );
    thread maps\village_assault_code::add_objective_building( "2" );
    thread maps\village_assault_code::add_objective_building( "3" );
    thread maps\village_assault_code::add_objective_building( "4" );
    thread maps\village_assault_code::add_objective_building( "5" );
    thread maps\village_assault_code::add_objective_building( "6" );
    thread maps\village_assault_code::objective_updatenextwaypoints();
    setsaveddvar( "r_reactiveMotionWindAmplitudeScale", 3 );
    setsaveddvar( "r_reactiveMotionWindStrength", 1 );
    setsaveddvar( "r_reactiveMotionWindFrequencyScale", 3 );
    setsaveddvar( "r_reactiveMotionWindAreaScale", 33.3 );
    setsaveddvar( "r_reactiveMotionHelicopterRadius", 1000 );
    setsaveddvar( "r_reactiveMotionHelicopterStrength", 5 );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.75 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 30 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 35 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    animscripts\utility::set_team_run_twitch_animation( "allies", 1 );
    wait 0.05;
    setsaveddvar( "compassObjectiveMaxHeight", "800" );
    setsaveddvar( "compassObjectiveMinHeight", "-800" );
}

start_start()
{
    maps\village_assault_code::spawn_starting_friendlies( "friendly_start" );
    thread gameplay_start();
}

start_town()
{
    maps\village_assault_code::spawn_starting_friendlies( "friendly_town" );
    maps\village_assault_code::moveplayertolocation( "player_start_town" );
}

start_alasad_barn()
{
    maps\village_assault_code::spawn_starting_friendlies( "friendly_alasad_barn" );
    maps\village_assault_code::moveplayertolocation( "player_start_alasad_barn" );
    thread maps\village_assault_code::do_alasad( "barn" );
}

start_alasad_house()
{
    maps\village_assault_code::spawn_starting_friendlies( "friendly_alasad_house" );
    maps\village_assault_code::moveplayertolocation( "player_start_alasad_house" );
    thread maps\village_assault_code::do_alasad( "house" );
}

gameplay_start()
{
    maps\village_assault_code::friendly_stance( "crouch" );
    thread battlechatter_trigger_on();
    maps\village_assault_code::opening_sequence();
    maps\village_assault_code::friendly_stance( "stand", "crouch", "prone" );
    var_0 = getent( "first_trigger_after_gas_station", "script_noteworthy" );

    if ( !isdefined( var_0._id_97CC ) || var_0._id_97CC == 0 )
        var_0 notify( "trigger" );

    for ( var_1 = 0; var_1 < level.friendlies.size; var_1++ )
        level.friendlies[var_1] _meth_81a7( 1 );

    getent( "pushplayer_off", "targetname" ) waittill( "trigger" );

    for ( var_1 = 0; var_1 < level.friendlies.size; var_1++ )
        level.friendlies[var_1] _meth_81a7( 0 );
}

battlechatter_trigger_on()
{
    _id_A5A4::_id_1332( "allies" );
    _id_A5A4::_id_1332( "axis" );
    getent( "battlechatter_on_trigger", "targetname" ) waittill( "trigger" );
    _id_A5A4::_id_1333( "allies" );
    _id_A5A4::_id_1333( "axis" );
    thread maps\village_assault_code::doautosave( "entered_town" );
    wait 60;
    thread maps\village_assault_code::air_support_hint_print_activate();
}
