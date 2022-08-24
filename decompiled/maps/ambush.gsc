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
    common_scripts\utility::_id_383D( "aa_takeover" );
    common_scripts\utility::_id_383D( "takeover_fade" );
    common_scripts\utility::_id_383D( "takeover_fade_clear" );
    common_scripts\utility::_id_383D( "takeover_fade_done" );
    common_scripts\utility::_id_383D( "ambush_init" );
    common_scripts\utility::_id_383D( "takeover_finalized_done" );
    common_scripts\utility::_id_383D( "player_tower_hits_ground" );
    common_scripts\utility::_id_383D( "aa_hunt" );
    common_scripts\_ca_blockout::init();
    maps\ambush_fx::main();
    maps\ambush_precache::main();
    maps\_load::main();
    level thread maps\ambush_amb::main();
    maps\ambush_anim::main();
    maps\createart\ambush_art::main();
    maps\ambush_lighting::main();
    common_scripts\utility::_id_383F( "aa_takeover" );

    if ( getdvar( "start" ) != "" && getdvar( "start" ) != "default" )
    {
        wait 0.05;
        common_scripts\utility::_id_383F( "ambush_init" );
        common_scripts\utility::_id_383F( "takeover_finalized_done" );
    }
}

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    if ( getdvar( "beautiful_corner" ) == "1" )
    {
        dead_script();
        return;
    }

    maps\_utility::_id_079C( "ambush", ::start_ambush, &"STARTS_AMBUSH" );
    maps\_utility::_id_079C( "village", ::start_village, &"STARTS_VILLAGE" );
    maps\_utility::_id_079C( "morpheus", ::start_morpheus, &"STARTS_MORPHEUS" );
    maps\_utility::_id_079C( "apartment", ::start_apartment, &"STARTS_APARTMENT" );
    maps\_utility::_id_079C( "suicide", ::start_suicide, "SUICIDE" );
    maps\_utility::_id_278B( ::start_default );
    createthreatbiasgroup( "player" );
    createthreatbiasgroup( "oblivious" );
    createthreatbiasgroup( "group1" );
    createthreatbiasgroup( "group2" );
    createthreatbiasgroup( "badguy" );
    maps\ambush_precache::main();
    maps\_vehicle::build_aianims_with_classname( "script_vehicle_uaz_open", ::uaz_anims, ::uaz_vehicle_anims );
    precacheitem( "hunted_crash_missile" );
    precachemodel( "viewhands_op_force" );
    precachemodel( "weapon_m4" );
    precachemodel( "h1_blackhawk_missile_luncher" );
    precachemodel( "me_lightfluohang_onebulb" );
    precacheturret( "heli_minigun_noai" );
    precacheshader( "overlay_hunted_black" );
    precachestring( &"AMBUSH_OBJ_CHECKPOINT" );
    precachestring( &"AMBUSH_OBJ_GET_IN_POSITION" );
    precachestring( &"AMBUSH_OBJ_SECURE_CHECKPOINT" );
    precachestring( &"AMBUSH_TWO_HOURS_LATER" );
    precachestring( &"AMBUSH_OBJ_CAPTURE_TARGET" );
    precachestring( &"AMBUSH_OBJ_AMBUSH_CONVOY" );
    precachestring( &"AMBUSH_MISSIONFAIL_KILLED_TARGET" );
    precachestring( &"AMBUSH_MISSIONFAIL_STARTED_EARLY" );
    precachestring( &"AMBUSH_MISSIONFAIL_ESCAPED" );
    precachestring( &"AMBUSH_MISSIONFAIL_ESCAPED_WRONG_WAY" );
    precacherumble( "generic_attack_heavy_500" );
    precacherumble( "generic_quake_loop" );
    precacherumble( "generic_attack_heavy_1500" );
    setsaveddvar( "r_lodFOVScaleOverride", 1 );
    setsaveddvar( "r_lodFOVScaleOverrideAmount", 0.75 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMaxAngle", 5 );
    setsaveddvar( "r_lodFOVScaleOverrideStopMinAngle", 0.0 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMaxAngle", 65 );
    setsaveddvar( "r_lodFOVScaleOverrideStartMinAngle", 55 );
    level.weaponclipmodels = [];
    level.weaponclipmodels[0] = "weapon_m16_clip";
    level.weaponclipmodels[1] = "weapon_mp5_clip";
    level.weaponclipmodels[2] = "weapon_ak74u_clip";
    level.weaponclipmodels[3] = "weapon_ak47_clip";
    level.weaponclipmodels[4] = "weapon_dragunov_clip";
    level.weaponclipmodels[5] = "weapon_g36_clip";
    level.weaponclipmodels[6] = "weapon_saw_clip";
    level.weaponclipmodels[7] = "weapon_g3_clip";
    maps\_load::_id_7E9E( "viewhands_player_sas_woodland" );
    setup_flags();
    maps\ambush_fx::main();
    maps\_load::main();
    level thread maps\ambush_amb::main();
    maps\_compass::setupminimap( "compass_map_ambush" );
    maps\ambush_anim::main();
    maps\ambush_lighting::main();
    maps\ambush_aud::main();
    maps\createart\ambush_art::main();
    animscripts\dog\dog_init::_id_4DAB();
    level._id_9C83["hide_attack_left"] = ::guy_hide_attack_left;
    level._id_9C81["hide_attack_left"] = ::guy_hide_attack_left_check;
    level._id_9C83["escape"] = ::guy_escape;
    level._id_9C81["escape"] = ::guy_escape_check;
    setignoremegroup( "badguy", "allies" );
    setignoremegroup( "badguy", "axis" );
    setignoremegroup( "allies", "oblivious" );
    setignoremegroup( "axis", "oblivious" );
    setignoremegroup( "player", "oblivious" );
    setignoremegroup( "oblivious", "allies" );
    setignoremegroup( "oblivious", "axis" );
    setignoremegroup( "oblivious", "oblivious" );
    level.bmpcannonrange = 2048;
    level.bmpmgrange = 1200;
    level.bmpmgrangesquared = level.bmpmgrange * level.bmpmgrange;
    level._id_2235["180"] = cos( 180 );
    level.ai_friendlyfireblockduration = getdvarfloat( "ai_friendlyFireBlockDuration" );
    level thread ambush_streetlight();
    level thread fixednode_trigger_setup();
    level.player thread grenade_notifies();
    level thread setup_vehicle_pause_node();
    level thread ambush_tower_fall();
    level thread detonate_car_setup();
    level thread music_control();
    common_scripts\utility::_id_0D13( getentarray( "respawn_guy", "script_noteworthy" ), maps\_utility::_id_0798, ::generic_allied );
}
#using_animtree("vehicles");

uaz_vehicle_anims( var_0 )
{
    var_0 = vehicle_scripts\_uaz::_id_7EFA( var_0 );
    var_0[0]._id_9CD5 = %ambush_vip_escape_uaz;
    var_0[0]._id_9CD6 = 0;
    return var_0;
}

uaz_vehicle_anims_clear()
{
    self _meth_8144( %ambush_vip_escape_uaz, 0 );
}
#using_animtree("generic_human");

uaz_anims()
{
    var_0 = vehicle_scripts\_uaz::_id_7F23();
    var_0[0]._id_4B63 = %uaz_zakhaev_drive_idle;
    var_0[0]._id_4068 = %ambush_vip_escape_son;
    var_0[0].hide_attack_left_transition = %uaz_zakhaev_drive2shoot_left;
    var_0[0].hide_attack_left = %uaz_zakhaev_shoot_left;
    var_0[0].escape = %uaz_zakhaev_drive_idle;
    var_0[2]._id_4B63 = %uaz_lguy_idle_hide;
    var_0[2].hide_attack_left[0] = %uaz_lguy_standfire_side_v3;
    var_0[2].hide_attack_left[1] = %uaz_lguy_standfire_side_v4;
    var_0[2].hide_attack_left_occurrence[0] = 500;
    var_0[2].hide_attack_left_occurrence[1] = 500;
    var_0[2].escape[0] = %uaz_lguy_fire_side_v1;
    var_0[2].escape[1] = %uaz_lguy_fire_side_v2;
    var_0[2].escape_occurrence[0] = 500;
    var_0[2].escape_occurrence[1] = 500;
    return var_0;
}

guy_escape( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::_id_0BE9( self, var_1 );

    for (;;)
    {
        if ( isdefined( var_2.escape_occurrence ) )
        {
            var_3 = maps\_vehicle_aianim::_id_712A( var_0, var_2.escape_occurrence );
            maps\_vehicle_aianim::_id_0C74( var_0, var_2._id_85AE, var_2.escape[var_3] );
            continue;
        }

        maps\_vehicle_aianim::_id_0C74( var_0, var_2._id_85AE, var_2.escape );
    }
}

guy_escape_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::_id_0BE9( self, var_1 ).escape );
}

guy_hide_attack_left( var_0, var_1 )
{
    var_0 endon( "newanim" );
    self endon( "death" );
    var_0 endon( "death" );
    var_2 = maps\_vehicle_aianim::_id_0BE9( self, var_1 );

    if ( isdefined( var_2.hide_attack_left_transition ) )
        maps\_vehicle_aianim::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_left_transition );

    for (;;)
    {
        if ( isdefined( var_2.hide_attack_left_occurrence ) )
        {
            var_3 = maps\_vehicle_aianim::_id_712A( var_0, var_2.hide_attack_left_occurrence );
            maps\_vehicle_aianim::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_left[var_3] );
            continue;
        }

        maps\_vehicle_aianim::_id_0C74( var_0, var_2._id_85AE, var_2.hide_attack_left );
    }
}

guy_hide_attack_left_check( var_0, var_1 )
{
    return isdefined( maps\_vehicle_aianim::_id_0BE9( self, var_1 ).hide_attack_left );
}

setup_flags()
{
    common_scripts\utility::_id_383D( "aa_takeover" );
    common_scripts\utility::_id_383D( "aa_ambush" );
    common_scripts\utility::_id_383D( "aa_hunt" );
    common_scripts\utility::_id_383D( "aa_village" );
    common_scripts\utility::_id_383D( "aa_morpheus" );
    common_scripts\utility::_id_383D( "aa_apartment" );
    takeover_flags();
    ambush_flags();
    village_flags();
    morpheus_flags();
    apartment_flags();
}

takeover_flags()
{
    maps\_utility::_id_3847( "takeover_danger", getent( "takeover_danger_trigger", "targetname" ) );
    maps\_utility::_id_3847( "takeover_setup", getent( "takeover_setup", "targetname" ) );
    common_scripts\utility::_id_383D( "takeover_checkpoint_located" );
    maps\_utility::_id_3847( "takeover_inplace", getent( "takeover_inplace", "targetname" ) );
    maps\_utility::_id_3847( "takeover_force", getent( "takeover_boundary", "targetname" ) );
    maps\_utility::_id_3847( "takeover_advance", getent( "takeover_boundary", "targetname" ) );
    common_scripts\utility::_id_383D( "takeover_done" );
    common_scripts\utility::_id_383D( "takeover_briefing_done" );
    common_scripts\utility::_id_383D( "takeover_finalized_done" );
    common_scripts\utility::_id_383D( "takeover_fade" );
    common_scripts\utility::_id_383D( "takeover_fade_clear" );
    common_scripts\utility::_id_383D( "takeover_fade_begin_fade_in" );
    common_scripts\utility::_id_383D( "takeover_fade_done" );
}

ambush_flags()
{
    common_scripts\utility::_id_383D( "ambush_init" );
    common_scripts\utility::_id_383D( "caravan_on_the_move" );
    common_scripts\utility::_id_383D( "ambush_mission_fail" );
    common_scripts\utility::_id_383D( "ambush_early_start" );
    common_scripts\utility::_id_383D( "ambush_vehicles_inplace" );
    common_scripts\utility::_id_383D( "ambush_badguy_spotted" );
    common_scripts\utility::_id_383D( "ambush_rocket" );
    common_scripts\utility::_id_383D( "ambush_start" );
    common_scripts\utility::_id_383D( "ambush_rear_bmp_destroyed" );
    common_scripts\utility::_id_383D( "ambush_truck_hit" );
    common_scripts\utility::_id_383D( "ambush_tower_fall" );
    common_scripts\utility::_id_383D( "ambush_switch_tower" );
    common_scripts\utility::_id_383D( "ambush_recovered" );
    common_scripts\utility::_id_383D( "player_tower_hits_ground" );
    common_scripts\utility::_id_383D( "ambush_tower_blackout_come_to" );
    common_scripts\utility::_id_383D( "son_of_zakhaev_money_shot" );
    common_scripts\utility::_id_383D( "extra_guys_spawned" );
}

village_flags()
{
    common_scripts\utility::_id_383D( "village_helicopter_greeting" );
    maps\_utility::_id_3847( "village_gasstation", getent( "village_gasstation", "targetname" ), 1 );
    maps\_utility::_id_3847( "junkyard_exit", getent( "junkyard_exit", "targetname" ) );
    maps\_utility::_id_3847( "village_road", getent( "village_road", "targetname" ) );
    maps\_utility::_id_3847( "village_approach", getent( "village_approach", "targetname" ) );
    common_scripts\utility::_id_383D( "village_defend" );
    maps\_utility::_id_3847( "village_retreat", getent( "village_retreat", "targetname" ) );
    maps\_utility::_id_3847( "village_force_escape", getent( "village_force_escape", "targetname" ) );
    maps\_utility::_id_3847( "village_wrong_way", getent( "village_wrong_way", "targetname" ) );
    maps\_utility::_id_3847( "village_past_alley", getent( "village_past_alley", "targetname" ) );
    common_scripts\utility::_id_383D( "village_badguy_escape" );
    common_scripts\utility::_id_383D( "village_alley" );
}

morpheus_flags()
{
    maps\_utility::_id_3847( "morpheus_quick_start", getent( "morpheus_quick_start", "targetname" ) );
    maps\_utility::_id_3847( "morpheus_dumpster", getent( "morpheus_dumpster", "targetname" ) );
    maps\_utility::_id_3847( "morpheus_green_car", getent( "morpheus_green_car", "targetname" ) );
    maps\_utility::_id_3847( "morpheus_iron_fence", getent( "morpheus_iron_fence", "targetname" ) );
    common_scripts\utility::_id_383D( "morpheus_iron_fence_fight" );
    maps\_utility::_id_3847( "morpheus_flanker", getent( "morpheus_flanker", "targetname" ) );
    maps\_utility::_id_3847( "morpheus_rpg", getent( "morpheus_rpg", "targetname" ) );
    maps\_utility::_id_3847( "morpheus_2nd_floor", getent( "morpheus_2nd_floor", "targetname" ) );
    maps\_utility::_id_3847( "morpheus_single", getent( "morpheus_single", "targetname" ) );
    maps\_utility::_id_3847( "morpheus_target", getent( "morpheus_target", "targetname" ) );
    maps\_utility::_id_3847( "morpheus_target_moving", getent( "morpheus_target_moving", "targetname" ) );
    maps\_utility::_id_3847( "morpheus_alley", getent( "morpheus_alley", "targetname" ) );
}

apartment_flags()
{
    maps\_utility::_id_3847( "apartment_start", getent( "apartment_start", "targetname" ) );
    maps\_utility::_id_3847( "apartment_badguy_run", getent( "apartment_badguy_run", "targetname" ) );
    maps\_utility::_id_3847( "apartment_fire", getent( "apartment_fire", "targetname" ) );
    common_scripts\utility::_id_383D( "apartment_heli_attack" );
    common_scripts\utility::_id_383D( "apartment_heli_firing" );
    common_scripts\utility::_id_383D( "apartment_mg_destroyed" );
    maps\_utility::_id_3847( "apartment_badguy_attack", getent( "apartment_badguy_attack", "targetname" ) );
    maps\_utility::_id_3847( "apartment_inside", getent( "apartment_inside", "targetname" ) );
    maps\_utility::_id_3847( "apartment_badguy_3rd_flr", getent( "apartment_badguy_3rd_flr", "targetname" ) );
    maps\_utility::_id_3847( "apartment_mg_4th_flr", getent( "apartment_mg_4th_flr", "targetname" ) );
    common_scripts\utility::_id_383D( "apartment_mg_destroyed_2" );
    common_scripts\utility::_id_383D( "apartment_clear" );
    common_scripts\utility::_id_383D( "gaz_shouts_at_zakhaev" );
    common_scripts\utility::_id_383D( "h1_player_seen_zakhaev" );
    common_scripts\utility::_id_383D( "h1_player_seen_zakhaev_outside" );
    common_scripts\utility::_id_383D( "h1_zakhaev_suicide_stepping_down" );
    common_scripts\utility::_id_383D( "h1_zakhaev_suicide_down" );
    common_scripts\utility::_id_383D( "h1_zakhaev_suicide_let_play" );
    maps\_utility::_id_3847( "apartment_roof", getent( "apartment_roof", "targetname" ) );
    maps\_utility::_id_3847( "apartment_roof_friendlies", getent( "apartment_roof_friendlies", "targetname" ) );
    maps\_utility::_id_3847( "apartment_stairs", getent( "apartment_stairs", "targetname" ) );
    maps\_utility::_id_3847( "apartment_suicide", getent( "apartment_suicide", "targetname" ) );
    common_scripts\utility::_id_383D( "obj_flexicuff" );
    maps\_utility::_id_3847( "stage1", getent( "stage1", "targetname" ) );
    maps\_utility::_id_3847( "stage2", getent( "stage2", "targetname" ) );
    maps\_utility::_id_3847( "stage3", getent( "stage3", "targetname" ) );
    maps\_utility::_id_3847( "stage4", getent( "stage4", "targetname" ) );
    common_scripts\utility::_id_383D( "forced_suicide" );
    common_scripts\utility::_id_383D( "timed_suicide" );
    common_scripts\utility::_id_383D( "apartment_suicide_done" );
    common_scripts\utility::_id_383D( "mission_done" );
}

aarea_takeover_init()
{
    maps\_utility::_id_27EF( 1.5, maps\_utility::_id_070A, "start_color_init" );
    common_scripts\utility::_id_383F( "aa_takeover" );
    maps\_utility::_id_1332( "allies" );
    maps\_utility::_id_1332( "axis" );
    common_scripts\utility::_id_0D13( getentarray( "village_trigger", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    setup_friendlies( 3 );
    level.player set_playerspeed( 130 );
    common_scripts\utility::_id_0D13( level._id_8AB0, maps\_utility::_id_30B0 );
    common_scripts\utility::_id_0D13( get_generic_allies(), maps\_utility::_id_7402 );
    level thread guardtower_dead_enemies();
    level thread takeover_player();
    level thread takeover_objective();
    level thread takeover_setup();
    level thread takeover_attack();
    level thread takeover_clear_roof();
    level thread takeover_fade();
    common_scripts\utility::_id_0D13( getentarray( "checkpoint_guy", "targetname" ), maps\_utility::_id_0798, ::checkpoint_guy );
    scripted_array_spawn( "checkpoint_guy", "targetname", 1 );
    common_scripts\utility::_id_384A( "takeover_fade" );
    common_scripts\utility::_id_3831( "aa_takeover" );
    level thread aarea_ambush_init();
}

guardtower_dead_enemies()
{
    common_scripts\utility::_id_384A( "takeover_fade_clear" );
    var_0 = [];
    var_0[0] = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0[1] = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0[0] character\character_sp_opforce_geoff::main();
    var_0[0]._id_0C72 = "generic";
    var_0[0] useanimtree( #animtree );
    var_0[1] character\character_sp_opforce_c::main();
    var_0[1]._id_0C72 = "generic";
    var_0[1] useanimtree( #animtree );
    var_1 = getentarray( "dead_enemies", "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_1[var_2] maps\_anim::_id_0BC7( var_0[var_2], "death_pose_" + var_2 );
        var_0[var_2] linkto( var_1[var_2] );
    }

    common_scripts\utility::_id_384A( "ambush_switch_tower" );
    var_0[0] delete();
    var_0[1] delete();
    var_3 = [];
    var_3[0] = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_3[1] = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_3[0] character\character_sp_opforce_geoff::main();
    var_3[0]._id_0C72 = "generic";
    var_3[0] useanimtree( #animtree );
    var_3[1] character\character_sp_opforce_c::main();
    var_3[1]._id_0C72 = "generic";
    var_3[1] useanimtree( #animtree );
    var_4 = getentarray( "dead_enemies_ground", "script_noteworthy" );
    var_4[0] thread maps\_anim::_id_0BC7( var_3[0], "det_school_enter_pt2_npc_deadbody_08" );
    var_3[0] linkto( var_4[0] );
    var_4[1] thread maps\_anim::_id_0BC7( var_3[1], "det_school_enter_pt2_npc_deadbody_01" );
    var_3[1] linkto( var_4[1] );
}

takeover_objective()
{
    wait 8;
    var_0 = getent( "obj_checkpoint", "targetname" );
    objective_add( 0, "active", &"AMBUSH_OBJ_CHECKPOINT", var_0.origin );
    objective_current( 0 );
    common_scripts\utility::_id_3852( "takeover_checkpoint_located", "takeover_force" );
    objective_state( 0, "done" );

    if ( !common_scripts\utility::_id_382E( "takeover_force" ) )
    {
        var_1 = getent( "obj_dumpster", "targetname" );
        objective_add( 1, "active", &"AMBUSH_OBJ_GET_IN_POSITION", var_1.origin );
        objective_current( 1 );
    }

    common_scripts\utility::_id_384A( "takeover_force" );
    soundscripts\_snd::_id_870C( "aud_stop_mix_stealth_ambush" );
    maps\_utility::_id_A07F( maps\_utility::_id_3CB4( "tower_guy" ), undefined, 4 );

    if ( common_scripts\utility::_id_382E( "takeover_checkpoint_located" ) )
        objective_state( 1, "done" );

    objective_add( 2, "active", &"AMBUSH_OBJ_SECURE_CHECKPOINT", var_0.origin );
    objective_current( 2 );
    common_scripts\utility::_id_384A( "takeover_done" );
    maps\_utility::arcademode_checkpoint( 3.5, 1 );
    objective_state( 2, "done" );
}

takeover_player()
{
    common_scripts\utility::_id_384A( "takeover_danger" );
    level thread set_flag_on_player_action( "takeover_force", 1, 1 );
    common_scripts\utility::_id_384A( "takeover_force" );
    soundscripts\_snd::_id_870C( "aud_stop_mix_stealth_ambush" );
    level.player set_playerspeed( 190, 3 );
}

takeover_setup()
{
    level endon( "takeover_force" );
    thread takeover_predumpster_activate_color();
    wait 4;
    level.kamarov._id_0C72 = "kamarov";
    level.kamarov maps\_anim::_id_0C21( level.kamarov, "ambush_kmr_bestwayin" );
    level.kamarov._id_0C72 = "generic";
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_notbad" );
    level maps\_utility::_id_70C4( "ambush_mhp_radiojammers" );
    common_scripts\utility::_id_0CDB( getentarray( "gate_open", "targetname" ), ::hide );
    getent( "rear_blocker_open", "targetname" ) hide();
    common_scripts\utility::_id_384A( "takeover_setup" );
    maps\_utility::_id_1143( "dumpster" );
    common_scripts\utility::_id_383F( "takeover_checkpoint_located" );
    level._id_6F7C waittill( "goal" );
    level.steve waittill( "goal" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_onmymark" );
    thread takeover_postdumpster_activate_color();
    common_scripts\utility::_id_384A( "takeover_inplace" );
    wait 1;
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_takethemout" );
    wait 7;
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_cleartower" );
    wait 7;
    common_scripts\utility::_id_383F( "takeover_force" );
}

takeover_predumpster_activate_color()
{
    var_0 = getent( "takeover_predumpster_color_trigger", "targetname" );
    var_0 waittill( "trigger" );
    maps\_utility::_id_070A( "takeover_predumpster_color_o" );
    wait 0.2;
    maps\_utility::_id_070A( "takeover_predumpster_color_b" );
    wait 0.3;
    maps\_utility::_id_070A( "takeover_predumpster_color_r" );
    wait 0.2;
    maps\_utility::_id_070A( "takeover_predumpster_color_g" );
    wait 0.3;
    maps\_utility::_id_070A( "takeover_predumpster_color_y" );
}

takeover_postdumpster_activate_color()
{
    maps\_utility::_id_070A( "takeover_postdumpster_color_o" );
    wait 0.2;
    maps\_utility::_id_070A( "takeover_postdumpster_color_g" );
    wait 0.2;
    maps\_utility::_id_070A( "takeover_postdumpster_color_r" );
    wait 0.2;
    maps\_utility::_id_070A( "takeover_postdumpster_color_b" );
    wait 0.55;
    maps\_utility::_id_070A( "takeover_postdumpster_color_y" );
}

takeover_attack()
{
    common_scripts\utility::_id_384A( "takeover_force" );
    soundscripts\_snd::_id_870C( "aud_stop_mix_stealth_ambush" );
    var_0 = getent( "takeout_path_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    common_scripts\utility::_id_0D13( getentarray( "takeover_trigger", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    maps\_utility::_id_070A( "takeover_attack_color_init" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_movemove" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_goloud" );
    maps\_utility::_id_1333( "allies" );
    maps\_utility::_id_1333( "axis" );
    maps\_utility::_id_070A( "takeover_attack_color_init" );
    common_scripts\utility::_id_3856( "takeover_advance", 10 );
    maps\_utility::_id_070A( "takeover_advance_color_init" );
    var_1 = getaiarray( "axis" );
    maps\_utility::_id_A07F( var_1, var_1.size - 3 );

    if ( isdefined( getent( "takeover_diner_color_init", "targetname" ) ) )
    {
        maps\_utility::_id_070A( "takeover_diner_color_init" );
        getent( "takeover_diner_color_init", "targetname" ) common_scripts\utility::_id_97CC();
    }

    var_1 = getaiarray( "axis" );
    maps\_utility::_id_A07F( var_1 );
    common_scripts\utility::_id_0D13( level._id_8AB0, maps\_utility::_id_2A8D );
    maps\_utility::_id_070A( "takeover_hero_clear_color_init" );
    wait 2;
    level.mark thread maps\_anim::_id_0C21( level.mark, "ambush_grg_areasecure" );
    maps\_utility::_id_070A( "takeover_clear_color_init" );
    level thread takeover_briefing();
    wait 2;
    common_scripts\utility::_id_383F( "takeover_done" );
}

takeover_briefing()
{
    level._id_6F7C maps\_utility::_id_2A74();
    var_0 = getent( "cleanup_animent", "targetname" );
    var_1[0] = level._id_6F7C;
    var_1[1] = level.kamarov;

    if ( !getdvarint( "use_old_towerbrief" ) == 1 )
    {
        var_1[2] = level.steve;
        var_1[3] = level.mark;
        level.briefing_actors_arrived = 0;

        foreach ( var_3 in var_1 )
        {
            var_3 notify( "stop_going_to_node" );
            var_0 thread reach_briefing_and_add_to_count( var_3, common_scripts\utility::_id_9294( var_3 == level._id_6F7C, 2, 0 ) );
        }
    }

    while ( level.briefing_actors_arrived < var_1.size )
        waittillframeend;

    level.briefing_actors_arrived = undefined;
    level thread takeover_briefing_dialogue();
    var_0 maps\_anim::_id_0C18( var_1, "tower_briefing" );
    level._id_6F7C _meth_81aa( level._id_6F7C.origin );
    level.kamarov _meth_81aa( level.kamarov.origin );
    common_scripts\utility::_id_383F( "takeover_briefing_done" );
}

reach_briefing_and_add_to_count( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 > 0 )
        wait(var_1);

    maps\_anim::_id_0BF5( var_0, "tower_briefing" );
    level.briefing_actors_arrived++;
}

takeover_briefing_dialogue()
{
    level._id_6F7C waittillmatch( "single anim", "dialog" );
    level._id_6F7C waittillmatch( "single anim", "dialog" );
    level._id_6F7C waittillmatch( "single anim", "dialog" );
    wait 2.5;

    if ( !getdvarint( "use_old_towerbrief" ) == 1 )
        wait 0.5;

    common_scripts\utility::_id_383F( "takeover_fade" );
}

takeover_clear_roof()
{
    var_0 = getent( "clear_roof", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_0D13( maps\_utility::_id_3CB4( "roof_guy" ), ::kill_ai, 0, 5 );
}

takeover_fade()
{
    common_scripts\utility::_id_384A( "takeover_fade" );
    soundscripts\_snd::_id_870C( "aud_start_mix_fade_to_black" );
    level.player thread maps\_utility::_id_69C4( "foley_plr_dress_up" );
    thread hud_hide();
    wait 2;
    level.player freezecontrols( 1 );
    common_scripts\utility::_id_384A( "takeover_fade_clear" );
    soundscripts\_snd::_id_870C( "aud_start_ambience_morning" );
    hud_string();
    common_scripts\utility::_id_383F( "takeover_fade_begin_fade_in" );
    soundscripts\_snd::_id_870C( "aud_stop_mix_fade_to_black" );
    level.player freezecontrols( 0 );
    wait 2;
    thread hud_hide( 0 );
    wait 2;
    common_scripts\utility::_id_383F( "takeover_fade_done" );
}

hud_string()
{
    var_0 = maps\_hud_util::_id_2401( "objective", 1.5 );
    var_0.sort = 3;
    var_0.fontscale = 1.6;
    var_0.color = ( 0.8, 1.0, 0.8 );
    var_0.glowcolor = ( 0.26, 0.65, 0.32 );
    var_0.glowalpha = 0.2;
    var_0 setpulsefx( 60, 3500, 700 );
    var_0.foreground = 1;
    var_0 maps\_hud_util::_id_7FEE( "BOTTOM", undefined, 0, -150 );
    var_0 settext( &"AMBUSH_TWO_HOURS_LATER" );
    level.player thread maps\_utility::_id_69C4( "ambush_fadetoblack_interlude_music" );
    wait 5;
    var_0 destroy();
}

checkpoint_guy()
{
    self endon( "death" );

    if ( isdefined( self._id_792E ) && self._id_792E == "tower_guy" )
    {
        maps\_utility::_id_7F71( 1 );
        self _meth_856f();
    }

    self setthreatbiasgroup( "oblivious" );
    common_scripts\utility::_id_384A( "takeover_force" );
    wait 0.5;
    self setthreatbiasgroup( "axis" );
    self.fixednode = 0;
}

aarea_ambush_init()
{
    level thread ambush_mark();
    common_scripts\utility::_id_383F( "ambush_init" );
    maps\_utility::_id_1332( "allies" );
    maps\_utility::_id_1332( "axis" );
    ambush_setup();
    maps\_utility::_id_1143( "ambush" );
    common_scripts\utility::_id_383F( "aa_ambush" );
    var_0 = getent( "rear_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    getent( "rear_blocker_open", "targetname" ) show();
    getent( "badguy", "script_noteworthy" ) maps\_utility::_id_0798( ::ambush_badguy_spawn_function );
    getent( "badguy_passanger", "script_noteworthy" ) maps\_utility::_id_0798( ::ambush_badguy_passanger_spawn_function );
    getent( "badguy_passanger", "script_noteworthy" ) maps\_utility::_id_0798( ::ambush_badguy_passanger_hit_tower_death );
    maps\_utility::_id_070A( "ambush_enemy_color_init" );
    level thread ambush_player_interrupt();
    level thread ambush_helicopter();
    level thread ambush_objective();
    level thread ambush_price();
    level thread ambush_steve();
    level thread ambush_rockets();
    level thread ambush_caravan();
    var_1 = getentarray( "me_lightfluohang_onebulb", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] setmodel( "me_lightfluohang_onebulb" );

    common_scripts\utility::_id_384A( "ambush_recovered" );
    common_scripts\utility::_id_3831( "aa_ambush" );
    level thread aarea_village_init();
}

ambush_player_interrupt()
{
    level endon( "ambush_rocket" );
    level thread ambush_mission_fail();
    var_0 = getvehiclenode( "caravan_approach", "script_noteworthy" );
    var_0 waittill( "trigger" );
    level thread set_flag_on_player_action( "ambush_mission_fail", 0, 1 );
    common_scripts\utility::_id_384A( "ambush_vehicles_inplace" );
    level thread set_flag_on_player_action( "ambush_early_start", 0, 1 );
    common_scripts\utility::_id_384A( "ambush_early_start" );
    common_scripts\utility::_id_383F( "ambush_start" );
    soundscripts\_snd::_id_870C( "aud_start_mix_ambush" );
    common_scripts\utility::_id_383F( "ambush_rocket" );
}

ambush_mission_fail()
{
    level endon( "ambush_vehicles_inplace" );
    common_scripts\utility::_id_384A( "ambush_mission_fail" );
    setdvar( "ui_deadquote", "@AMBUSH_MISSIONFAIL_STARTED_EARLY" );
    maps\_utility::_id_5CDF();
}

ambush_helicopter()
{
    common_scripts\utility::_id_384A( "ambush_start" );
    level.helicopter = maps\_vehicle::_id_8978( "blackhawk" );
    var_0 = spawn( "script_model", level.helicopter gettagorigin( "tag_turret" ) );
    var_0.angles = level.helicopter gettagangles( "tag_turret" );
    var_0 notsolid();
    var_0 linkto( level.helicopter, "tag_turret", ( -10.0, -10.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "h1_blackhawk_missile_luncher" );
    var_1 = common_scripts\utility::_id_40FB( level.helicopter.target, "targetname" );
    level.helicopter thread heli_path_speed();
    level.helicopter sethoverparams( 150, 120, 60 );
    var_2 = maps\_utility::_id_3F82( "heli_restart_avm", "script_noteworthy" );
    level.helicopter thread maps\ambush_aud::aud_start_ambush_heli_scripted_sequence( var_2 );
    var_1 = common_scripts\utility::_id_40FB( "rocket_attack", "script_noteworthy" );
    var_1 waittill( "trigger" );
    level.helicopter setvehweapon( "hunted_crash_missile" );
    level.helicopter setturrettargetent( level.rear_bmp );
    level.rear_bmp maps\_vehicle::_id_4258();
    var_3 = level.helicopter fireweapon( "tag_barrel", level.rear_bmp, ( 0.0, 0.0, 0.0 ) );
    thread maps\ambush_aud::snd_heli_missile_shoot( level.helicopter, var_3 );
    wait 0.5;
    var_3 = level.helicopter fireweapon( "tag_barrel", level.rear_bmp, ( 0.0, 0.0, 0.0 ) );
    thread maps\ambush_aud::snd_heli_missile_shoot( level.helicopter, var_3 );
    var_3 waittill( "death" );

    if ( isalive( level.rear_bmp ) )
        level.rear_bmp notify( "death" );

    common_scripts\utility::_id_383F( "ambush_rear_bmp_destroyed" );
}

ambush_objective()
{
    common_scripts\utility::_id_384A( "takeover_fade_done" );
    objective_add( 3, "active", &"AMBUSH_OBJ_AMBUSH_CONVOY", level.player.origin );
    objective_current( 3 );
    common_scripts\utility::_id_384A( "ambush_start" );
    objective_state( 3, "done" );
}

ambush_badguy_spawn_function()
{
    level.badguy = self;
    self.name = "V. Zakhaev";
    maps\_utility::_id_7DDF( 0 );
    self setthreatbiasgroup( "oblivious" );
    maps\_utility::_id_7E60( 1 );
    self.a._id_2B20 = 1;
    self.grenadeawareness = 0;
    self.allowdeath = 1;
    self._id_2B0E = 1;
    self._id_2652 = %death_stand_dropinplace;
    thread badguy_died( 10 );
    maps\_utility::_id_7F71( 1 );
    self._id_7A16 = 1;
    self._id_2AF7 = 1;
    self _meth_81d7();
    common_scripts\utility::_id_384A( "ambush_switch_tower" );
    thread maps\_utility::_id_58D7();
    level.badguy animscripts\shared::_id_6869( level.badguy.secondaryweapon, "right" );
    self._id_855D = "none";
    level.badguy_jeep waittill( "death" );
    self unlink();
    var_0 = getnode( "ambush_badguy_path", "targetname" );
    thread maps\_spawner::_id_4241( var_0 );
    self waittill( "reached_path_end" );
    self notify( "stop_death_fail" );
    maps\_utility::_id_8EA4();
    self delete();
}

ambush_badguy_passanger_spawn_function()
{
    self setthreatbiasgroup( "oblivious" );
    self.allowdeath = 1;
    self._id_2652 = %death_stand_dropinplace;
    self waittill( "jumpedout" );
    self setthreatbiasgroup( "axis" );
    self._id_2652 = undefined;
}

ambush_badguy_passanger_hit_tower_death()
{
    common_scripts\utility::_id_384A( "ambush_tower_fall" );

    if ( isalive( self ) )
        self delete();
}

driver_death()
{
    self endon( "death" );
    self._id_2652 = %crouch_death_clutchchest;
    common_scripts\utility::_id_384A( "ambush_vehicles_inplace" );
    self.allowdeath = 1;
    common_scripts\utility::_id_384A( "ambush_rocket" );
    wait 1.2;
    maps\_utility::_id_2A51();
}

bmp_stop_anim()
{
    var_0 = getvehiclenode( "rearbmp_close_node", "script_noteworthy" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 == self )
            break;
    }

    self._id_0C72 = "bmp";
    var_2 = maps\_utility::_id_3EF5( "stopping" );
    self _meth_814d( var_2, 1.0, 0.0 );
}

ambush_caravan()
{
    common_scripts\utility::_id_0D13( getentarray( "drivers", "script_noteworthy" ), maps\_utility::_id_0798, ::driver_death );
    wait 8;
    var_0 = maps\_vehicle::_id_7B3C( 0 );
    wait 0.1;
    level.badguy_jeep = undefined;
    level.rear_truck = undefined;
    level.bm21 = undefined;
    level.middle_bm21 = undefined;
    level.bmp = undefined;
    level.rear_bmp = undefined;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        thread maps\_vehicle::_id_427A( var_0[var_1] );

        if ( !isdefined( var_0[var_1].script_noteworthy ) )
            continue;
        else if ( var_0[var_1].script_noteworthy == "ambush_jeep" )
        {
            level.badguy_jeep = var_0[var_1];
            level.badguy_jeep thread maps\ambush_aud::aud_vehicle_engine_linear( "snc_ambush_badguy_jeep_engine_distant", "badguyjeep_close_node", "snc_ambush_badguy_jeep_engine_close" );
        }
        else if ( var_0[var_1].script_noteworthy == "rear_truck" )
        {
            level.rear_truck = var_0[var_1];
            level.rear_truck thread maps\ambush_aud::aud_vehicle_engine_linear( "snc_ambush_rear_truck_engine_distant", "reartruck_close_node", "snc_ambush_rear_truck_engine_close" );
        }

        if ( var_0[var_1].script_noteworthy == "bm21" )
        {
            level.bm21 = var_0[var_1];
            level.bm21 thread maps\ambush_aud::aud_vehicle_engine_linear( "snc_ambush_bm21_engine_distant", "bm21_close_node", "snc_ambush_bm21_engine_close" );
        }

        if ( var_0[var_1].script_noteworthy == "middle_bm21" )
        {
            level.middle_bm21 = var_0[var_1];
            level.middle_bm21 thread maps\ambush_aud::aud_vehicle_engine_linear( "snc_ambush_middle_bm21_engine_distant", "bm21middle_close_node", "snc_ambush_middle_bm21_engine_close" );
        }

        if ( var_0[var_1].script_noteworthy == "bmp" )
        {
            level.bmp = var_0[var_1];
            level.bmp thread maps\ambush_aud::aud_vehicle_engine_linear( "snc_ambush_bmp_engine_distant", "bmp_close_node", "snc_ambush_bmp_engine_close" );
        }

        if ( var_0[var_1].script_noteworthy == "rear_bmp" )
        {
            level.rear_bmp = var_0[var_1];
            level.rear_bmp thread maps\ambush_aud::aud_vehicle_engine_linear( "snc_ambush_rear_bmp_engine_distant", "rearbmp_close_node", "snc_ambush_rear_bmp_engine_close" );
            level.rear_bmp thread bmp_stop_anim();
        }
    }

    level.badguy_jeep maps\_vehicle::_id_4259();
    level.vehicle_resumespeed = 20;
    var_2 = getvehiclenode( "bm21_inplace", "script_noteworthy" );
    var_2 waittill( "trigger" );
    common_scripts\utility::_id_383F( "ambush_vehicles_inplace" );
    common_scripts\utility::_id_384A( "ambush_rocket" );
    common_scripts\utility::_id_3856( "ambush_start", 1 );
    maps\_utility::_id_1333( "allies" );
    maps\_utility::_id_1333( "axis" );
    level.bm21 notify( "unload", "all" );
    level.middle_bm21 notify( "unload", "passengers" );
    level.rear_bmp thread ambush_bmp_attack();
    wait 1;
    level.badguy_jeep thread maps\_vehicle::_id_9C7F( "hide_attack_left" );
    common_scripts\utility::_id_384A( "ambush_rear_bmp_destroyed" );
    wait 1;
    maps\_utility::_id_27EF( 0.0, maps\_utility::_id_0709, "ambush_extra_enemies_1" );
    maps\_utility::_id_27EF( 1.0, maps\_utility::_id_0709, "ambush_extra_enemies_2" );
    maps\_utility::_id_27EF( 2.0, maps\_utility::_id_0709, "ambush_extra_enemies_3" );
    maps\_utility::_id_27EF( 1.5, common_scripts\utility::_id_383F, "extra_guys_spawned" );
    wait 3;
    maps\_utility::_id_070A( "jeep_vehiclegate" );
    level.badguy_jeep thread maps\_vehicle::_id_9C7F( "escape" );
    level.badguy_jeep thread maps\_utility::_id_69C4( "scn_ambush_jeep_escape" );
}

ambush_streetlight()
{
    var_0 = getent( "streetlight", "targetname" );
    var_1 = getentarray( var_0.target, "targetname" );

    if ( var_1[0].classname == "script_model" )
    {
        var_2 = var_1[0].angles;
        var_3 = var_1[0].origin;
        var_1[0] delete();
        var_1[1] linkto( var_0 );
    }
    else
    {
        var_2 = var_1[1].angles;
        var_3 = var_1[1].origin;
        var_1[1] delete();
        var_1[0] linkto( var_0 );
    }

    var_4 = getvehiclenode( "streetlight_hit", "script_noteworthy" );
    var_4 waittill( "trigger" );
    var_0 rotateto( var_2, 0.3, 0, 0.1 );
    var_0 moveto( var_3, 0.3, 0, 0.1 );
    var_4 = getvehiclenode( "truck_hit", "script_noteworthy" );
    var_4 waittill( "trigger" );
    level.middle_bm21 joltbody( level.middle_bm21.origin + ( 0.0, 0.0, 64.0 ), 2 );
}

ambush_bmp_attack()
{
    self endon( "death" );
    var_0 = getent( "bmp_target", "targetname" );
    level.rear_bmp thread bmp_pan_target( var_0 );
    level.rear_bmp waittill( "turret_on_target" );

    for (;;)
    {
        level.rear_bmp fireweapon();
        wait 0.1;
    }
}

bmp_pan_target( var_0 )
{
    self setturrettargetent( var_0 );
    self waittill( "turret_on_target" );

    while ( isdefined( var_0.target ) )
    {
        wait 0.5;
        var_0 = getent( var_0.target, "targetname" );
        self setturrettargetent( var_0 );
        self waittill( "turret_on_target" );
    }
}

ambush_rockets()
{
    common_scripts\utility::_id_384A( "ambush_rocket" );
    var_0 = maps\_utility::_id_3CB4( "rocket_man" );
    var_0 = common_scripts\utility::_id_3CCB( level.rear_truck.origin, var_0 );
    var_1 = getent( "rpg_target1", "targetname" );
    var_2 = getent( "rpg_target2", "targetname" );
    var_0[0] notify( "end_patrol" );
    var_0[0] maps\_utility::_id_7E60( 1 );
    var_0[0] _meth_81a9( getnode( "bmp_attack_node", "targetname" ) );
    var_0[0] setstablemissile( 1 );
    var_0[0].goalradius = 32;
    var_0[0] _meth_816b( var_1 );
    var_0[0].a._id_7594 = 1;
    var_0[0].maxsightdistsqrd = 67108864;
    level.bmp thread destroy_rocket_target( var_0[0] );
    level.bmp maps\_vehicle::_id_4258();
    var_0[1] notify( "end_patrol" );
    var_0[1] maps\_utility::_id_7E60( 1 );
    var_0[1] _meth_81a9( getnode( "rear_truck_attack_node", "targetname" ) );
    var_0[1].goalradius = 32;
    var_0[1].ignoreall = 1;
    common_scripts\utility::_id_384A( "extra_guys_spawned" );
    var_0[1].ignoreall = 0;
    var_0[1] setstablemissile( 1 );
    var_0[1] _meth_816b( var_2 );
    var_0[1].a._id_7594 = 1;
    var_0[1].maxsightdistsqrd = 67108864;
    level.rear_truck thread destroy_rocket_target( var_0[1] );
    level.rear_truck maps\_vehicle::_id_4258();
}

destroy_rocket_target( var_0 )
{
    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( var_2 == var_0 )
        {
            common_scripts\utility::_id_383F( "ambush_start" );
            var_0 _meth_816a();
            var_0 setthreatbiasgroup( "allies" );

            if ( !var_0 is_kamarov() )
                var_0 maps\_utility::_id_8EA4();

            if ( isalive( self ) )
                self notify( "death" );

            break;
        }
    }
}

ambush_price()
{
    wait 6;
    level maps\_utility::_id_70C4( "ambush_mhp_enemyconvoy" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_nobodyfires" );
    common_scripts\utility::_id_383F( "caravan_on_the_move" );
    level thread ambush_price_leadup();
    common_scripts\utility::_id_3852( "ambush_rocket", "ambush_early_start" );
    maps\_utility::_id_070A( "ambush_attack_color_init" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_smokeem" );
    soundscripts\_snd::_id_870C( "aud_start_mix_ambush" );
    common_scripts\utility::_id_3856( "ambush_start", 3 );
    level._id_6F7C setthreatbiasgroup( "allies" );
    level.player setthreatbiasgroup( "player" );
}

ambush_price_leadup()
{
    level endon( "ambush_early_start" );
    common_scripts\utility::_id_384A( "ambush_badguy_spotted" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_targetinjeep" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_takealive" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_standby" );
    common_scripts\utility::_id_383F( "ambush_rocket" );
}

ambush_mark()
{
    common_scripts\utility::_id_384A( "takeover_fade_clear" );
    wait 2.5;
    level.mark _meth_81a7( 1 );
    level.mark.a._id_2B20 = 1;
    level.mark maps\_utility::_id_7F71( 1 );

    if ( getdvarint( "use_old_griggs_tower" ) == 1 )
    {
        level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_likeaclown" );
        level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_nothinglikerussian" );
    }
    else
        thread ambush_mark_talk_anim();

    common_scripts\utility::_id_384A( "ambush_rocket" );
    var_0 = getent( "ambush_mark_target", "targetname" );
    level.mark _meth_816b( var_0, 1 );
    common_scripts\utility::_id_3856( "ambush_start", 4 );
    level.mark _meth_816a();
    setthreatbias( "group2", "group1", 100000 );
    level.mark setthreatbiasgroup( "group1" );
    var_1 = maps\_utility::_id_3CB4( "mark_targets" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] setthreatbiasgroup( "group2" );

    common_scripts\utility::_id_384A( "ambush_truck_hit" );
    level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_hittower" );
    common_scripts\utility::_id_384A( "ambush_tower_fall" );
    level.mark setthreatbiasgroup( "oblivious" );

    if ( randomint( 2 ) )
        level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_ohno2" );
    else
        level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_ohno2" );

    level.mark maps\_utility::_id_7EAB( "sprint" );
    common_scripts\utility::_id_384A( "ambush_recovered" );
    level.mark setthreatbiasgroup( "allies" );
    level.mark.a._id_2B20 = 0;
    level.mark _meth_81a7( 0 );
    level.mark maps\_utility::_id_7F71( 0 );
}

ambush_mark_talk_anim()
{
    var_0 = spawn( "script_origin", ( -602.0, 80.0, 225.0 ) );
    var_0.angles = ( 0.0, -20.0, 0.0 );
    var_0 thread maps\_anim::_id_0BC7( level.mark, "ambush_grg_tower_talk" );
    wait 2.5;
    level.mark thread maps\_utility::_id_69C4( "ambush_grigg_tower_foley" );
    var_0 maps\_anim::_id_0C24( level.mark, "ambush_grg_tower_talk" );
    var_0 thread h1_griggs_tower_idle_thread();
    level.mark _meth_81ce( "crouch" );
    common_scripts\utility::_id_384A( "ambush_rocket" );
    level.mark _meth_81aa( level.mark.origin );
    level.mark setthreatbiasgroup( "allies" );
    level.mark _meth_856f( 1 );
    wait 1;
    level.mark _meth_8143();
    level.mark notify( "single anim", "end" );
    waittillframeend;
    level.griggs_towerfall_origin = level.mark.origin;
    level.mark _meth_81ce( "stand" );
}

h1_griggs_tower_idle_thread()
{
    level endon( "ambush_rocket" );
    var_0 = 0;
    var_1 = [ 1, 2, 3 ];

    for ( var_2 = 3; var_2 > 0; var_2-- )
    {
        var_3 = randomintrange( 0, var_2 );
        var_0 = var_1[var_3];
        var_1 = maps\_utility::_id_0CFA( var_1, var_3 );
        maps\_anim::_id_0C24( level.mark, "ambush_grg_tower_idle" + var_0 );
    }

    for (;;)
    {
        var_1 = [ 1, 2, 3 ];

        if ( var_0 == 1 )
            var_1 = maps\_utility::_id_0CFA( var_1, 0 );
        else if ( var_0 == 2 )
            var_1 = maps\_utility::_id_0CFA( var_1, 1 );
        else if ( var_0 == 3 )
            var_1 = maps\_utility::_id_0CFA( var_1, 2 );

        var_0 = randomintrange( 0, var_1.size );
        var_0 = var_1[var_0];
        maps\_anim::_id_0C24( level.mark, "ambush_grg_tower_idle" + var_0 );
    }
}

ambush_setup()
{
    common_scripts\utility::_id_384A( "takeover_briefing_done" );
    level notify( "putout_fires" );
    var_0 = getent( "player_outofsight", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    common_scripts\utility::_id_383F( "takeover_fade_clear" );
    wait 0.1;
    common_scripts\_exploder::_id_3528( 2 );
    var_1 = getnode( "startnodeprice_ambush", "targetname" );
    level._id_6F7C notify( "killanimscript" );
    level._id_6F7C _meth_81ca( var_1.origin, var_1.angles, 9999 );
    level._id_6F7C setthreatbiasgroup( "oblivious" );
    level._id_6F7C maps\_utility::_id_7E38( "o" );
    var_1 = getnode( "startnodemark_ambush", "targetname" );
    level.mark notify( "killanimscript" );
    level.mark _meth_81ca( var_1.origin, var_1.angles, 9999 );
    level.mark setthreatbiasgroup( "oblivious" );
    level.steve maps\_utility::_id_8EA4();
    level.steve delete();
    level.steve = _id_7B3C( "ambush_steve", "targetname", 1 );
    level.steve thread maps\_utility::_id_58D7();
    level.steve._id_0C72 = "steve";
    level.steve.name = "Gaz";
    level.steve thread squad_init();
    level.steve.melonhead_ignore = 1;
    level.steve.tracksuit_ignore = 1;
    level.steve codescripts\character::_id_7F88( "head_spetsnaz_assault_vlad_facemask" );
    level.steve setthreatbiasgroup( "oblivious" );
    level.steve.pacifist = 1;
    level.steve.a._id_55D7 = gettime();
    level.steve.team = "allies";
    level.steve._id_9F32 = "british";
    level.steve maps\_utility::_id_7DDF( 0 );
    level.steve.ignoreme = 1;
    level.steve.maxsightdistsqrd = 4;
    level.steve.no_ir_beacon = 1;
    var_1 = getnode( "startnodesteve_ambush", "targetname" );
    level.steve notify( "killanimscript" );
    level.steve _meth_81c9( var_1.origin, var_1.angles );
    level.steve setthreatbiasgroup( "oblivious" );
    level.steve.fixednode = 1;
    ambush_setup_enemy_allies();
    var_1 = getnode( "startnodeplayer_ambush", "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles + ( 13.0, 0.0, 0.0 ) );
    level.player setthreatbiasgroup( "oblivious" );
    maps\_utility::_id_070A( "ambush_setup_color_init" );

    if ( level.player hasweapon( "remington700" ) )
    {
        level.player takeweapon( "remington700" );
        level.player giveweapon( "rpd" );
        level.player switchtoweapon( "rpd" );
    }

    level.player setviewmodel( "viewhands_op_force" );
    level.player disableweapons();
    delete_dropped_weapons();
    clearallcorpses();
    common_scripts\utility::_id_0CDB( getentarray( "gate_open", "targetname" ), ::show );
    common_scripts\utility::_id_0CDB( getentarray( "gate_closed", "targetname" ), ::delete );
    var_2 = getaiarray( "axis", "allies" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( var_2[var_3] is_kamarov() )
            var_2[var_3] codescripts\character::_id_7F88( "head_spetsnaz_assault_vlad_facemask" );
    }

    common_scripts\utility::_id_383F( "takeover_finalized_done" );
    common_scripts\utility::_id_384A( "takeover_fade_done" );
    level.player enableweapons();
}

ambush_setup_enemy_allies()
{
    level.names_copies = [];
    var_0 = get_generic_allies();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        level.names_copies[level.names_copies.size] = var_0[var_1].name;
        var_0[var_1] maps\_utility::_id_2ACC();
        var_0[var_1] delete();
    }

    waitframe;
    common_scripts\utility::_id_0D13( getentarray( "ambush_allied_axis", "targetname" ), maps\_utility::_id_0798, ::ambush_allied_axis_spawnfunc );
    scripted_array_spawn( "ambush_allied_axis", "targetname", 1 );
    common_scripts\utility::_id_0D13( getentarray( "ambush_allied", "targetname" ), maps\_utility::_id_0798, ::ambush_allied_spawnfunc );
    scripted_array_spawn( "ambush_allied", "targetname", 1 );
}

ambush_allied_axis_spawnfunc()
{
    self setthreatbiasgroup( "oblivious" );
    self.pacifist = 1;
    self.a._id_55D7 = gettime();
    self.team = "allies";
    self._id_9F32 = "russian";
    maps\_utility::_id_7DDF( 0 );
    self.ignoreme = 1;
    self.maxsightdistsqrd = 4;
    self.no_ir_beacon = 1;
    thread maps\_utility::_id_58D7();

    if ( isdefined( self.script_noteworthy ) && self.script_noteworthy == "delay_guy" )
        thread ambush_delay();

    if ( level.names_copies.size > 0 )
    {
        self.name = level.names_copies[level.names_copies.size - 1];
        level.names_copies = common_scripts\utility::_id_0CF6( level.names_copies, self.name );
    }
    else
        maps\_names::_id_3DE2();

    thread generic_allied();
    common_scripts\utility::_id_384A( "ambush_rocket" );
    common_scripts\utility::_id_3856( "ambush_start", 2 );

    if ( ( !isdefined( self._id_792E ) || self._id_792E != "rocket_man" ) && !is_kamarov() )
        maps\_utility::_id_8EA4();

    self.pacifist = 0;
    self.ignoreme = 0;
    self.maxsightdistsqrd = 67108864;

    if ( self._id_792E == "ground_man_upper" )
    {
        self setthreatbiasgroup( "allies" );
        maps\_utility::_id_7E38( "r" );
    }

    if ( self._id_792E == "ground_man_lower" )
    {
        self setthreatbiasgroup( "allies" );
        maps\_utility::_id_7E38( "c" );
    }
}

ambush_steve()
{
    level endon( "ambush_early_start" );
    level thread ambush_steve_fight();
    level.steve.fixednode = 0;
    level.steve thread maps\_patrol::_id_66FC( "steve_ambush_patrol_node" );
    var_0 = level.steve.grenadeawareness;
    level.steve.grenadeawareness = 0;
    common_scripts\utility::_id_384A( "ambush_vehicles_inplace" );
    level.steve thread maps\_patrol::_id_66FC( "caravan_walkby" );
    var_1 = getent( "badguy_spotted", "script_noteworthy" );
    var_1 waittill( "trigger" );
    level.steve.grenadeawareness = var_0;
    level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_visualtarget" );
    common_scripts\utility::_id_383F( "ambush_badguy_spotted" );
}

ambush_steve_fight()
{
    common_scripts\utility::_id_384A( "ambush_rocket" );
    level.steve notify( "end_patrol" );
    level.steve maps\_utility::_id_7E38( "c" );
    wait 4;
    level.steve setthreatbiasgroup( "allies" );
    common_scripts\utility::_id_384A( "ambush_rear_bmp_destroyed" );
    wait 3;
    level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_gotcompany" );
}

ambush_delay()
{
    self endon( "death" );
    var_0 = getvehiclenode( "delay_node", "script_noteworthy" );
    var_0 waittill( "trigger" );
    wait 0.5;
    maps\_patrol::_id_66FC( "delay_path" );
    common_scripts\utility::_id_384A( "ambush_vehicles_inplace" );
    common_scripts\utility::_id_384A( "ambush_rocket" );
    wait 1;
    var_1 = getent( "delay_fire_target", "targetname" );
    self _meth_816b( var_1 );
    self.maxsightdistsqrd = 67108864;
    wait 1;
    self _meth_816a();
    maps\_utility::_id_7E38( "c" );
    wait 5;
    self setthreatbiasgroup( "allies" );
}

ambush_delay_dialogue()
{
    var_0 = level.middle_bm21._id_750A[0];

    if ( !isalive( var_0 ) )
        return;

    level endon( "ambush_start" );
    var_0 endon( "death" );
    self endon( "death" );
    var_0._id_0C72 = "russian";
    self._id_0C72 = "loyalist";
    maps\_anim::_id_0C21( self, "ambush_ru2_papersplease" );
    wait 0.5;
    var_0 maps\_anim::_id_0C21( var_0, "ambush_ru1_paperswhatpapers" );
    var_0 maps\_anim::_id_0C21( var_0, "ambush_ru1_fatpolitician" );
    wait 0.5;
    var_0 maps\_anim::_id_0C21( var_0, "ambush_ru1_whatareyouwaitingfor" );
    wait 0.5;
    maps\_anim::_id_0C21( self, "ambush_ru2_illdothatrightnow" );
}

ambush_allied_spawnfunc()
{
    self endon( "death" );
    thread generic_allied();
    self setthreatbiasgroup( "oblivious" );
    common_scripts\utility::_id_384A( "ambush_rocket" );
    self setthreatbiasgroup( "allies" );
}

ambush_tower_fall()
{
    var_0 = getent( "guard_tower_blocker", "script_noteworthy" );
    var_0 notsolid();
    var_1 = getent( "guard_tower", "targetname" );
    var_2 = getentarray( "guard_tower_part", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] linkto( var_1 );

    var_4 = getentarray( "guard_tower_d", "targetname" );
    common_scripts\utility::_id_0D13( var_4, ::ambush_tower_swap );
    common_scripts\utility::_id_384A( "takeover_fade_clear" );
    var_0 solid();
    common_scripts\utility::_id_384A( "takeover_fade_done" );
    var_5 = getvehiclenode( "collision_imminent", "script_noteworthy" );
    var_5 waittill( "trigger", var_6 );
    var_6 playsound( "ambush_jeep_skid" );
    common_scripts\utility::_id_383F( "ambush_truck_hit" );

    if ( getdvarint( "use_old_tower" ) != 1 )
        level.player allowlean( 0 );

    var_5 = getvehiclenode( "tower_collision", "script_noteworthy" );
    var_5 waittill( "trigger", var_6 );
    var_1 playsound( "scn_ambush_tower_crash" );
    common_scripts\_exploder::_id_3528( 3 );
    soundscripts\_snd::_id_870C( "aud_start_mix_tower_crash" );

    if ( getdvarint( "use_old_tower" ) == 1 )
        level.mark linkto( var_1 );
    else
    {
        thread ambush_tower_fall_player( var_1 );
        thread ambush_tower_fall_mark( var_1 );
    }

    common_scripts\utility::_id_383F( "ambush_tower_fall" );
    earthquake( 0.1, 0.5, level.player.origin, 400 );
    thread ambush_tower_rumble();
    level notify( "tower_fall_start" );
    var_1 rotateto( ( 5.0, 0.0, 0.0 ), 0.5, 0, 0.5 );
    wait 0.5;
    var_1 rotateto( ( 2.0, 0.0, 5.0 ), 1, 0.7, 0.3 );
    wait 1;
    var_1 rotateto( ( 0.0, 0.0, -2.0 ), 0.7, 0.5, 0.2 );
    wait 0.7;
    var_1 rotateto( ( 0.0, 20.0, 90.0 ), 1.7, 1.7, 0 );
    wait 1.65;
    level.mark unlink();
    level notify( "tower_fall_unlink" );
    common_scripts\utility::_id_383F( "player_tower_hits_ground" );
    level.player thread maps\_utility::_id_69C4( "scn_ambush_tower_end" );
    level thread ambush_tower_blackout();
    wait 1;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_2[var_3] unlink();
        var_2[var_3] delete();
    }

    var_1 delete();
    var_7 = getentarray( "guard_tower_sandbags", "targetname" );

    for ( var_3 = 0; var_3 < var_7.size; var_3++ )
        var_7[var_3] delete();

    common_scripts\utility::_id_383F( "ambush_switch_tower" );
}

ambush_tower_rumble()
{
    level.player playrumbleonentity( "generic_attack_heavy_500" );
    level.player playrumblelooponentity( "generic_quake_loop" );
    common_scripts\utility::_id_384A( "player_tower_hits_ground" );
    level.player playrumbleonentity( "generic_attack_heavy_1500" );
    level.player stoprumble( "generic_quake_loop" );
}

ambush_tower_fall_player( var_0 )
{
    level.player endon( "death" );
    level.player disableweapons();
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player setcandamage( 0 );
    level waittill( "tower_fall_start" );
    var_1 = spawn( "script_origin", level.player.origin );
    var_1.angles = ( 0, level.player.angles[1], 0 );
    var_1 linkto( var_0 );
    thread h1_towerfalling_dof();
    var_2 = maps\_utility::_id_88D1( "player_rig", var_1.origin, var_1.angles );
    var_2 hide();
    var_2 linkto( var_1 );
    var_1 thread maps\_anim::_id_0BC7( var_2, "ambush_plr_tower_fall" );
    level.player _meth_855e( var_2, "tag_player", 1, 0.4, 0.2, 0.2, 50, 50, 40, 10 );
    wait 0.4;
    var_2 show();
    var_1 thread maps\_anim::_id_0C24( var_2, "ambush_plr_tower_fall" );
    var_3 = getanimlength( level._id_78AC["player_rig"]["ambush_plr_tower_fall"] );
    var_4 = getnotetracktimes( level._id_78AC["player_rig"]["ambush_plr_tower_fall"], "rotation_start" );
    var_5 = getnotetracktimes( level._id_78AC["player_rig"]["ambush_plr_tower_fall"], "rotation_end" );
    var_6 = var_5[0] - var_4[0];
    var_7 = var_3 * var_6;
    wait 0.25;
    var_8 = var_3 * var_4[0] - 0.25;
    level.player lerpviewangleclamp( var_8, 0, 0, 20, 20, 20, 10 );
    var_2 waittillmatch( "single anim", "rotation_start" );
    var_9 = -1 * ( var_1.angles[1] - 270 );

    if ( var_9 > 180 )
        var_9 -= 360;

    var_10 = ( 0, var_9, 0 );
    var_1 _meth_8425( var_10, var_7 * 0.53, 1 );
    level.player lerpviewangleclamp( var_7 * 0.5, 0, 0, 0, 0, 0, 0 );
    level waittill( "tower_fall_unlink" );
    var_2 delete();
    level.player enableweapons();
    level.player allowcrouch( 1 );
    level.player allowprone( 1 );
    level.player setcandamage( 1 );
    level.player allowlean( 1 );
}

h1_towerfalling_dof()
{
    level.player _meth_84a5();
    level.player _meth_84a7( 2.4, 130, 1.0, 1.0 );
    setsaveddvar( "r_mbEnable", 2 );
    level waittill( "tower_fall_unlink" );
    wait 0.25;
    setsaveddvar( "r_mbEnable", 0 );
}

ambush_tower_fall_mark( var_0 )
{
    if ( getdvarint( "use_old_tower" ) == 1 )
        return;

    var_1 = spawn( "script_origin", level.griggs_towerfall_origin );
    var_1.angles = level.mark.angles;
    var_1 linkto( var_0 );
    level.mark linkto( var_1 );
    level waittill( "tower_fall_start" );
    var_2 = "ambush_grg_tower_fall_crouch";

    if ( level.mark.a._id_6E5A == "stand" )
    {
        level.mark _meth_81ce( "stand" );
        var_2 = "ambush_grg_tower_fall_stand";
    }

    var_1 maps\_anim::_id_0C29( level.mark, var_2 );
    var_1 thread maps\_anim::_id_0C24( level.mark, "ambush_grg_tower_fall" );
    level waittill( "tower_fall_unlink" );
    level.mark _meth_856e();
    level.mark _meth_81ce( "stand", "prone", "crouch" );
}

ambush_tower_swap()
{
    self hide();

    if ( self.classname == "script_brushmodel" )
    {
        self connectpaths();
        self notsolid();
    }

    common_scripts\utility::_id_384A( "ambush_switch_tower" );

    if ( self.classname == "script_brushmodel" )
    {
        self solid();
        self disconnectpaths();
    }

    self show();
}

ambush_tower_blackout()
{
    level.player setthreatbiasgroup( "oblivious" );
    var_0 = getent( "player_outofsight", "targetname" );
    level.player setorigin( var_0.origin );
    level.player setplayerangles( var_0.angles );
    level.player enableinvulnerability();
    wait 1;
    var_1 = getnode( "startnodemark_village", "targetname" );
    level.mark notify( "killanimscript" );
    level.mark _meth_81ca( var_1.origin, var_1.angles );
    var_2 = ( -439.0, -197.0, 9.0 );
    var_3 = ( -25.0, 40.0, 0.0 );
    level.player setorigin( var_2 );
    level.player setplayerangles( var_3 );
    level.player setstance( "prone" );
    level.player disableweapons();
    level.player allowstand( 0 );
    level.player allowcrouch( 0 );
    level.player freezecontrols( 1 );
    wait 1;
    common_scripts\utility::_id_383F( "ambush_tower_blackout_come_to" );
    soundscripts\_snd::_id_870C( "aud_start_mix_tower_crash_stunned" );

    if ( getdvarint( "use_old_escapecam" ) == 1 )
        thread ambush_recover();
    else
        thread ambush_recover_h1();

    wait 2;
    level.badguy_jeep notify( "unload", "all" );
    common_scripts\_exploder::_id_3528( 1 );
    wait 6.65;
    level.badguy_jeep uaz_vehicle_anims_clear();
    level.badguy_jeep notify( "death" );
    common_scripts\utility::_id_383F( "son_of_zakhaev_money_shot" );
    wait 8.35;
    level.player thread maps\_utility::_id_69C4( "scn_ambush_shellshock_out" );
    soundscripts\_snd::_id_870C( "aud_start_mix_zak_son_escape" );
    wait 2;
    level notify( "escape_cam_end" );
    level.player freezecontrols( 0 );
    level.player allowstand( 1 );
    level.player allowcrouch( 1 );
    common_scripts\utility::_id_383F( "ambush_recovered" );
    wait 2;
    level.player enableweapons();
    level.player disableinvulnerability();
    level.player setthreatbiasgroup( "player" );
}

ambush_recover_h1()
{
    level.oldnearclip = getdvar( "r_znear" );
    setsaveddvar( "r_znear", 2.0 );
    setsaveddvar( "r_mbEnable", 2 );
    var_0 = spawn( "script_origin", level.badguy_jeep gettagorigin( "tag_driver" ) );
    var_0.angles = level.badguy_jeep gettagangles( "tag_driver" );
    var_1 = maps\_utility::_id_88D1( "player_rig" );
    level.player playerlinktodelta( var_1, "tag_player", 1, 0, 0, 0, 0, 1 );
    var_0 thread maps\_anim::_id_0C24( var_1, "vip_escape_player" );
    level waittill( "escape_cam_end" );
    level.player unlink();
    var_1 delete();
    setsaveddvar( "r_znear", level.oldnearclip );
    level.oldnearclip = undefined;
    setsaveddvar( "r_mbEnable", 0 );
}

ambush_recover()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    level.player playersetgroundreferenceent( var_0 );
    var_1 = [];
    var_1[0]["angles"] = ( 10.0, -40.0, -10.0 );
    var_1[0]["time"] = ( 0.0, 0.0, 0.0 );
    var_1[1]["angles"] = ( 0.0, 25.0, 0.0 );
    var_1[1]["time"] = ( 3.3, 3.3, 0.0 );
    var_1[2]["angles"] = ( -5.0, 30.0, 3.0 );
    var_1[2]["time"] = ( 1.0, 0.0, 1.0 );
    var_1[3]["angles"] = ( -1.0, 30.0, -3.0 );
    var_1[3]["time"] = ( 3.0, 3.0, 0.0 );
    var_1[4]["angles"] = ( 0.0, 30.0, -4.0 );
    var_1[4]["time"] = ( 1.0, 0.0, 1.0 );
    var_1[5]["angles"] = ( -3.0, 28.0, -2.0 );
    var_1[5]["time"] = ( 0.65, 0.65, 0.0 );
    var_1[6]["angles"] = ( 20.0, -10.0, 15.0 );
    var_1[6]["time"] = ( 0.7, 0.0, 0.4 );
    var_1[7]["angles"] = ( 0.0, -16.0, 0.0 );
    var_1[7]["time"] = ( 4.0, 2.0, 2.0 );
    var_1[8]["angles"] = ( 10.0, -70.0, 0.0 );
    var_1[8]["time"] = ( 3.5, 2.0, 1.5 );
    var_1[9]["angles"] = ( 0.0, -20.0, 0.0 );
    var_1[9]["time"] = ( 2.0, 1.0, 0.0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = _id_085A( var_1[var_2]["angles"] );
        var_4 = var_1[var_2]["time"][0];
        var_5 = var_1[var_2]["time"][1];
        var_6 = var_1[var_2]["time"][2];

        if ( var_4 == 0 )
        {
            var_0.angles = var_3;
            continue;
        }

        var_0 rotateto( var_3, var_4, var_5, var_6 );
        var_0 waittill( "rotatedone" );
    }

    var_0 rotateto( ( 0.0, 0.0, 0.0 ), 1, 0.5, 0.5 );
    var_0 waittill( "rotatedone" );
    level.player playersetgroundreferenceent( undefined );
}

main_objective()
{
    var_0 = getent( "main_objective", "targetname" );
    objective_add( 4, "active", &"AMBUSH_OBJ_CAPTURE_TARGET", var_0.origin );
    objective_current( 4 );

    while ( isdefined( var_0.target ) )
    {
        var_0 waittill( "trigger" );

        if ( isdefined( var_0._id_79DA ) )
            common_scripts\utility::_id_384A( var_0._id_79DA );

        var_0 = getent( var_0.target, "targetname" );
        objective_position( 4, var_0.origin );
        objective_ring( 4 );
        level notify( "main_objective_updated" );
    }

    common_scripts\utility::_id_384A( "obj_flexicuff" );
    objective_string( 4, &"AMBUSH_OBJ_FLEXICUFF" );
    common_scripts\utility::_id_384A( "apartment_suicide_done" );
}

aarea_village_init()
{
    common_scripts\utility::_id_383F( "aa_hunt" );
    level thread village_nag( "village_gasstation", undefined, "ambush_mhp_wrongway", 1 );
    common_scripts\utility::_id_0D13( getentarray( "village_trigger", "script_noteworthy" ), common_scripts\utility::_id_97CE );
    getent( "badguy_village", "script_noteworthy" ) maps\_utility::_id_0798( ::badguy_spawn_function );
    getent( "badguy_village", "script_noteworthy" ) maps\_utility::_id_0798( ::village_badguy );
    maps\_utility::_id_1143( "village" );
    maps\_utility::arcademode_checkpoint( 4, 2 );
    level thread village_friendlies();
    level thread village_enemies();
    level thread main_objective();
    level thread village_helicopter();
    level thread village_price();
    level thread village_mark();
    level thread failed_to_pursue();
    level thread village_cleanup();
    common_scripts\utility::_id_3852( "village_alley", "morpheus_quick_start" );
    common_scripts\utility::_id_3831( "aa_village" );
    level thread aarea_morpheus_init();
}

village_friendlies()
{
    common_scripts\utility::_id_384A( "junkyard_exit" );
    soundscripts\_snd::_id_870C( "aud_start_ambience_war" );
    var_0 = getaiarray( "axis", "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] is_kamarov() )
            var_0[var_1] maps\_utility::_id_8EA4();
    }

    maps\_spawner::_id_533A( 1 );
    maps\_utility::_id_0CE5( getaiarray( "axis" ) );
    var_2 = get_generic_allies();

    for ( var_1 = 0; var_1 < var_2.size; var_1++ )
        var_2[var_1] delete();

    var_0 = scripted_array_spawn( "village_friendlies", "targetname" );
    common_scripts\utility::_id_0D13( var_0, ::generic_allied );
    level._id_6F7C notify( "killanimscript" );
    level._id_6F7C _meth_81c9( getnode( "village_price_teleport", "targetname" ).origin );
    level._id_6F7C maps\_utility::_id_7E38( "r" );
    level.steve maps\_utility::_id_8EA4();
    level.steve delete();
    waitframe;
    var_3 = getent( "steve", "targetname" );
    var_3.count = 1;
    level.steve = _id_7B3C( "steve", "targetname", 1 );
    level.steve thread maps\_utility::_id_58D7();
    level.steve._id_0C72 = "steve";
    level.steve.name = "Gaz";
    level.steve thread squad_init();
    level.steve notify( "killanimscript" );
    level.steve _meth_81c9( getnode( "village_steve_teleport", "targetname" ).origin );
    level.steve maps\_utility::_id_7E38( "r" );
    var_4 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_4[var_1] _meth_8168( 1 );

    common_scripts\utility::_id_0D13( get_generic_allies(), maps\_utility::_id_7402 );
    common_scripts\utility::_id_0D13( level._id_8AB0, maps\_utility::_id_30AA );
    level endon( "morpheus_quick_start" );
    level thread village_friendlies_six();
    common_scripts\utility::_id_384A( "village_badguy_escape" );
    wait 5;
    level maps\_utility::_id_70C4( "ambush_mhp_sidealley" );
    wait 3;
    common_scripts\utility::_id_383F( "village_alley" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_goafterhim" );
    level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_soapgoalley" );
    level.mark thread village_nag( undefined, 25, "ambush_grg_thisway" );
    level thread village_nag( undefined, 12, "ambush_mhp_cuthrualley", 1 );
    level thread village_nag( "village_wrong_way", undefined, "ambush_mhp_wrongway", 1 );
    level thread village_nag( "village_past_alley", undefined, "ambush_mhp_passedalley", 1, "village_wrong_way" );
}

village_nag( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "morpheus_quick_start" );

    if ( isdefined( var_4 ) )
        level endon( var_4 );

    if ( isdefined( var_0 ) )
        common_scripts\utility::_id_384A( var_0 );

    if ( isdefined( var_1 ) )
        wait(var_1);

    if ( isdefined( var_3 ) )
        level maps\_utility::_id_70C4( var_2 );
    else
        maps\_anim::_id_0C21( self, var_2 );
}

village_friendlies_six()
{
    level endon( "village_badguy_escape" );
    var_0 = getent( "friendlies_arriving", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 != level.mark )
            break;
    }

    level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_friendliessixoclock" );
}

village_enemies()
{
    common_scripts\utility::_id_0D13( getentarray( "village_force", "script_noteworthy" ), maps\_utility::_id_0798, ::village_enemies_spawn_function );
    level thread village_bmp();
    common_scripts\utility::_id_384A( "village_defend" );
    maps\_utility::_id_070A( "village_defend_color_init" );
    common_scripts\utility::_id_384A( "village_retreat" );
    wait 3;
    maps\_utility::_id_070A( "village_retreat_1_color_init" );

    while ( !common_scripts\utility::_id_382E( "village_force_escape" ) && maps\_utility::_id_3CB5( "village_force" ) > 4 )
        wait 0.05;

    for ( var_0 = 0; !common_scripts\utility::_id_382E( "village_force_escape" ) && enemies_close( 512 ) && var_0 > 10; var_0++ )
        wait 1;

    common_scripts\utility::_id_383F( "village_badguy_escape" );
    maps\_utility::_id_070A( "village_retreat_2_color_init" );
    var_1 = getentarray( "village_second_force", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_1, maps\_utility::_id_0706 );
}

enemies_close( var_0 )
{
    var_1 = getaiarray( "axis" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( distance2d( level.player.origin, var_1[var_2].origin ) < var_0 )
            return 1;
    }

    return 0;
}

village_bmp()
{
    var_0 = maps\_vehicle::waittill_vehiclespawn( "village_bmp" );
    var_0 waittill( "reached_end_node" );
    var_0 thread vehicle_turret_think();
}

village_enemies_spawn_function()
{
    self endon( "death" );
    thread village_enemies_allert();
    self setthreatbiasgroup( "oblivious" );
    common_scripts\utility::_id_384A( "village_defend" );
    self setthreatbiasgroup( "axis" );
}

village_enemies_allert()
{
    level endon( "village_approach" );
    self waittill( "damage" );
    common_scripts\utility::_id_383F( "village_approach" );
}

village_badguy()
{
    maps\_utility::_id_7E45( "sprint" );
    self._id_5F65 = 1.2;
    setignoremegroup( "allies", "badguy" );
    setignoremegroup( "player", "badguy" );
    common_scripts\utility::_id_384A( "village_approach" );
    common_scripts\utility::_id_3831( "aa_hunt" );
    common_scripts\utility::_id_383F( "aa_village" );
    common_scripts\utility::_id_383F( "village_defend" );
    wait 3;
    setthreatbias( "player", "badguy", 0 );
    setthreatbias( "allies", "badguy", 0 );
    var_0 = getnode( "badguy_village_retreat_node", "targetname" );
    set_goalnode( var_0 );
    common_scripts\utility::_id_384A( "village_badguy_escape" );
    var_0 = getnode( "badguy_village_delete_node", "targetname" );
    set_goalnode( var_0 );
    self waittill( "goal" );
    self notify( "stop_death_fail" );
    self delete();
}

badguy_health_shield()
{
    var_0 = 1000000;
    self.health += var_0;
    self endon( "stop_death_fail" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( isplayer( var_2 ) )
        {
            if ( self.health < var_0 )
                break;
        }
    }

    self.health = 150;
}

village_mark()
{
    maps\_utility::_id_070A( "village_color_init" );
    maps\_utility::_id_A066( "junkyard_dog" );
    maps\_utility::_id_070A( "dog_dead_color_init" );
    wait 1.5;
    level.mark thread maps\_anim::_id_0C21( level.mark, "ambush_grg_downboy" );
    common_scripts\utility::_id_384A( "village_defend" );
    level.mark maps\_utility::_id_1ED1();
}

village_helicopter()
{
    common_scripts\utility::_id_384A( "village_helicopter_greeting" );
    wait 1;
    level thread maps\_utility::_id_70C4( "ambush_mhp_jmovesfast" );
    wait 5;
    level thread maps\_utility::_id_70C4( "ambush_mhp_junkyard" );
    common_scripts\utility::_id_384A( "junkyard_exit" );
    level.helicopter thread maps\_utility::_id_69C4( "scn_ambush_heli_village_flyby" );
    level maps\_utility::_id_70C4( "ambush_mhp_cityoutskirts" );
    common_scripts\utility::_id_384A( "village_road" );
    level maps\_utility::_id_70C4( "ambush_mhp_hostileforces" );
    soundscripts\_snd::_id_870C( "aud_russian_battle_chatter" );
    common_scripts\utility::_id_384A( "village_retreat" );
    level maps\_utility::_id_70C4( "ambush_mhp_checkyourfire" );
}

village_price()
{
    level endon( "morpheus_quick_start" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_runforit" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_chasehim" );
    common_scripts\utility::_id_383F( "village_helicopter_greeting" );
    var_0 = maps\_utility::_id_3F83( "auto300", "targetname" );
    var_0 thread maps\ambush_aud::aud_dog_sequence();
}

village_cleanup()
{
    thread bugfix_failsafe_triggerflag_morpheus_rpg();
    common_scripts\utility::_id_384A( "morpheus_rpg" );
    level._id_6F7C maps\_utility::_id_8EA4();
    level._id_6F7C maps\_utility::_id_2ACC();
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] == level.mark || var_0[var_1] == level.steve )
        {
            var_0[var_1] _meth_8168( 0 );
            continue;
        }

        var_0[var_1] maps\_utility::_id_2ACC();
        var_0[var_1] delete();
    }

    var_2 = maps\_utility::_id_3CB4( "village_force" );
    var_2 = maps\_utility::_id_0CF2( var_2, maps\_utility::_id_3CB4( "village_enemy" ) );
    var_2 = maps\_utility::_id_0CF2( var_2, maps\_utility::_id_3CB4( "village_dog" ) );
    maps\_utility::_id_0CE5( var_2 );
}

aarea_morpheus_init()
{
    maps\_utility::_id_1151( "morpheus", 10 );
    common_scripts\utility::_id_383F( "aa_morpheus" );
    common_scripts\utility::_id_383F( "village_alley" );
    level thread fall_death();
    var_0 = get_generic_allies();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] maps\_utility::_id_2ACC();

    level.steve maps\_utility::_id_7E38( "g" );
    maps\_utility::_id_070A( "morpheus_color_init" );
    level.steve thread morpheus_allies();
    level.mark thread morpheus_allies();
    setsaveddvar( "ai_friendlyFireBlockDuration", 0 );
    morpheus_sets();
    common_scripts\utility::_id_384A( "morpheus_dumpster" );
    setsaveddvar( "ai_friendlyFireBlockDuration", level.ai_friendlyfireblockduration );
    common_scripts\utility::_id_384A( "apartment_start" );
    setsaveddvar( "ai_friendlyFireBlockDuration", 500 );
    common_scripts\utility::_id_3831( "aa_morpheus" );
    level thread aarea_apartment_init();
}

morpheus_allies()
{
    maps\_utility::_id_7E60( 1 );
    self.a._id_2B20 = 1;
    self setthreatbiasgroup( "oblivious" );
    common_scripts\utility::_id_384A( "morpheus_dumpster" );
    maps\_utility::_id_7E60( 0 );
    self.a._id_2B20 = 0;
    self setthreatbiasgroup( "allies" );
}

morpheus_sets()
{
    common_scripts\utility::_id_0D13( getentarray( "iron_fence_guy", "script_noteworthy" ), maps\_utility::_id_0798, ::morpheus_iron_fence_spawn_function );
    level thread morpheus_iron_fence();
    level thread morpheus_flanker();
    level thread morpheus_rpg();
    level thread morpheus_2nd_floor();
    level thread morpheus_single();
    level thread morpheus_alley();
}

morpheus_completion( var_0, var_1 )
{
    level endon( "new_morpheus_set" );
    level waittill( var_0 );
    level thread maps\_utility::_id_70C4( var_1 );
}

morpheus_dumpster()
{
    common_scripts\utility::_id_384A( "morpheus_dumpster" );
    level notify( "new_morpheus_set" );
    level thread morpheus_completion( "morpheus_dumpster_complete", "ambush_mhp_gotem" );
    maps\_utility::_id_A066( "dumpster_front_guy" );

    if ( common_scripts\utility::_id_382E( "morpheus_green_car" ) )
        return;

    level thread maps\_utility::_id_70C4( "ambush_mhp_dumpster" );
    var_0 = maps\_utility::_id_3CB4( "dumpster_guy" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] setthreatbiasgroup( "axis" );

    level thread morpheus_dumpster_clear( "morpheus_dumpster_complete" );
    level endon( "morpheus_dumpster_clear" );
    maps\_utility::_id_A066( "dumpster_guy" );
    level notify( "morpheus_dumpster_complete" );
}

morpheus_dumpster_clear( var_0 )
{
    level endon( var_0 );
    common_scripts\utility::_id_384A( "morpheus_iron_fence" );
    common_scripts\utility::_id_0D13( maps\_utility::_id_3CB4( "dumpster_guy" ), maps\_utility::_id_7C71 );
    level notify( "morpheus_dumpster_clear" );
}

morpheus_iron_fence()
{
    common_scripts\utility::_id_384A( "morpheus_iron_fence" );
    level notify( "new_morpheus_set" );
    level thread morpheus_completion( "morpheus_iron_fence_complete", "ambush_mhp_goodkill" );
    level thread maps\_utility::_id_70C4( "ambush_mhp_ironfence" );
    level thread morpheus_iron_fence_fight();
    common_scripts\utility::_id_384A( "morpheus_iron_fence_fight" );
    maps\_utility::_id_070A( "iron_fence_color_init" );
}

morpheus_iron_fence_fight()
{
    level endon( "morpheus_iron_fence_fight" );
    level thread set_flag_on_player_action( "morpheus_iron_fence_fight", 1, 1 );
    var_0 = getent( "fight_timeout_trigger", "targetname" );
    var_0 waittill( "trigger" );
    var_0 = getent( "fight_trigger", "targetname" );
    var_0 maps\_utility::_id_9FC8( 1 );
    common_scripts\utility::_id_383F( "morpheus_iron_fence_fight" );
}

morpheus_iron_fence_spawn_function()
{
    if ( common_scripts\utility::_id_382E( "morpheus_iron_fence_fight" ) )
        return;

    self setthreatbiasgroup( "oblivious" );
    self.fixednode = 1;
    self endon( "death" );
    common_scripts\utility::_id_384A( "morpheus_iron_fence_fight" );
    randomfloatrange( 0.5, 1.5 );
    self setthreatbiasgroup( "axis" );
    self.fixednode = 0;
}

morpheus_flanker()
{
    common_scripts\utility::_id_384A( "morpheus_flanker" );
    level notify( "new_morpheus_set" );

    if ( !maps\_utility::_id_3CB5( "flanker" ) )
        return;

    common_scripts\utility::_id_384A( "morpheus_iron_fence_fight" );
    level thread morpheus_completion( "morpheus_flanker_complete", "ambush_mhp_gotem" );
    level thread maps\_utility::_id_70C4( "ambush_mhp_rightflank" );
    level thread morpheus_flanker_clear( "morpheus_flanker_complete" );
    level endon( "morpheus_flanker_clear" );
    wait 1;
    maps\_utility::_id_070A( "morpheus_flanker_color_init" );
    maps\_utility::_id_A066( "flanker" );
    level notify( "morpheus_flanker_complete" );
}

morpheus_flanker_clear( var_0 )
{
    level endon( var_0 );
    wait 10;
    level notify( "morpheus_flanker_clear" );
}

morpheus_rpg()
{
    thread bugfix_failsafe_triggerflag_morpheus_rpg();
    common_scripts\utility::_id_384A( "morpheus_rpg" );
    level notify( "new_morpheus_set" );
    level thread morpheus_completion( "morpheus_rpg_complete", "ambush_mhp_niceone" );
    level thread morpheus_rpg_dialogue();
    level thread morpheus_rpg_clear( "morpheus_rpg_complete" );
    level endon( "morpheus_rpg_clear" );
    maps\_utility::_id_A066( "roof_guy" );
    level notify( "morpheus_rpg_complete" );
}

morpheus_rpg_dialogue()
{
    level maps\_utility::_id_70C4( "ambush_mhp_rooftops" );
    level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_movementroof" );
}

morpheus_rpg_clear( var_0 )
{
    level endon( var_0 );
    var_1 = getent( "morpheus_rpg_clear", "targetname" );
    var_1 waittill( "trigger" );
    common_scripts\utility::_id_0D13( maps\_utility::_id_3CB4( "roof_guy" ), maps\_utility::_id_7C71 );
    level notify( "morpheus_rpg_clear" );
}

morpheus_2nd_floor()
{
    common_scripts\utility::_id_384A( "morpheus_2nd_floor" );
    level notify( "new_morpheus_set" );
    maps\_utility::_id_070A( "roof_guy_spawn_trigger" );
    level thread morpheus_completion( "morpheus_2nd_floor_complete", "ambush_mhp_gotem" );
    level thread maps\_utility::_id_70C4( "ambush_mhp_secondfloor" );
    level thread morpheus_2nd_floor_clear( "morpheus_2nd_floor_complete" );
    level endon( "morpheus_2nd_floor_clear" );
    maps\_utility::_id_A066( "floor_guy" );
    level notify( "morpheus_2nd_floor_complete" );
}

morpheus_2nd_floor_clear( var_0 )
{
    level endon( var_0 );
    var_1 = getent( "morpheus_rpg_clear", "targetname" );
    var_1 waittill( "trigger" );
    common_scripts\utility::_id_0D13( maps\_utility::_id_3CB4( "floor_guy" ), maps\_utility::_id_7C71 );
    level notify( "morpheus_2nd_floor_clear" );
}

morpheus_single()
{
    common_scripts\utility::_id_384A( "morpheus_single" );
    level notify( "new_morpheus_set" );
    level thread morpheus_single_dialogue();
    level thread morpheus_single_clear( "morpheus_single_complete" );
    level endon( "morpheus_single_clear" );
    maps\_utility::_id_A066( "single_guy" );
    level notify( "morpheus_single_complete" );
}

morpheus_single_dialogue()
{
    level maps\_utility::_id_70C4( "ambush_mhp_overturneddump" );
    level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_bydumpster" );
}

morpheus_single_clear( var_0 )
{
    level endon( var_0 );
    var_1 = getent( "morpheus_single_clear", "targetname" );
    var_1 waittill( "trigger" );
    common_scripts\utility::_id_0D13( maps\_utility::_id_3CB4( "single_guy" ), maps\_utility::_id_7C71 );
    level notify( "morpheus_single_clear" );
}

morpheus_target()
{
    common_scripts\utility::_id_384A( "morpheus_target" );
    level notify( "new_morpheus_set" );
    maps\_utility::_id_A066( "single_guy" );
    common_scripts\utility::_id_384A( "morpheus_target_moving" );
    level thread maps\_utility::_id_70C4( "ambush_mhp_deadahead" );
    setignoremegroup( "allies", "badguy" );
    setignoremegroup( "player", "badguy" );
    var_0 = _id_7B3C( "badguy_runby", "targetname" );
    var_0 badguy_spawn_function();
    var_0._id_5F65 = 0.64;
    var_0 waittill( "goal" );
    var_0 notify( "stop_death_fail" );
    var_0 delete();
}

morpheus_alley()
{
    common_scripts\utility::_id_384A( "morpheus_alley" );
    level notify( "new_morpheus_set" );
    level thread morpheus_completion( "morpheus_alley_complete", "ambush_mhp_allclear" );
    level thread maps\_utility::_id_70C4( "ambush_mhp_alleyleft" );
    level thread morpheus_alley_clear( "morpheus_alley_complete" );
    level endon( "morpheus_alley_clear" );
    common_scripts\utility::_id_384A( "morpheus_green_car" );
    level thread maps\_utility::_id_70C4( "ambush_mhp_greencar" );
    maps\_utility::_id_A066( "alley_guy" );
    level notify( "morpheus_alley_complete" );
}

morpheus_alley_clear( var_0 )
{
    level endon( var_0 );
    var_1 = getent( "morpheus_alley_clear", "targetname" );
    var_1 waittill( "trigger" );
    common_scripts\utility::_id_0D13( maps\_utility::_id_3CB4( "alley_guy" ), maps\_utility::_id_7C71 );
    level notify( "morpheus_alley_clear" );
}

detonate_car_setup()
{
    var_0 = getentarray( "destructible", "targetname" );
    common_scripts\utility::_id_0D13( getentarray( "detonate_car", "targetname" ), ::detonate_car, var_0 );
}

detonate_car( var_0 )
{
    level endon( "apartment_mg_destroyed" );
    var_1 = getent( self.target, "targetname" );
    var_2 = common_scripts\utility::_id_3F33( var_1.origin, var_0 );
    self waittill( "trigger" );
    var_2 common_scripts\_destructible::_id_3995();
}

aarea_apartment_init()
{
    common_scripts\utility::_id_383F( "aa_apartment" );
    maps\_utility::_id_1143( "apartment_start" );
    maps\_utility::arcademode_checkpoint( 4, 4 );
    var_0 = getaiarray( "axis" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1]._id_792E ) && var_0[var_1]._id_792E == "alley_guy" )
            continue;

        var_0[var_1] delete();
    }

    level thread apartment_dialogue();
    level thread apartment_slowdown();
    level thread apartment_badguy();
    level thread apartment_friendlies();
    level thread apartment_mg_nest();
    level thread apartment_helicopter();
    level thread apartment_mg_nest_2();

    if ( getdvar( "old_friendlies_path_to_roof" ) != "1" )
        level thread apartment_teleport_roof_friendlies();

    level thread apartment_suicide();
    common_scripts\utility::_id_0D13( getentarray( "apartment_heli_damage_trig", "targetname" ), ::apartment_heli_damage_trig_think );
    common_scripts\utility::_id_384A( "apartment_inside" );
    maps\_utility::_id_1143( "inside" );
    common_scripts\utility::_id_384A( "apartment_badguy_3rd_flr" );
    wait 4;
    maps\_utility::_id_1143( "stairs" );
    common_scripts\utility::_id_384A( "apartment_roof" );
    maps\_utility::_id_1143( "roof" );
    common_scripts\utility::_id_384A( "mission_done" );
    common_scripts\utility::_id_3831( "aa_apartment" );
    maps\_utility::_id_60D6();
}

apartment_slowdown()
{
    common_scripts\utility::_id_384A( "apartment_roof_friendlies" );
    level.player thread set_playerspeed( 130, 6 );
    common_scripts\utility::_id_384A( "apartment_roof" );
    var_0 = getaiarray( "allies" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1].a._id_135B = 1;

        if ( maps\_utility::_id_503B( level._id_8AB0, var_0[var_1] ) )
            continue;

        var_0[var_1] maps\_utility::_id_30B0();
    }
}

apartment_helicopter()
{
    common_scripts\utility::_id_384A( "apartment_heli_attack" );
    maps\_spawner::_id_533A( 6 );
    var_0 = getent( "heli_mg_nest_aim_point", "targetname" );
    level.helicopter thread apartment_helicopter_turret( var_0, undefined, 300 );
    var_1 = maps\_utility::_id_3CB4( "fifthfloor_guy" );
    common_scripts\utility::_id_0D13( var_1, ::rail_guy_fall_on_death );
    soundscripts\_snd::_id_870C( "aud_start_mix_heli_1st_turret" );
    var_2 = common_scripts\utility::_id_40FB( "helicopter_fire", "script_noteworthy" );
    var_2 waittill( "trigger" );
    common_scripts\utility::_id_383F( "apartment_heli_firing" );
    common_scripts\_exploder::_id_3528( 5 );
    var_3 = getent( "mg_destroyed", "script_noteworthy" );
    var_3 waittill( "trigger" );
    wait 1;
    var_3 thread maps\_utility::_id_69C4( "scn_ambush_turret1_explo_default" );
    common_scripts\utility::_id_383F( "apartment_mg_destroyed" );
    wait 2;
    soundscripts\_snd::_id_870C( "aud_stop_mix_heli_1st_turret" );
    common_scripts\utility::_id_384A( "apartment_inside" );
    var_0 = getent( "heli_ambient_targets", "targetname" );
    level.helicopter thread apartment_helicopter_ambient_turret( var_0, 100 );
    wait_ambient_turret_end();
    level notify( "ambient_turret_end" );
    common_scripts\utility::_id_3831( "apartment_heli_firing" );
    common_scripts\utility::_id_384A( "apartment_mg_4th_flr" );
    var_0 = getent( "heli_mg_nest_aim_point_2", "targetname" );
    level.helicopter thread apartment_helicopter_turret( var_0, 1, 100 );
    soundscripts\_snd::_id_870C( "aud_start_mix_heli_2nd_turret" );
    wait 4;
    common_scripts\utility::_id_383F( "apartment_heli_firing" );
    common_scripts\_exploder::_id_3528( 6 );
    maps\_spawner::_id_533A( 7 );
    var_3 = getent( "mg_destroyed_2", "script_noteworthy" );
    var_3 waittill( "trigger" );
    wait 1;
    var_3 thread maps\_utility::_id_69C4( "scn_ambush_turret2_explo_default" );
    common_scripts\utility::_id_383F( "apartment_mg_destroyed_2" );
    wait 2;
    soundscripts\_snd::_id_870C( "aud_stop_mix_heli_2nd_turret" );
    maps\_utility::_id_A066( "fourthfloor_guy" );
    common_scripts\utility::_id_383F( "apartment_clear" );
    level.helicopter thread apartment_helicopter_rooftop_turret();
    level maps\_utility::_id_70C4( "ambush_mhp_goodtogo" );
}

apartment_heli_damage_trig_think()
{
    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( isdefined( var_1.classname ) && var_1.classname == "misc_turret" )
            break;
    }

    common_scripts\_exploder::_id_3528( self.script_noteworthy );
    self delete();
}

rail_guy_fall_on_death()
{
    self waittill( "death" );

    if ( getdvarint( "ragdoll_enable" ) )
    {
        switch ( randomint( 3 ) )
        {
            case 0:
                self._id_2652 = %death_explosion_run_f_v1;
                break;
            case 1:
                self._id_2652 = %death_explosion_run_f_v2;
                break;
            case 2:
                self._id_2652 = %death_explosion_run_f_v3;
                break;
        }
    }
    else
        self._id_2652 = %exposed_death_blowback;

    var_0 = spawn( "script_origin", self.origin );
    var_0 linkto( self );
    var_0 playsound( "ambush_guy_falling_rail", "vo_end" );
    var_0 waittill( "vo_end" );
    wait 0.05;
    var_0 delete();
}

apartment_helicopter_turret_guy()
{
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 character\character_sp_opforce_geoff::main();
    var_0._id_0C72 = "generic";
    var_0 useanimtree( #animtree );
    var_0 linkto( self, "tag_origin", ( 0.0, -32.0, -25.0 ), ( 0.0, 90.0, 0.0 ) );
    level._id_78AC["generic"]["crouch_shoot"] = %crouch_shoot_straight;
    maps\_anim::_id_0BCC( var_0, "crouch_shoot" );
    self waittill( "death" );
    var_0 delete();
}

wait_ambient_turret_end()
{
    level endon( "apartment_badguy_3rd_flr" );
    maps\_utility::_id_A066( "apartment_main_force" );
}

apartment_helicopter_ambient_turret( var_0, var_1 )
{
    level notify( "remove_old_turret" );
    var_2 = spawnturret( "misc_turret", ( 0.0, 0.0, 0.0 ), "heli_minigun_noai" );
    var_2 setmodel( "cod3mg42" );
    var_2.team = "allies";
    var_2 linkto( level.helicopter, "tag_detach", ( 0.0, 120.0, 10.0 ), ( 0.0, 0.0, 0.0 ) );
    var_2 thread apartment_helicopter_turret_guy();
    var_2 makeunusable();
    var_2 setmode( "manual" );
    var_2 setturretteam( "allies" );
    var_3 = var_0;
    var_4 = spawn( "script_origin", var_3.origin );
    var_2 settargetentity( var_4 );
    var_2._id_91A0 = var_4;
    wait 2;
    var_2 thread manual_mg_fire( 6, 0.5, 3, level._effect["apartment_heli_fire_shell"] );
    var_2 startfiring();
    var_2 apartment_helicopter_ambient_turret_track( var_3, var_4, var_1 );
    var_2 notify( "stop_firing" );
    var_2 stopfiring();
    level waittill( "remove_old_turret" );
    var_2 delete();
}

apartment_helicopter_ambient_turret_track( var_0, var_1, var_2 )
{
    level endon( "ambient_turret_end" );

    while ( isdefined( var_0.target ) )
    {
        var_0 = getent( var_0.target, "targetname" );
        var_3 = distance( var_0.origin, var_1.origin );
        var_4 = var_3 / var_2;
        var_1 moveto( var_0.origin, var_4 );
        var_1 waittill( "movedone" );
        var_0 notify( "trigger" );
        var_0 maps\_utility::script_delay();
    }
}

apartment_helicopter_turret( var_0, var_1, var_2 )
{
    level notify( "remove_old_turret" );
    var_3 = spawnturret( "misc_turret", ( 0.0, 0.0, 0.0 ), "heli_minigun_noai" );
    var_3 setmodel( "cod3mg42" );
    var_3.team = "allies";

    if ( isdefined( var_1 ) )
        var_3 linkto( level.helicopter, "tag_detach", ( 0.0, 120.0, 10.0 ), ( 0.0, 0.0, 0.0 ) );
    else
        var_3 linkto( level.helicopter, "tag_detach", ( 0.0, 12.0, 10.0 ), ( 0.0, 180.0, 0.0 ) );

    var_3 thread apartment_helicopter_turret_guy();
    var_3 makeunusable();
    var_3 setmode( "manual" );
    var_3 setturretteam( "allies" );
    var_4 = var_0;
    var_5 = spawn( "script_origin", var_4.origin );
    var_3 settargetentity( var_5 );
    var_3._id_91A0 = var_5;
    common_scripts\utility::_id_384A( "apartment_heli_firing" );
    var_3 thread manual_mg_fire( 6, 0.5, 3, level._effect["apartment_heli_fire_shell"] );
    var_3 startfiring();
    thread common_scripts\utility::play_loopsound_in_space_with_end( "scn_minigun_shell_lp", ( -4802.8, -8288.6, 38.0 ), "stop_shell_snd" );
    var_3 apartment_helicopter_turret_mg_nest( var_4, var_5, var_2 );
    var_3 notify( "stop_firing" );
    var_3 stopfiring();
    maps\_utility::_id_61FD( "stop_shell_snd", 0.75 );
    thread common_scripts\utility::_id_69C2( "scn_minigun_shell_tl", ( -4802.8, -8288.6, 38.0 ) );
    level waittill( "remove_old_turret" );
    var_3 delete();
}

apartment_helicopter_turret_mg_nest( var_0, var_1, var_2 )
{
    while ( isdefined( var_0.target ) )
    {
        var_0 = getent( var_0.target, "targetname" );
        var_3 = distance( var_0.origin, var_1.origin );
        var_4 = var_3 / var_2;
        var_1 moveto( var_0.origin, var_4 );
        var_1 waittill( "movedone" );
        var_0 notify( "trigger" );
        var_0 maps\_utility::script_delay();
    }

    if ( !common_scripts\utility::_id_382E( "apartment_inside" ) )
        var_5 = "fifthfloor_guy";
    else
        var_5 = "fourthfloor_guy";

    for ( var_6 = maps\_utility::_id_3CB4( var_5 ); isdefined( var_6 ) && var_6.size; var_6 = maps\_utility::_id_3CB4( var_5 ) )
    {
        self settargetentity( var_6[0] );
        var_6[0] waittill( "death" );
    }
}

apartment_helicopter_rooftop_turret()
{
    common_scripts\utility::_id_384A( "apartment_roof" );
    level notify( "remove_old_turret" );
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 character\character_sp_opforce_geoff::main();
    var_0._id_0C72 = "generic";
    var_0 useanimtree( #animtree );
    var_0 linkto( level.helicopter, "tag_detach", ( -15.0, 45.0, -13.0 ), ( 0.0, 270.0, 0.0 ) );
    level._id_78AC["generic"]["crouch_shoot"] = %crouch_shoot_straight;
    var_0 maps\_anim::_id_0BCC( var_0, "crouch_shoot" );
    var_1 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_1 setmodel( "weapon_m4" );
    var_1 linkto( var_0, "tag_weapon_right", ( 1.0, 0.0, 3.0 ), ( 0.0, 0.0, 0.0 ) );
}

apartment_friendlies()
{
    common_scripts\utility::_id_384A( "apartment_mg_destroyed" );
    maps\_utility::_id_070A( "apartment_entry_color_init" );
}

apartment_badguy()
{
    common_scripts\utility::_id_384A( "apartment_start" );
    common_scripts\utility::_id_3856( "apartment_badguy_run", 5 );
    common_scripts\utility::_id_383F( "apartment_badguy_run" );
    maps\_utility::_id_0709( "spawn_mg_nest_ai" );
    common_scripts\utility::_id_383F( "apartment_fire" );
    var_0 = _id_7B3C( "badguy_apartment", "targetname", 1 );
    level.badguy = var_0;
    var_0 badguy_spawn_function();
    var_0 notify( "stop_proximity_kill" );
    setignoremegroup( "allies", "badguy" );
    setignoremegroup( "player", "badguy" );
    common_scripts\utility::_id_384A( "apartment_mg_destroyed" );
    var_0 set_goalnode( getnode( "badguy_attack_node", "targetname" ) );
    common_scripts\utility::_id_384A( "apartment_badguy_attack" );
    setthreatbias( "player", "badguy", 0 );
    setthreatbias( "allies", "badguy", 0 );
    wait 1;
    setignoremegroup( "allies", "badguy" );
    setignoremegroup( "player", "badguy" );
    var_0 set_goalnode( getnode( "badguy_third_floor_node", "targetname" ) );
    wait 3;
    var_0 maps\_utility::_id_920E( getnode( "badguy_third_floor_node", "targetname" ) );
    common_scripts\utility::_id_384A( "apartment_badguy_3rd_flr" );
    var_0 set_goalnode( getnode( "badguy_4th_floor_node", "targetname" ) );
    common_scripts\utility::_id_384A( "apartment_roof" );
    var_0 set_goalnode( getnode( "badguy_roof_node", "targetname" ) );
}

badguy_immune_to_everything_but_player()
{
    var_0 = 1000000;
    self.health += var_0;
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2 );

        if ( isdefined( var_2 ) && var_2 == level.player )
        {
            if ( self.health < var_0 )
                self kill( self.origin, level.player );

            continue;
        }

        self.health += var_1;
    }
}

suicide_badguy_h1()
{
    var_0 = _id_7B3C( "badguy_apartment", "targetname", 1 );
    level.badguy = var_0;
    var_0 badguy_spawn_function();
    var_0 notify( "stop_proximity_kill" );
    setignoremegroup( "allies", "badguy" );
    setignoremegroup( "player", "badguy" );
    var_1 = getnode( "badguy_roof_node", "targetname" );
    var_0 _meth_81ca( var_1.origin );
    var_0 set_goalnode( var_1 );
}

apartment_dialogue()
{
    level maps\_utility::_id_70C4( "ambush_mhp_fivestory" );
    common_scripts\utility::_id_384A( "apartment_fire" );
    common_scripts\utility::_id_383F( "apartment_heli_attack" );
    level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_heavyfire" );
    level maps\_utility::_id_70C4( "ambush_mhp_firstonefree" );
    common_scripts\utility::_id_384A( "apartment_mg_destroyed" );
    var_0 = maps\_utility::_id_3CB4( "fifthfloor_guy" );
    maps\_utility::_id_A07E( var_0 );
    level maps\_utility::_id_70C4( "ambush_mhp_goodtogo" );
    level maps\_utility::_id_70C4( "ambush_mhp_visual" );
    level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_fivestory" );
    common_scripts\utility::_id_384A( "apartment_badguy_attack" );
    wait 6;
    level maps\_utility::_id_70C4( "ambush_mhp_northeast" );
    common_scripts\utility::_id_384A( "apartment_badguy_3rd_flr" );
    level maps\_utility::_id_70C4( "ambush_mhp_staircase" );
    common_scripts\utility::_id_384A( "apartment_mg_4th_flr" );
    level maps\_utility::_id_70C4( "ambush_mhp_deeperinto" );
    level maps\_utility::_id_70C4( "ambush_mhp_holdon" );
    common_scripts\utility::_id_384A( "apartment_mg_destroyed_2" );
    level.mark maps\_utility::_id_2A8D();
    level.steve maps\_utility::_id_2A8D();
    common_scripts\utility::_id_384A( "apartment_roof" );
    level thread maps\_utility::_id_70C4( "ambush_mhp_movementroof" );
    wait 3;
    level.mark maps\_utility::_id_30B0();
    level.steve maps\_utility::_id_30B0();
    level maps\_utility::_id_70C4( "ambush_mhp_onroof" );
}

apartment_mg_nest()
{
    var_0 = getent( "apartment_manual_mg", "targetname" );
    var_0.team = "axis";
    var_1 = getent( "mg_player_kill", "targetname" );
    var_2 = getent( "mg_player_target", "targetname" );
    var_0 thread apartment_mg_killzone( var_1, var_2, "apartment_mg_destroyed" );
    var_3 = getent( "mg_nest_damage_trigger", "targetname" );
    level thread apartment_mg_nest_player_damage( "apartment_mg_destroyed", var_3, 600 );
    var_4 = getentarray( "sandbag", "targetname" );
    common_scripts\utility::_id_0D13( var_4, ::apartment_mg_nest_sandbag );
    common_scripts\utility::_id_384A( "apartment_fire" );
    var_0 thread manual_mg_fire( 3, 1 );
    var_0 thread apartment_mg_nest_heli();
    common_scripts\utility::_id_384A( "apartment_mg_destroyed" );
    var_0 notify( "stop_targeting" );
    var_0 notify( "stop_firing" );
    var_5 = spawn( "script_model", var_0.origin );
    var_5.angles = var_0.angles;
    var_5 setmodel( var_0.model );
    var_0 hide();
    wait 0.9;
    var_5 physicslaunch( var_5.origin + ( 0.0, -50.0, 0.0 ), ( 0.0, 600.0, 0.0 ) );
    common_scripts\utility::_id_384A( "apartment_inside" );
    var_6 = maps\_utility::_id_3CB4( "fifthfloor_guy" );
    common_scripts\utility::_id_0D13( var_6, maps\_utility::_id_7C71 );
}

apartment_mg_nest_heli()
{
    level endon( "apartment_mg_destroyed" );
    common_scripts\utility::_id_384A( "apartment_heli_firing" );
    wait 2;
    self notify( "stop_targeting" );
    self settargetentity( level.helicopter );
}

apartment_mg_nest_player_damage( var_0, var_1, var_2 )
{
    var_3 = undefined;

    for (;;)
    {
        var_1 waittill( "damage", var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        var_3 = var_8;

        if ( !isplayer( var_5 ) )
            continue;

        if ( var_4 < 150 )
            var_4 = 10;
        else
            var_4 = 150;

        var_2 -= var_4;

        if ( var_2 < 0 )
            break;
    }

    thread maps\_utility::arcademode_kill( self.origin, var_3, 100 );
    common_scripts\utility::_id_383F( var_0 );
}

apartment_mg_nest_sandbag()
{
    common_scripts\utility::_id_384A( "apartment_mg_destroyed" );
    maps\_utility::script_delay();
    self physicslaunch( self.origin + ( 0.0, -10.0, 0.0 ), ( 0.0, 1500.0, 200.0 ) );
}

apartment_mg_nest_2()
{
    var_0 = getent( "apartment_manual_mg_2", "targetname" );
    var_0.team = "axis";
    var_1 = getent( "mg_player_kill_2", "targetname" );
    var_2 = getent( "mg_player_target_2", "targetname" );
    var_0 thread apartment_mg_killzone( var_1, var_2, "apartment_mg_destroyed_2" );
    var_3 = getent( "mg_nest_damage_trigger_2", "targetname" );
    level thread apartment_mg_nest_player_damage( "apartment_mg_destroyed_2", var_3, 450 );
    getent( "nest_2_clip", "targetname" ) delete();
    var_4 = getent( "mg_nest_2_explosion", "targetname" );
    var_5 = getentarray( "nest_2", "targetname" );
    common_scripts\utility::_id_0D13( var_5, ::apartment_mg_nest_2_explosion, var_4.origin );
    common_scripts\utility::_id_384A( "apartment_mg_4th_flr" );
    var_0 thread manual_mg_fire( 1, 1 );
    common_scripts\utility::_id_384A( "apartment_mg_destroyed_2" );
    playfx( level._effect["mg_nest_expl"], var_4.origin );
    var_0 notify( "stop_targeting" );
    var_0 notify( "stop_firing" );
    wait 0.5;
    var_0 delete();
}

apartment_mg_nest_2_explosion( var_0 )
{
    common_scripts\utility::_id_384A( "apartment_mg_destroyed_2" );
    var_1 = self.origin - var_0;
    var_2 = var_1 * 800;

    if ( issubstr( self.model, "metal" ) )
        var_2 /= 10;

    self physicslaunch( var_0, var_2 );
}

apartment_mg_killzone( var_0, var_1, var_2 )
{
    level endon( var_2 );
    level endon( "mg_player_kill" );
    var_0 thread apartment_mg_kill( self, var_2 );

    for (;;)
    {
        shoot_mg_targets();
        var_1 waittill( "trigger" );
        self notify( "stop_targeting" );
        self settargetentity( level.player );

        while ( level.player istouching( var_1 ) )
            wait 0.5;
    }
}

apartment_mg_kill( var_0, var_1 )
{
    level endon( var_1 );
    level.player endon( "death" );
    self waittill( "trigger" );
    level notify( "mg_player_kill" );
    level.player enablehealthshield( 0 );
    var_2 = getdvarfloat( "player_damagemultiplier" );
    var_3 = 25 / var_2;

    for (;;)
    {
        level.player dodamage( var_3, var_0.origin );
        wait 0.05;
    }
}

apartment_teleport_roof_friendlies()
{
    maps\_utility::_id_0CE5( getentarray( "teleport_roof_friendlies_delete", "script_noteworthy" ) );
    getent( "teleport_roof_friendlies_trig", "targetname" ) waittill( "trigger" );
    var_0 = getnode( "teleport_roof_gaz_node", "targetname" );
    var_1 = getnode( "teleport_roof_griggs_node", "targetname" );
    level.steve maps\_utility::_id_920E( var_0 );
    level.mark maps\_utility::_id_920E( var_1 );
}

apartment_suicide()
{
    common_scripts\utility::_id_384A( "apartment_roof_friendlies" );
    scripted_array_spawn( "roof_runners", "targetname", 1 );
    common_scripts\utility::_id_384A( "apartment_stairs" );
    clearallcorpses();

    if ( getdvarint( "use_old_suicide" ) == 1 )
        level thread apartment_suicide_badguy();
    else
        level thread apartment_suicide_badguy_h1();

    level thread apartment_suicide_price();
    level thread apartment_suicide_dialogue();
}

apartment_suicide_price()
{
    level endon( "missionfailed" );
    level._id_6F7C = _id_7B3C( "roof_price", "targetname", 1 );
    level._id_6F7C thread maps\_utility::_id_58D7();
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread squad_init();
    level._id_6F7C.name = "Captain Price";
    var_0 = getnode( "price_roof_end", "targetname" );
    var_1 = getent( "price_roof_ent", "targetname" );
    level._id_6F7C.goalradius = 64;
    level._id_6F7C _meth_81a9( var_0 );
    var_1 thread maps\_anim::_id_0BE1( level._id_6F7C, "roof_idle", undefined, "stop_idle" );

    if ( getdvarint( "use_old_suicide" ) == 1 )
        common_scripts\utility::_id_3852( "stage3", "timed_suicide" );
    else
        common_scripts\utility::_id_384C( "stage4", "h1_player_seen_zakhaev_outside", "timed_suicide" );

    var_1 notify( "stop_idle" );

    if ( !common_scripts\utility::_id_382E( "timed_suicide" ) )
    {
        level._id_6F7C maps\_anim::_id_0C24( level._id_6F7C, "roof_move" );
        level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "roof_idle", undefined, "stop_idle" );
    }

    common_scripts\utility::_id_3852( "forced_suicide", "timed_suicide" );
    wait 0.2;
    level._id_6F7C notify( "stop_idle" );
}

apartment_suicide_badguy()
{
    level endon( "missionfailed" );
    level endon( "suicide_badguy_interrupt" );
    level.badguy animscripts\shared::_id_6869( level.badguy.secondaryweapon, "right" );
    level.badguy.allowdeath = 1;
    level.badguy.dropweapon = 0;
    level.badguy.grenadeammo = 0;
    level.badguy.health = 10;
    var_0 = getent( "roof_anim_ent_3", "targetname" );
    var_0 maps\_anim::_id_0BC7( level.badguy, "jump" );
    common_scripts\utility::_id_384A( "apartment_suicide" );
    level.badguy thread apartment_suicide_badguy_fx();
    level thread apartment_suicide_badguy_interrupt();
    level thread apartment_suicide_badguy_timed();
    level endon( "forced_suicide" );
    var_0 maps\_anim::_id_0C24( level.badguy, "jump" );

    if ( !isalive( level.badguy ) )
        return;

    level.badguy notify( "stop_death_fail" );
    level.badguy.a._id_612E = 1;
    level.badguy.allowdeath = 1;
    level.badguy kill( ( 0.0, 0.0, 0.0 ) );
    level notify( "slowdown_done" );
    common_scripts\utility::_id_383F( "apartment_suicide_done" );
}

apartment_suicide_badguy_h1()
{
    level endon( "missionfailed" );
    level endon( "suicide_badguy_interrupt" );

    if ( !level.tracksuit_mode_enabled )
        level.badguy animscripts\shared::_id_6869( level.badguy.secondaryweapon, "right" );

    level.badguy.allowdeath = 1;
    level.badguy.dropweapon = 0;
    level.badguy.grenadeammo = 0;
    level.badguy.health = 10;
    var_0 = getent( "roof_anim_ent_3", "targetname" );
    var_0 maps\_anim::_id_0BC7( level.badguy, "h1_climb_up" );
    common_scripts\utility::_id_384A( "apartment_suicide" );
    level.player thread flag_on_seeing_zakhaev_h1( "h1_player_seen_zakhaev", "stage3" );
    thread set_flag_on_timeout_h1( "stage3", 20 );
    common_scripts\utility::_id_384C( "h1_player_seen_zakhaev", "stage3" );

    if ( !common_scripts\utility::_id_382E( "stage3" ) )
        var_0 thread start_suicide_climb_up_and_finish_h1();

    common_scripts\utility::_id_384A( "stage3" );
    var_0 notify( "interrupt_zakhaev_climb_up" );
    level.badguy _meth_8143();
    level.badguy notify( "single anim", "end" );
    level.badguy notify( "looping anim", "end" );
    var_0 maps\_anim::_id_0BC7( level.badguy, "h1_climb_back_down_die" );
    level.player thread flag_on_seeing_zakhaev_h1( "h1_player_seen_zakhaev_outside", "stage4" );
    thread set_flag_on_timeout_h1( "stage4", 10, "h1_player_seen_zakhaev_outside" );
    common_scripts\utility::_id_384C( "h1_player_seen_zakhaev_outside", "stage4" );
    thread listen_for_up_quickdeath_window_end_h1();
    var_0 thread maps\_anim::_id_0C24( level.badguy, "h1_climb_back_down_die" );
    level.badguy thread apartment_suicide_badguy_fx();
    level thread apartment_suicide_badguy_interrupt();
    level thread apartment_suicide_badguy_timed();
    level endon( "forced_suicide" );

    if ( !isalive( level.badguy ) )
        return;

    level.badguy waittillmatch( "single anim", "end" );
    level.badguy notify( "stop_death_fail" );
    level.badguy.a._id_612E = 1;
    level.badguy.allowdeath = 1;
    level.badguy kill( ( 0.0, 0.0, 0.0 ) );
    level notify( "slowdown_done" );
    common_scripts\utility::_id_383F( "apartment_suicide_done" );
}

set_flag_on_timeout_h1( var_0, var_1, var_2 )
{
    level endon( var_0 );

    if ( isdefined( var_2 ) )
        level endon( var_2 );

    wait(var_1);
    common_scripts\utility::_id_383F( var_0 );
}

flag_on_seeing_zakhaev_h1( var_0, var_1 )
{
    level endon( var_1 );
    var_2 = cos( 30 );

    for (;;)
    {
        var_3 = common_scripts\utility::_id_A347( self geteye(), self getplayerangles(), level.badguy.origin, var_2 );

        if ( var_3 && level.badguy _meth_81db( self geteye(), self ) > 0 )
            break;
        else
            waittillframeend;
    }

    common_scripts\utility::_id_383F( var_0 );
}

listen_for_up_quickdeath_window_end_h1()
{
    level.badguy waittillmatch( "single anim", "stepping_down" );
    common_scripts\utility::_id_383F( "h1_zakhaev_suicide_stepping_down" );
    level.badguy waittillmatch( "single anim", "done_stepping" );
    common_scripts\utility::_id_383F( "h1_zakhaev_suicide_down" );
    level.badguy waittillmatch( "single anim", "no_more_quick" );
    common_scripts\utility::_id_383F( "h1_zakhaev_suicide_let_play" );
}

start_suicide_climb_up_and_finish_h1()
{
    self endon( "interrupt_zakhaev_climb_up" );
    level.badguy endon( "death" );
    maps\_anim::_id_0C24( level.badguy, "h1_climb_up" );
    maps\_anim::_id_0BE1( level.badguy, "h1_up_idle" );
}

apartment_suicide_badguy_timed()
{
    level endon( "missionfailed" );
    level endon( "forced_suicide" );

    if ( getdvarint( "use_old_suicide" ) == 1 )
    {
        var_0 = getanimlength( level._id_78AC["badguy"]["jump"] );
        wait(var_0 * 0.83);
        common_scripts\utility::_id_383F( "timed_suicide" );
        wait 0.5;
    }
    else
    {
        level.badguy waittillmatch( "single anim", "start_slow" );
        common_scripts\utility::_id_383F( "timed_suicide" );
    }

    level.badguy.allowdeath = 0;
    level thread slowdown();
}

apartment_suicide_badguy_fx()
{
    self waittillmatch( "single anim", "fire" );
    var_0 = self gettagorigin( "tag_flash" );
    var_1 = self gettagangles( "tag_flash" );
    var_2 = anglestoforward( var_1 );
    var_0 += var_2 * 8;
    thread common_scripts\utility::_id_69C2( "ambush_soz_shot", var_0 );
    playfx( level._effect["head_fatal"], var_0, anglestoforward( var_1 ), anglestoup( var_1 ) );
    maps\_cheat::melonhead_remove_melon( 1, 1 );
    wait 1.5;
    var_1 = ( 270.0, 0.0, 0.0 );
    var_0 = ( -4688.0, -9280.0, 644.5 );
    playfx( level._effect["bloodpool"], var_0, anglestoforward( var_1 ), anglestoup( var_1 ) );
}

apartment_suicide_badguy_interrupt()
{
    level endon( "missionfailed" );
    level endon( "timed_suicide" );
    var_0 = getent( "force_suicide", "targetname" );
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "forced_suicide" );

    if ( !isalive( level.badguy ) )
        return;

    level.player disableweapons();
    level.player thread set_playerspeed( 60, 0.25 );
    level.badguy.allowdeath = 0;
    var_1 = getent( "roof_anim_ent_3", "targetname" );

    if ( getdvarint( "use_old_suicide" ) == 1 )
    {
        level thread slowdown();
        level.badguy _meth_8143();
        level.badguy notify( "single anim", "end" );
        var_1 maps\_anim::_id_0C24( level.badguy, "quick_jump" );
    }
    else
    {
        if ( common_scripts\utility::_id_382E( "h1_zakhaev_suicide_down" ) )
        {
            level.badguy _meth_8143();
            level.badguy notify( "single anim", "end" );
            var_1 thread maps\_anim::_id_0C24( level.badguy, "h1_quickdeath_down" );
            level.badguy thread slowmo_on_notetrack();
        }
        else if ( common_scripts\utility::_id_382E( "h1_zakhaev_suicide_stepping_down" ) )
        {
            level.badguy waittillmatch( "single anim", "done_stepping" );
            level.badguy _meth_8143();
            level.badguy notify( "single anim", "end" );
            var_1 thread maps\_anim::_id_0C24( level.badguy, "h1_quickdeath_down" );
            level.badguy thread slowmo_on_notetrack();
        }
        else if ( !common_scripts\utility::_id_382E( "h1_zakhaev_suicide_let_play" ) )
        {
            level.badguy _meth_8143();
            level.badguy notify( "single anim", "end" );
            var_1 thread maps\_anim::_id_0C24( level.badguy, "h1_quickdeath_up" );
            level.badguy thread slowmo_on_notetrack();
        }

        wait 2;
    }

    if ( !isalive( level.badguy ) )
        return;

    level.badguy notify( "stop_death_fail" );
    level.badguy.a._id_612E = 1;
    level.badguy.allowdeath = 1;
    level.badguy kill( ( 0.0, 0.0, 0.0 ) );
    level notify( "slowdown_done" );
    level.player thread set_playerspeed( 140, 2 );
    common_scripts\utility::_id_383F( "apartment_suicide_done" );
}

slowmo_on_notetrack()
{
    self waittillmatch( "single anim", "start_slow" );
    slowdown();
}

slowdown()
{
    var_0 = gettimescale() < level._id_8637._id_8A53;
    maps\_utility::_id_8648();
    level.badguy thread maps\_utility::_id_69C4( "scn_ambush_suicide_start" );
    level.helicopter thread maps\_utility::_id_69C4( "scn_ambush_suicide_heli" );
    soundscripts\_snd::_id_870C( "aud_start_mix_suicide_slowmo" );
    maps\_utility::_id_8646( 0.3 );
    maps\_utility::_id_8643( 0.6 );
    maps\_utility::_id_8640();
    level waittill( "slowdown_done" );
    var_1 = 1.2;
    maps\_utility::_id_8644( var_1 );
    maps\_utility::_id_8641();
    level.player thread maps\_utility::_id_69C4( "scn_ambush_suicide_end" );
    soundscripts\_snd::_id_870C( "aud_start_mix_ending" );
    wait(var_1);
    maps\_utility::_id_863E();

    if ( var_0 )
        level.player notify( "_cheat_player_press_slowmo" );
}

apartment_suicide_dialogue()
{
    level endon( "missionfailed" );
    soundscripts\_snd::_id_870C( "aud_start_mix_drop_bloody_gun" );
    common_scripts\utility::_id_383F( "gaz_shouts_at_zakhaev" );
    level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_dropgun" );
    wait 1;
    level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_inhisleg" );
    level._id_6F7C thread maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_cantriskit" );
    level._id_6F7C thread restrain_dialogue();
    level.mark thread dropgun_dialogue();
    common_scripts\utility::_id_383F( "obj_flexicuff" );
    common_scripts\utility::_id_3852( "forced_suicide", "timed_suicide" );
    level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_no" );
    common_scripts\utility::_id_384A( "apartment_suicide_done" );
    wait 1.5;
    maps\_utility::_id_0CC5();
    level.mark maps\_anim::_id_0C21( level.mark, "ambush_grg_kidissues" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_sonisdead" );
    wait 2;
    level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_onlylead" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_knowtheman" );
    common_scripts\utility::_id_383F( "mission_done" );
}

dropgun_dialogue()
{
    level endon( "missionfailed" );
    level endon( "forced_suicide" );
    level endon( "timed_suicide" );
    wait 5;
    level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_dropit" );
    wait 1;
    level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_dropitnow" );
}

restrain_dialogue()
{
    level endon( "missionfailed" );
    level endon( "forced_suicide" );
    level endon( "timed_suicide" );
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_restrainhim" );
    wait 3;
    level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_restrainnow" );

    if ( getdvarint( "use_old_suicide" ) != 1 )
    {
        wait 8;
        level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_restrainhim" );
        wait 1;
        level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_dropitnow" );
        wait 3;
        level._id_6F7C maps\_anim::_id_0C21( level._id_6F7C, "ambush_pri_restrainnow" );
        wait 1;
        level.steve maps\_anim::_id_0C21( level.steve, "ambush_gaz_dropit" );
    }
}

failed_to_pursue()
{
    common_scripts\utility::_id_0D13( getentarray( "failed_to_pursue", "targetname" ), ::failed_to_pursue_trigger );
    level thread failed_to_pursue_timer( 35 );
    common_scripts\utility::_id_384A( "junkyard_exit" );
    level notify( "made the time" );
    level thread failed_to_pursue_timer( 15, "ambush_mhp_guyshaulin" );
    common_scripts\utility::_id_384A( "village_road" );
    level notify( "made the time" );
    maps\_utility::_id_1151( "village_road", 10 );
    common_scripts\utility::_id_384A( "village_alley" );
    maps\_utility::_id_1151( "village_alley", 5 );
    level thread failed_to_pursue_timer( 35, "ambush_mhp_getaway" );
    common_scripts\utility::_id_384A( "morpheus_dumpster" );
    level notify( "made the time" );
    maps\_utility::_id_1151( "morpheus_dumpster", 5 );
    level thread failed_to_pursue_timer( 30, "ambush_mhp_guyshaulin" );
    common_scripts\utility::_id_384A( "morpheus_iron_fence" );
    level notify( "made the time" );
    maps\_utility::_id_1151( "morpheus_iron_fence", 20 );
    maps\_utility::arcademode_checkpoint( 7, 3 );
    level thread failed_to_pursue_timer( 120, "ambush_mhp_betterhurry" );
    common_scripts\utility::_id_384A( "morpheus_target_moving" );
    level notify( "made the time" );
    maps\_utility::_id_1151( "morpheus_target_moving", 8 );
    level thread failed_to_pursue_timer( 50, "ambush_mhp_gonnalose" );
    common_scripts\utility::_id_384A( "apartment_start" );
    level notify( "made the time" );
}

failed_to_pursue_timer( var_0, var_1 )
{
    level endon( "made the time" );
    var_2 = gettime() + var_0 * 1000;

    if ( isdefined( var_1 ) )
    {
        var_3 = gettime() + int( var_0 * 0.65 ) * 1000;

        while ( var_3 > gettime() )
            wait 1;

        level thread maps\_utility::_id_70C4( var_1 );
    }

    while ( var_2 > gettime() )
        wait 1;

    if ( issaverecentlyloaded() )
        wait 10;

    thread failed();
}

failed()
{
    var_0 = randomint( 4 );
    level thread maps\_utility::_id_70C4( "ambush_mhp_losthim_" + var_0 );
    soundscripts\_snd::_id_870C( "aud_start_mix_mission_failed" );
    wait 1.5;
    setdvar( "ui_deadquote", "@AMBUSH_MISSIONFAIL_ESCAPED" );
    var_1 = 1;

    if ( var_1 )
        maps\_utility::_id_5CDF();
}

failed_to_pursue_trigger()
{
    self waittill( "trigger" );
    level notify( "made the time" );
    thread failed();
}

badguy_spawn_function()
{
    self.name = "";
    self._id_0C72 = "badguy";
    maps\_utility::_id_7DDF( 0 );
    self setthreatbiasgroup( "badguy" );
    self.fixednode = 1;
    thread badguy_died();
    thread badguy_proximity_kill();
    thread badguy_immune_to_everything_but_player();
    maps\_utility::_id_7E60( 1 );
    self.a._id_2B20 = 1;
    self.grenadeawareness = 1;
    maps\_utility::_id_7F71( 1 );
    self._id_7A16 = 1;
    self._id_2AF7 = 1;
    self _meth_81d7();
    thread maps\_hud_util::display_custom_nameplate( ::can_display_badguy_name, "V. Zakhaev", "axis" );
}

can_display_badguy_name()
{
    var_0 = 3500;

    if ( distancesquared( level.player.origin, self.origin ) > var_0 * var_0 )
        return 0;

    var_1 = level.player geteye() + 6000 * anglestoforward( level.player getplayerangles() );
    var_2 = bullettrace( level.player geteye(), var_1, 1, level.player, 0, 0, 0, 0, 0 );
    return isdefined( var_2["entity"] ) && var_2["entity"] == self;
}

badguy_died( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 3;

    self endon( "stop_death_fail" );
    self.health *= var_0;
    self waittill( "death" );
    soundscripts\_snd::_id_870C( "aud_start_mix_mission_failed" );
    setdvar( "ui_deadquote", "@AMBUSH_MISSIONFAIL_KILLED_TARGET" );
    maps\_utility::_id_5CDF();
}

badguy_proximity_kill()
{
    self endon( "stop_proximity_kill" );
    level.player endon( "death" );
    self endon( "death" );
    var_0 = self._id_1300;

    for (;;)
    {
        while ( distance2d( level.player.origin, self.origin ) > 350 )
            wait 0.1;

        self._id_1300 *= 10;
        setthreatbias( "player", "badguy", 100000 );

        while ( distance2d( level.player.origin, self.origin ) < 400 )
            wait 0.1;

        self._id_1300 = var_0;
        setthreatbias( "player", "badguy", 0 );
    }
}

start_default()
{
    soundscripts\_snd::_id_870C( "start_default_checkpoint" );
    aarea_takeover_init();
}

start_ambush()
{
    soundscripts\_snd::_id_870C( "start_ambush_checkpoint" );
    common_scripts\utility::_id_0D13( getentarray( "takeover_trigger", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    common_scripts\utility::_id_0D13( getentarray( "village_trigger", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    setup_friendlies( 3 );
    start_teleport_squad( "ambush" );
    var_0 = getent( "takeout_path_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    common_scripts\utility::_id_0CDB( getentarray( "gate_open", "targetname" ), ::hide );
    getent( "rear_blocker_open", "targetname" ) hide();
    level thread guardtower_dead_enemies();
    common_scripts\utility::_id_383F( "takeover_fade_clear" );
    common_scripts\utility::_id_383F( "takeover_fade_done" );
    common_scripts\utility::_id_383F( "takeover_briefing_done" );
    aarea_ambush_init();
}

start_village()
{
    soundscripts\_snd::_id_870C( "start_village_checkpoint" );
    setup_friendlies( 3 );
    start_teleport_squad( "village" );
    common_scripts\utility::_id_383F( "takeover_done" );
    maps\ambush_lighting::setup_village_start_lighting();
    level.player setthreatbiasgroup( "player" );
    maps\_utility::_id_070A( "ambush_attack_color_init" );
    common_scripts\utility::_id_0D13( getentarray( "takeover_trigger", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    common_scripts\utility::_id_0D13( getentarray( "village_trigger", "script_noteworthy" ), common_scripts\utility::_id_97CC );
    var_0 = getent( "takeout_path_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    var_0 = getent( "rear_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    var_1 = getent( "guard_tower", "targetname" );
    var_2 = getentarray( "guard_tower_part", "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] delete();

    var_1 delete();
    var_4 = getentarray( "guard_tower_sandbags", "targetname" );

    for ( var_3 = 0; var_3 < var_4.size; var_3++ )
        var_4[var_3] delete();

    level.helicopter = maps\_vehicle::_id_8978( "blackhawk" );
    var_5 = common_scripts\utility::_id_40FB( "village_heli_start", "targetname" );
    level.helicopter thread heli_path_speed( var_5 );
    aarea_village_init();
}

start_morpheus()
{
    soundscripts\_snd::_id_870C( "start_morpheus_checkpoint" );
    setup_friendlies( 0 );
    start_teleport_squad( "morpheus" );
    maps\ambush_lighting::setup_morpheus_start_lighting();
    level.player setthreatbiasgroup( "player" );
    maps\_utility::_id_070A( "village_retreat_2_color_init" );
    level.helicopter = maps\_vehicle::_id_8978( "blackhawk" );
    var_0 = common_scripts\utility::_id_40FB( "apartment_heli_start", "targetname" );
    level.helicopter thread heli_path_speed( var_0 );
    aarea_morpheus_init();
}

start_apartment()
{
    soundscripts\_snd::_id_870C( "start_apartment_checkpoint" );
    setup_friendlies( 0 );
    start_teleport_squad( "apartment" );
    maps\ambush_lighting::setup_apartment_start_lighting();
    level.player setthreatbiasgroup( "player" );
    level.steve maps\_utility::_id_7E38( "g" );
    maps\_utility::_id_070A( "apartment_color_init" );
    level.helicopter = maps\_vehicle::_id_8978( "blackhawk" );
    var_0 = common_scripts\utility::_id_40FB( "apartment_heli_start", "targetname" );
    level.helicopter thread heli_path_speed( var_0 );
    common_scripts\utility::_id_384A( "apartment_start" );
    aarea_apartment_init();
}

start_suicide()
{
    soundscripts\_snd::_id_870C( "start_apartment_checkpoint" );
    setup_friendlies( 0 );
    var_0 = getent( "startnodesteve_suicide", "targetname" );
    level.steve _meth_81ca( var_0.origin );
    var_1 = getent( "startnodemark_suicide", "targetname" );
    level.mark _meth_81ca( var_1.origin );
    var_2 = getent( "startnodeplayer_suicide", "targetname" );
    level.player setorigin( var_2.origin );
    level.player setplayerangles( var_2.angles );
    maps\ambush_lighting::setup_apartment_start_lighting();
    level thread suicide_badguy_h1();
    level.player setthreatbiasgroup( "player" );
    level.steve maps\_utility::_id_7E38( "g" );
    level.mark maps\_utility::_id_7E38( "g" );
    maps\_utility::_id_0709( "suicide_color_init" );
    level.helicopter = maps\_vehicle::_id_8978( "blackhawk" );
    var_3 = common_scripts\utility::_id_40FB( "apartment_heli_start", "targetname" );
    level.helicopter thread heli_path_speed( var_3 );
    common_scripts\utility::_id_383F( "apartment_roof_friendlies" );
    level thread apartment_suicide();
    maps\_utility::_id_1143( "suicide" );
}

setup_friendlies( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    level._id_8AB0 = [];
    level._id_6F7C = _id_7B3C( "price", "targetname", 1 );
    level._id_6F7C thread maps\_utility::_id_58D7();
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C thread squad_init();
    level._id_6F7C.name = "Captain Price";
    level.mark = _id_7B3C( "mark", "targetname", 1 );
    level.mark._id_795C = 0;
    level.mark thread maps\_utility::_id_58D7();
    level.mark._id_0C72 = "mark";
    level.mark thread squad_init();
    level.mark._id_132D = 0;
    level.mark.name = "SSgt. Griggs";
    level.steve = _id_7B3C( "steve", "targetname", 1 );
    level.steve thread maps\_utility::_id_58D7();
    level.steve._id_0C72 = "steve";
    level.steve.name = "Gaz";
    level.steve thread squad_init();
    getent( "kamarov", "script_noteworthy" ) maps\_utility::_id_0798( ::kamarov );
    var_1 = getentarray( "allies", "targetname" );

    for ( var_2 = 0; var_2 < var_0; var_2++ )
    {
        var_3 = _id_7B3C( undefined, undefined, 1, var_1[var_2] );
        var_3 generic_allied();
    }

    common_scripts\utility::_id_0D13( getentarray( "color_spawner", "targetname" ), maps\_utility::_id_0798, ::generic_allied );
}

kamarov()
{
    self endon( "death" );
    level.kamarov = self;
    self.name = "Sgt. Kamarov";
    thread maps\_utility::_id_58D7();
    common_scripts\utility::_id_384A( "takeover_fade_clear" );
    maps\_utility::_id_8EA4();
}

is_kamarov()
{
    return isdefined( self.name ) && self.name == "Sgt. Kamarov";
}

squad_init()
{
    level._id_8AB0[level._id_8AB0.size] = self;
    self waittill( "death" );
    level._id_8AB0 = common_scripts\utility::_id_0CF6( level._id_8AB0, self );
}

generic_allied()
{
    self._id_0C72 = "generic";
    thread squad_init();
}

get_generic_allies()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_8AB0.size; var_1++ )
    {
        if ( level._id_8AB0[var_1]._id_0C72 == "generic" )
            var_0[var_0.size] = level._id_8AB0[var_1];
    }

    return var_0;
}

_id_7B3C( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = getent( var_0, var_1 );

    if ( isdefined( var_2 ) )
        var_4 = var_3 stalingradspawn();
    else
        var_4 = var_3 dospawn();

    maps\_utility::_id_88F1( var_4 );
    return var_4;
}

scripted_array_spawn( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, var_1 );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        var_4[var_5] = _id_7B3C( var_0, var_1, var_2, var_3[var_5] );

    return var_4;
}

start_teleport_squad( var_0 )
{
    var_1 = getnode( "startnodeplayer_" + var_0, "targetname" );
    level.player setorigin( var_1.origin );
    level.player setplayerangles( var_1.angles );

    for ( var_2 = 0; var_2 < level._id_8AB0.size; var_2++ )
    {
        level._id_8AB0[var_2] notify( "stop_going_to_node" );
        var_3 = "startnode" + level._id_8AB0[var_2]._id_0C72 + "_" + var_0;
        var_1 = getnodearray( var_3, "targetname" );
        level._id_8AB0[var_2] _id_8CC0( var_1 );
    }
}

_id_8CC0( var_0 )
{
    if ( var_0.size > 1 )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            if ( isdefined( var_0[var_1].teleport_used ) )
                continue;

            var_0 = var_0[var_1];
            break;
        }
    }
    else
        var_0 = var_0[0];

    var_0.teleport_used = 1;
    self _meth_81c9( var_0.origin, var_0.angles );
    self _meth_81aa( self.origin );
    self.goalradius = 0;

    if ( isdefined( self.radius ) )
        self.goalradius = var_0.radius;

    self _meth_81a9( var_0 );
}

delete_dropped_weapons()
{
    var_0 = [];
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_ak47" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_beretta" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_g36c" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m14" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m16" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m203" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_rpg" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_saw" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m4" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_m40a3" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_mp5" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_mp5sd" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_usp" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_at4" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_dragunov" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_g3" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, "weapon_uzi" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = getentarray( var_0[var_1], "classname" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( isdefined( var_2[var_3].targetname ) )
                continue;

            var_2[var_3] delete();
        }
    }
}

shoot_mg_targets()
{
    self endon( "stop_targeting" );
    self setmode( "manual" );
    self _meth_815a( 60 );
    self _meth_8158( 60 );
    self _meth_8157( 60 );
    var_0 = getentarray( self.target, "targetname" );
    var_0 = common_scripts\utility::_id_0CDA( var_0, level.player );
    var_1 = undefined;

    for (;;)
    {
        if ( isdefined( var_1 ) )
            var_2[0] = var_1;
        else
            var_2 = undefined;

        var_3 = common_scripts\utility::_id_3CCB( level.player.origin, var_0, var_2, 3 );
        var_1 = common_scripts\utility::_id_710E( var_3 );
        self settargetentity( var_1 );
        wait(randomfloatrange( 1, 3 ));
    }
}

manual_mg_fire( var_0, var_1, var_2, var_3 )
{
    self endon( "stop_firing" );
    self.turret_fires = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    for (;;)
    {
        var_4 = randomfloatrange( 0.8, 1.5 ) * var_0 * 20;

        if ( self.turret_fires )
        {
            for ( var_5 = 0; var_5 < var_4; var_5++ )
            {
                self shootturret();

                if ( isdefined( var_3 ) )
                    playfxontag( var_3, self, "tag_flash" );

                wait 0.05;
            }
        }

        if ( self.team != "allies" && randomint( 2 ) )
        {
            while ( !bullettracepassed( self gettagorigin( "tag_flash" ), level.player geteye(), 0, self ) )
                wait 0.05;
        }

        wait(randomfloatrange( 0.6, 1.2 ) * var_1);
    }
}

random_offest( var_0 )
{
    return ( var_0 - randomfloat( var_0 * 2 ), var_0 - randomfloat( var_0 * 2 ), var_0 - randomfloat( var_0 * 2 ) );
}

set_playerspeed( var_0, var_1 )
{
    var_2 = 190;

    if ( !isdefined( level.player._id_5F7A ) )
        level.player._id_5F7A = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_3 = abs( int( var_1 * 4 ) );
    var_4 = var_0 / var_2;
    var_5 = level.player._id_5F7A - var_4;

    for ( var_6 = 0; var_6 < var_3; var_6++ )
    {
        level.player._id_5F7A -= var_5 / var_3;
        level.player setmovespeedscale( level.player._id_5F7A );
        wait 0.5;
    }

    level.player._id_5F7A = var_4;
    level.player setmovespeedscale( level.player._id_5F7A );
}

grenade_notifies()
{
    for (;;)
    {
        level.player waittill( "grenade_fire", var_0, var_1 );
        var_0 thread notify_on_detonation( var_1 );
    }
}

notify_on_detonation( var_0 )
{
    while ( isdefined( self ) )
        wait 0.1;

    level.player notify( var_0 );
}

set_flag_on_player_action( var_0, var_1, var_2 )
{
    level notify( "kill_action_flag" );
    level endon( "kill_action_flag" );
    level endon( var_0 );

    if ( common_scripts\utility::_id_382E( var_0 ) )
        return;

    for (;;)
    {
        var_3 = level.player common_scripts\utility::_id_A070( "weapon_fired", "fraggrenade", "flash_grenade", "h1_cheatlemonade" );

        if ( !isdefined( var_3 ) )
            break;

        if ( var_3 == "weapon_fired" )
            break;

        if ( var_3 == "fraggrenade" && isdefined( var_2 ) )
            break;

        if ( var_3 == "flash_grenade" && isdefined( var_1 ) )
            break;

        if ( var_3 == "h1_cheatlemonade" && isdefined( var_2 ) )
            break;
    }

    common_scripts\utility::_id_383F( var_0 );
}

kill_ai( var_0, var_1 )
{
    self endon( "death" );
    randomfloatrange( var_0, var_1 );
    self kill( level.player.origin );
}

hud_hide( var_0 )
{
    wait 0.05;

    if ( isdefined( var_0 ) && !var_0 )
    {
        setdvar( "ui_hud_showstanceicon", "1" );
        setsaveddvar( "compass", "1" );
        setsaveddvar( "ammoCounterHide", "0" );
    }
    else
    {
        setdvar( "ui_hud_showstanceicon", "0" );
        setsaveddvar( "compass", "0" );
        setsaveddvar( "ammoCounterHide", "1" );
    }
}

setup_vehicle_pause_node()
{
    common_scripts\utility::_id_0D13( getvehiclenodearray( "pause_node", "script_noteworthy" ), ::vehicle_pause_node );
}

vehicle_pause_node()
{
    self waittill( "trigger", var_0 );
    var_0 vehicle_setspeed( 0, 60 );
    wait(self.script_delay);
    var_0 resumespeed( 20 );
}

_id_085A( var_0 )
{
    var_1 = var_0[0];
    var_2 = var_0[2];
    var_3 = anglestoright( level.player.angles );
    var_4 = anglestoforward( level.player.angles );
    var_5 = ( var_3[0], 0, var_3[1] * -1 );
    var_6 = ( var_4[0], 0, var_4[1] * -1 );
    var_7 = var_5 * var_1;
    var_7 += var_6 * var_2;
    return var_7 + ( 0, var_0[1], 0 );
}

set_goalnode( var_0 )
{
    self _meth_81a9( var_0 );

    if ( isdefined( var_0.radius ) )
        self.goalradius = var_0.radius;
}

_id_2827()
{
    self endon( "death" );
    self waittill( "goal" );

    while ( self _meth_81c2( level.player ) )
        wait 1;

    self delete();
}

kill_guy( var_0 )
{
    if ( isalive( self ) )
        self kill( var_0 );
}

heli_path_speed( var_0 )
{
    if ( isdefined( var_0 ) && isdefined( var_0.speed ) )
    {
        var_1 = 25;
        var_2 = undefined;

        if ( isdefined( var_0._id_798B ) )
            var_2 = var_0._id_798B;

        var_3 = var_0.speed;

        if ( isdefined( var_0._id_7929 ) )
            var_1 = var_0._id_7929;
        else
        {
            var_4 = var_3 / 4;

            if ( var_1 > var_4 )
                var_1 = var_4;
        }

        if ( isdefined( var_2 ) )
            self vehicle_setspeed( var_3, var_1, var_2 );
        else
            self vehicle_setspeed( var_3, var_1 );
    }

    maps\_vehicle::_id_9D17( var_0 );
}

fixednode_trigger_setup()
{
    common_scripts\utility::_id_0D13( getentarray( "fixednode_set", "targetname" ), ::fixednode_set );
    common_scripts\utility::_id_0D13( getentarray( "fixednode_unset", "targetname" ), ::fixednode_unset );
}

fixednode_set()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !var_0.fixednode )
            var_0.fixednode = 1;
    }
}

fixednode_unset()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( var_0.fixednode )
            var_0.fixednode = 0;
    }
}

fall_death()
{
    var_0 = getent( "fall_death", "targetname" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 isragdoll() )
            continue;

        if ( getdvarint( "ragdoll_enable" ) )
        {
            var_1._id_85BA = 1;
            var_1 maps\_utility::_id_2A51();
            continue;
        }

        var_1 maps\_utility::_id_2A51();
    }
}

vehicle_turret_think()
{
    self endon( "death" );
    self endon( "c4_detonation" );
    thread maps\_vehicle::_id_5BD2();
    self.turretfiring = 0;
    var_0 = undefined;
    var_1 = undefined;

    for (;;)
    {
        wait 0.05;

        if ( !isdefined( var_0 ) )
            var_0 = vehicle_get_target_player_only();
        else if ( isdefined( var_0 ) && !isplayer( var_0 ) )
            var_0 = vehicle_get_target_player_only();

        if ( isdefined( var_0 ) && isplayer( var_0 ) )
        {
            var_2 = 0;
            var_2 = sighttracepassed( self.origin, level.player.origin + ( 0.0, 0.0, 150.0 ), 0, self );

            if ( !var_2 )
                var_0 = vehicle_get_target( level.bmpexcluders );
        }
        else
            var_0 = vehicle_get_target( level.bmpexcluders );

        if ( isdefined( var_0 ) && isalive( var_0 ) )
        {
            var_3 = var_0.origin + ( 0.0, 0.0, 32.0 );
            self _meth_825d( var_3 );

            if ( getdvar( "debug_bmp" ) == "1" )
                thread maps\_utility::_id_2DBF( self.origin + ( 0.0, 0.0, 32.0 ), var_3, 1, 0, 0, self, "stop_drawing_line" );

            var_4 = randomfloatrange( 2, 3 );
            common_scripts\utility::_id_A0A0( "turret_rotate_stopped", var_4 );

            if ( isdefined( var_0 ) && isalive( var_0 ) )
            {
                if ( distancesquared( var_0.origin, self.origin ) <= level.bmpmgrangesquared )
                {
                    if ( !self._id_5BD5[0] isfiringturret() )
                        thread maps\_vehicle::_id_5BD3();

                    wait 0.5;

                    if ( !self._id_5BD5[0] isfiringturret() )
                    {
                        thread maps\_vehicle::_id_5BD2();

                        if ( !self.turretfiring )
                            thread vehicle_fire_main_cannon();
                    }
                }
                else
                {
                    thread maps\_vehicle::_id_5BD2();

                    if ( !self.turretfiring )
                        thread vehicle_fire_main_cannon();
                }
            }
        }

        if ( getdvar( "debug_bmp" ) == "1" )
            self notify( "stop_drawing_line" );
    }
}

vehicle_fire_main_cannon()
{
    self endon( "death" );
    self endon( "c4_detonation" );
    var_0 = weaponfiretime( "bmp_turret" );
    var_1 = randomintrange( 3, 8 );
    self.turretfiring = 1;
    var_2 = 0;

    while ( var_2 < var_1 )
    {
        var_2++;
        wait(var_0);
        self fireweapon();
    }

    self.turretfiring = 0;
}

vehicle_get_target( var_0 )
{
    var_1 = maps\_helicopter_globals::_id_3F7F( level.bmpcannonrange, level._id_2235["180"], 1, 1, 0, 1, var_0 );
    return var_1;
}

vehicle_get_target_player_only()
{
    var_0 = level._id_8AB0;
    var_1 = maps\_helicopter_globals::_id_3F7F( level.bmpcannonrange, level._id_2235["180"], 0, 1, 0, 0, var_0 );
    return var_1;
}

music_control()
{
    wait 1;
    thread music_playback( "ambush_somber_music", 120, 1, 1 );
    common_scripts\utility::_id_384A( "takeover_fade" );
    level notify( "next_music_track" );
    musicstop( 6 );
    common_scripts\utility::_id_384A( "caravan_on_the_move" );
    wait 3;
    thread music_playback( "ambush_trucks_music", 117 );
    common_scripts\utility::_id_384A( "player_tower_hits_ground" );
    level notify( "next_music_track" );
    musicstop();
    wait 1;
    common_scripts\utility::_id_384A( "son_of_zakhaev_money_shot" );
    wait 4;
    thread music_playback( "ambush_chase_music", 136, 1, 1 );
    common_scripts\utility::_id_384A( "apartment_roof" );
    level notify( "next_music_track" );
    musicstop( 6 );
    wait 6.5;
    common_scripts\utility::_id_384A( "gaz_shouts_at_zakhaev" );
    thread music_playback( "ambush_standoff_music", 211 );

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "forced_suicide" ) || common_scripts\utility::_id_382E( "apartment_suicide_done" ) )
        {
            level notify( "next_music_track" );
            musicstop();
            break;
        }

        wait 0.05;
    }

    common_scripts\utility::_id_384A( "apartment_suicide_done" );
    level notify( "next_music_track" );
    musicstop( 3 );
    wait 3.1;
    thread music_playback( "ambush_somber_music", 120 );
}

music_playback( var_0, var_1, var_2, var_3 )
{
    level endon( "next_music_track" );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( var_2 )
    {
        for (;;)
        {
            maps\_utility::_id_6008( var_0 );
            wait(var_1);
            musicstop();
            wait(var_3);
        }
    }
    else
        maps\_utility::_id_6008( var_0 );
}

bugfix_failsafe_triggerflag_morpheus_rpg()
{
    var_0 = ( -4736.0, -6592.0, -120.0 );
    var_1 = 350;

    while ( common_scripts\utility::_id_2B73( level.player.origin, var_0 ) > var_1 * var_1 )
        wait 0.25;

    common_scripts\utility::_id_383F( "morpheus_rpg" );
}
