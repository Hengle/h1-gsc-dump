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

init()
{
    if ( !isdefined( level._id_78B6 ) )
        level._id_78B6 = [];

    if ( !isdefined( level._id_78B2 ) )
        level._id_78B2 = [];

    if ( !isdefined( level._id_78B4 ) )
        level._id_78B4 = [];

    if ( !isdefined( level._id_78B0 ) )
        level._id_78B0 = [];

    if ( !isdefined( level._id_78BA ) )
        level._id_78BA = [];

    if ( !isdefined( level._id_78B9 ) )
        level._id_78B9 = [];

    if ( !isdefined( level._id_78BC ) )
        level._id_78BC = [];

    if ( !isdefined( level._id_78AC ) )
        level._id_78AC[0][0] = 0;

    if ( !isdefined( level._id_78B9 ) )
        level._id_78B9 = [];

    if ( !isdefined( level._id_78B3 ) )
        level._id_78B3 = [];

    common_scripts\utility::_id_23C8( "moreThanThreeHack", 3 );

    if ( maps\_utility::_id_502F() )
        common_scripts\utility::_id_23C8( "trace_part_for_efx", 12 );
    else
        common_scripts\utility::_id_23C8( "trace_part_for_efx" );

    level.h1_turn_animations_enabled = should_use_turn_animations();
    level.h1_bullet_whizby_enabled = should_use_bullet_whizby();
    level.h1_improved_grenade_returns = should_use_improved_grenade_returns();

    if ( !level.h1_improved_grenade_returns )
    {
        setsaveddvar( "ai_grenadeReturn_minDistSqr", squared( 0 ) );
        setsaveddvar( "ai_grenadeReturn_orientToToss", 1 );
    }

    var_0 = should_use_mw_cover_moveup_behaviour();
    setsaveddvar( "ai_useCoverMoveUpBehaviour", var_0 );
    var_1 = should_use_cover_suppression_behaviour();
    setsaveddvar( "ai_suppressionAffectsCover", var_1 );
    level._id_243A = shoulduserpgrepulsors();
    level.usinggrenadedistancechecks = shouldusegrenadedistancechecks();
    level.h1_arrival_ignores_player = should_arrival_ignore_player();
    var_2 = should_enable_foot_ik();
    setsaveddvar( "xanim_disableFootIK", !var_2 );
    level.facialclearduration = 0.3;
    level.scriptedtalkingweight = 1;
}

should_use_cover_suppression_behaviour()
{
    if ( !maps\_utility::is_h1_level() )
        return 0;

    switch ( level.script )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 0;
    }

    return 0;
}

should_enable_foot_ik()
{
    if ( !maps\_utility::is_h1_level() )
        return 0;

    switch ( level.script )
    {
        case "ac130":
        case "aftermath":
        case "coup":
            return 0;
    }

    return 1;
}

should_use_mw_cover_moveup_behaviour()
{
    if ( !maps\_utility::is_h1_level() )
        return 1;

    switch ( level.script )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 1;
    }

    return 1;
}

should_use_bullet_whizby()
{
    if ( !maps\_utility::is_h1_level() )
        return 1;

    var_0 = maps\_utility::_id_3F74( "ai_bulletWhizbyEnable", 0 );

    if ( var_0 != 0 )
        return var_0 > 0;

    switch ( level.script )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 1;
    }

    return 0;
}

should_use_turn_animations()
{
    if ( !maps\_utility::is_h1_level() )
        return 1;

    var_0 = maps\_utility::_id_3F74( "ai_turnAnimsOverride", 0 );

    if ( var_0 != 0 )
        return var_0 > 0;

    switch ( level.script )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "hunted":
        case "icbm":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 1;
    }

    return 0;
}

should_use_improved_grenade_returns()
{
    if ( !maps\_utility::is_h1_level() )
        return 1;

    var_0 = maps\_utility::_id_3F74( "ai_grenadeReturn_improvements", 0 );

    if ( var_0 != 0 )
        return var_0 > 0;

    switch ( level.script )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 1;
    }

    return 1;
}

should_use_forced_teleport_to_anim_start()
{
    if ( !maps\_utility::is_h1_level() )
        return 1;

    var_0 = maps\_utility::_id_3F74( "ai_forcedTeleportToAnimStart", 0 );

    if ( var_0 != 0 )
        return var_0 > 0;

    switch ( level.script )
    {
        case "armada":
        case "airlift":
        case "blackout":
        case "cargoship":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "scoutsniper":
            return 0;
    }

    return 1;
}

should_arrival_ignore_player()
{
    var_0 = maps\_utility::_id_3F74( "ai_coverArrival_ignorePlayer", 0 );

    if ( var_0 != 0 )
        return var_0 > 0;

    switch ( level.script )
    {
        case "cargoship":
            return 1;
    }

    return 0;
}

shoulduserpgrepulsors()
{
    var_0 = maps\_utility::_id_3F74( "ai_use_rpg_repulsors", 0 );

    if ( var_0 != 0 )
        return var_0 > 0;

    switch ( level.script )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 0;
    }

    return 1;
}

shouldusegrenadedistancechecks()
{
    var_0 = maps\_utility::_id_3F74( "ai_use_grenade_dist_checks", 0 );

    if ( var_0 != 0 )
        return var_0 > 0;

    switch ( level.script )
    {
        case "armada":
        case "airlift":
        case "ac130":
        case "aftermath":
        case "airplane":
        case "ambush":
        case "blackout":
        case "bog_a":
        case "bog_b":
        case "cargoship":
        case "coup":
        case "hunted":
        case "icbm":
        case "jeepride":
        case "killhouse":
        case "launchfacility_a":
        case "launchfacility_b":
        case "scoutsniper":
        case "sniperescape":
        case "village_assault":
        case "village_defend":
            return 0;
    }

    return 1;
}

_id_31BA( var_0, var_1 )
{
    self waittill( var_0 );

    foreach ( var_3 in var_1 )
    {
        var_4 = var_3["guy"];

        if ( !isdefined( var_4 ) )
            continue;

        var_4._animactive--;
        var_4._lastanimtime = gettime();
    }
}

anim_first_frame( var_0, var_1, var_2 )
{
    var_3 = _id_3CCA( var_2 );
    var_4 = var_3["origin"];
    var_5 = var_3["angles"];
    common_scripts\utility::array_levelthread( var_0, ::anim_first_frame_on_guy, var_1, var_4, var_5 );
}

anim_generic_first_frame( var_0, var_1, var_2 )
{
    var_3 = _id_3CCA( var_2 );
    var_4 = var_3["origin"];
    var_5 = var_3["angles"];
    thread anim_first_frame_on_guy( var_0, var_1, var_4, var_5, "generic" );
}

orient_to_entity_until_flags( var_0, var_1 )
{
    orient_to_point_until_flags( var_0.origin, var_1 );
}

orient_to_point_until_flags( var_0, var_1 )
{
    self endon( "death" );

    while ( !common_scripts\utility::_id_386B( var_1 ) )
    {
        self _meth_8193( "face point", var_0 );
        waittillframeend;
    }

    self _meth_8193( "face default" );
}

anim_generic( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3[0] = var_0;
    anim_single( var_3, var_1, var_2, 0, "generic" );
}

anim_generic_gravity( var_0, var_1, var_2 )
{
    var_3 = var_0.allowpain;
    var_0 maps\_utility::_id_2AC2();
    anim_generic_custom_animmode( var_0, "gravity", var_1, var_2 );

    if ( var_3 )
        var_0 maps\_utility::_id_30D9();
}

anim_generic_run( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3[0] = var_0;
    anim_single( var_3, var_1, var_2, 0.25, "generic" );
}

anim_generic_reach( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3[0] = var_0;
    anim_reach( var_3, var_1, var_2, "generic" );
}

anim_generic_reach_and_arrive( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3[0] = var_0;
    anim_reach_with_funcs( var_3, var_1, var_2, "generic", ::_id_716F, ::_id_7173 );
}

anim_reach_and_plant( var_0, var_1, var_2 )
{
    anim_reach_with_funcs( var_0, var_1, var_2, undefined, ::_id_7170, ::_id_7173 );
}

anim_reach_and_plant_and_arrive( var_0, var_1, var_2 )
{
    anim_reach_with_funcs( var_0, var_1, var_2, undefined, ::_id_7171, ::_id_7173 );
}

anim_generic_loop( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_2 ) && isdefined( self.model ) && !maps\_utility::_id_4749( self.model, var_2 ) )
    {
        anim_generic_loop_preh1( var_0, var_1, var_2, var_3 );
        return;
    }

    var_4 = [];
    var_4["guy"] = var_0;
    var_4["entity"] = self;
    var_4["tag"] = var_2;
    var_5[0] = var_4;
    anim_loop_packet( var_5, var_1, var_3, "generic" );
}

anim_generic_loop_preh1( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {

    }

    var_4 = [];
    var_4["guy"] = var_0;
    var_4["entity"] = self;
    var_4["tag"] = var_3;
    var_5[0] = var_4;
    anim_loop_packet( var_5, var_1, var_2, "generic" );
}

anim_custom_animmode( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_3CCA( var_3 );
    var_5 = var_4["origin"];
    var_6 = var_4["angles"];
    var_7 = undefined;

    foreach ( var_9 in var_0 )
    {
        var_7 = var_9;
        thread anim_custom_animmode_on_guy( var_9, var_1, var_2, var_5, var_6, var_9.animname, 0 );
    }

    var_7 _id_9FF8( var_2 );
    self notify( var_2 );
}

anim_custom_animmode_loop( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_3CCA( var_3 );
    var_5 = var_4["origin"];
    var_6 = var_4["angles"];

    foreach ( var_8 in var_0 )
        thread anim_custom_animmode_on_guy( var_8, var_1, var_2, var_5, var_6, var_8.animname, 1 );

    var_0[0] _id_9FF8( var_2 );
    self notify( var_2 );
}

_id_9FF8( var_0 )
{
    self endon( "finished_custom_animmode" + var_0 );
    self waittill( "death" );
}

anim_generic_custom_animmode( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3CCA( var_3 );
    var_7 = var_6["origin"];
    var_8 = var_6["angles"];
    thread anim_custom_animmode_on_guy( var_0, var_1, var_2, var_7, var_8, "generic", 0, var_4, var_5 );
    var_0 _id_9FF8( var_2 );
    self notify( var_2 );
}

anim_generic_custom_animmode_loop( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3CCA( var_3 );
    var_7 = var_6["origin"];
    var_8 = var_6["angles"];
    thread anim_custom_animmode_on_guy( var_0, var_1, var_2, var_7, var_8, "generic", 1, var_4, var_5 );
    var_0 _id_9FF8( var_2 );
    self notify( var_2 );
}

anim_custom_animmode_solo( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4[0] = var_0;
    anim_custom_animmode( var_4, var_1, var_2, var_3 );
}

anim_custom_animmode_loop_solo( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4[0] = var_0;
    anim_custom_animmode_loop( var_4, var_1, var_2, var_3 );
}

anim_first_frame_solo( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_3CCA( var_2 );
    var_5 = var_4["origin"];
    var_6 = var_4["angles"];
    thread anim_first_frame_on_guy( var_0, var_1, var_5, var_6, var_3 );
}

anim_last_frame_solo( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3[0] = var_0;
    anim_first_frame( var_3, var_1, var_2 );
    anim_set_time( var_3, var_1, 1.0 );
}

assert_existance_of_anim( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = self.animname;

    var_2 = 0;

    if ( isdefined( level._id_78AC[var_1] ) )
    {
        var_2 = 1;

        if ( isdefined( level._id_78AC[var_1][var_0] ) )
            return;
    }

    var_3 = 0;

    if ( isdefined( level._id_78BA[var_1] ) )
    {
        var_3 = 1;

        if ( isdefined( level._id_78BA[var_1][var_0] ) )
            return;
    }

    if ( var_2 || var_3 )
    {
        if ( var_2 )
        {
            var_4 = getarraykeys( level._id_78AC[var_1] );

            foreach ( var_6 in var_4 )
            {

            }
        }

        if ( var_3 )
        {
            var_4 = getarraykeys( level._id_78BA[var_1] );

            foreach ( var_6 in var_4 )
            {

            }
        }

        return;
    }

    var_10 = getarraykeys( level._id_78AC );
    var_10 = common_scripts\utility::array_combine( var_10, getarraykeys( level._id_78BA ) );

    foreach ( var_12 in var_10 )
    {

    }
}

anim_first_frame_on_guy( var_0, var_1, var_2, var_3, var_4 )
{
    var_0._id_380F = gettime();

    if ( isdefined( var_4 ) )
        var_5 = var_4;
    else
        var_5 = var_0.animname;

    var_0 _id_7EC3( var_1, var_2, var_3, var_5 );

    if ( isai( var_0 ) )
    {
        var_0._first_frame_anim = var_1;
        var_0._animname = var_5;
        var_0 _meth_819E( animscripts\first_frame::main );
    }
    else
    {
        var_0 _meth_8143();

        if ( isarray( level._id_78AC[var_5][var_1] ) )
        {
            var_0 _meth_8145( level._id_78AC[var_5][var_1][0], 1, 0, 0 );
            var_0 setanimtime( level._id_78AC[var_5][var_1][0], 0 );
        }
        else
        {
            var_0 _meth_8145( level._id_78AC[var_5][var_1], 1, 0, 0 );
            var_0 setanimtime( level._id_78AC[var_5][var_1], 0 );
        }
    }
}

anim_custom_animmode_on_guy( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( isai( var_0 ) && var_0 maps\_utility::_id_2CE7() )
        return;

    var_9 = undefined;

    if ( isdefined( var_5 ) )
        var_9 = var_5;
    else
        var_9 = var_0.animname;

    if ( !isdefined( var_8 ) || !var_8 )
        var_0 _id_7EC3( var_2, var_3, var_4, var_5, var_6 );

    var_0._animmode = var_1;
    var_0._custom_anim = var_2;
    var_0._tag_entity = self;
    var_0._anime = var_2;
    var_0._animname = var_9;
    var_0._custom_anim_loop = var_6;
    var_0._custom_anim_thread = var_7;
    var_0 _meth_819E( animscripts\animmode::main );
}

anim_loop( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];

    foreach ( var_7 in var_0 )
    {
        var_8 = [];
        var_8["guy"] = var_7;
        var_8["entity"] = self;
        var_8["tag"] = var_3;
        var_8["origin_offset"] = var_4;
        var_5[var_5.size] = var_8;
    }

    anim_loop_packet( var_5, var_1, var_2 );
}

anim_loop_packet_solo( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3[0] = var_0;
    anim_loop_packet( var_3, var_1, var_2 );
}

anim_loop_packet( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( var_0.size <= 0 )
        return;

    foreach ( var_5 in var_0 )
    {
        var_6 = var_5["guy"];

        if ( !isdefined( var_6 ) )
            continue;

        if ( !isdefined( var_6._animactive ) )
            var_6._animactive = 0;

        var_6 endon( "death" );
        var_6._animactive++;
    }

    var_8 = var_0[0]["guy"];

    if ( !isdefined( var_2 ) )
        var_2 = "stop_loop";

    thread _id_31BA( var_2, var_0 );
    self endon( var_2 );
    var_9 = "looping anim";
    var_10 = undefined;

    if ( isdefined( var_3 ) )
        var_10 = var_3;
    else
        var_10 = var_8.animname;

    if ( !assert_existance_of_looping_anim( var_1, var_10 ) )
        return;

    var_11 = 0;
    var_12 = 0;

    for (;;)
    {
        for ( var_11 = anim_weight( var_10, var_1 ); var_11 == var_12 && var_11 != 0; var_11 = anim_weight( var_10, var_1 ) )
        {

        }

        var_12 = var_11;
        var_13 = undefined;
        var_14 = 999999;
        var_15 = undefined;
        var_6 = undefined;

        foreach ( var_34, var_5 in var_0 )
        {
            var_17 = var_5["entity"];
            var_6 = var_5["guy"];
            var_18 = var_17 _id_3CCA( var_5["tag"] );
            var_19 = var_18["origin"];
            var_20 = var_18["angles"];

            if ( isdefined( var_5["origin_offset"] ) )
            {
                var_21 = var_5["origin_offset"];
                var_22 = anglestoforward( var_20 );
                var_23 = anglestoright( var_20 );
                var_24 = anglestoup( var_20 );
                var_19 += var_22 * var_21[0];
                var_19 += var_23 * var_21[1];
                var_19 += var_24 * var_21[2];
            }

            if ( isdefined( var_6._id_734E ) )
            {
                var_6._id_734E = undefined;
                var_0[var_34] = undefined;
                continue;
            }

            var_25 = 0;
            var_26 = 0;
            var_27 = 0;
            var_28 = 0;
            var_29 = undefined;
            var_30 = undefined;
            var_31 = undefined;

            if ( isdefined( var_3 ) )
                var_31 = var_3;
            else
                var_31 = var_6.animname;

            if ( isdefined( level._id_78B2[var_31] ) && isdefined( level._id_78B2[var_31][var_1] ) && isdefined( level._id_78B2[var_31][var_1][var_11] ) )
            {
                var_25 = 1;
                var_29 = level._id_78B2[var_31][var_1][var_11];
            }

            if ( isdefined( level._id_78BA[var_31] ) && isdefined( level._id_78BA[var_31][var_1] ) && isdefined( level._id_78BA[var_31][var_1][var_11] ) )
            {
                var_26 = 1;
                var_30 = level._id_78BA[var_31][var_1][var_11];
            }

            if ( isdefined( level._id_78B0[var_31] ) && isdefined( level._id_78B0[var_31][var_11 + var_1] ) )
                var_6 playsound( level._id_78B0[var_31][var_11 + var_1] );

            if ( isdefined( level._id_78AC[var_31] ) && isdefined( level._id_78AC[var_31][var_1] ) && ( !isai( var_6 ) || !var_6 maps\_utility::_id_2CE7() ) )
                var_27 = 1;

            if ( var_27 )
            {
                if ( isdefined( level._id_78B3[var_31] ) && isdefined( level._id_78B3[var_31][var_1] ) )
                    var_32 = level._id_78B3[var_31][var_1];
                else
                    var_32 = 0.2;

                if ( animhasanimforcedefaultrate( level._id_78AC[var_31][var_1][var_11] ) )
                    var_6 _meth_83C5( level._id_78AC[var_31][var_1][var_11], 1.0 );

                var_6 _id_5509( var_1, var_31 );
                var_6 _meth_8140( var_9, var_19, var_20, level._id_78AC[var_31][var_1][var_11], undefined, undefined, var_32 );
                var_33 = getanimlength( level._id_78AC[var_31][var_1][var_11] );

                if ( var_33 < var_14 )
                {
                    var_14 = var_33;
                    var_13 = var_34;
                }

                thread _id_8C17( var_6, var_9, var_1, var_31, level._id_78AC[var_31][var_1][var_11] );
                thread animscriptdonotetracksthread( var_6, var_9, var_1 );
            }

            if ( var_25 || var_26 )
            {
                if ( isai( var_6 ) )
                {
                    if ( var_27 )
                        var_6 animscripts\face::_id_7828( var_29, var_30, 1.0 );
                    else
                        var_6 animscripts\face::_id_7828( var_29, var_30, 1.0, var_9 );
                }
                else
                    var_6 maps\_utility::_id_69C4( var_30 );

                var_15 = var_34;
            }
        }

        if ( !isdefined( var_6 ) )
            break;

        if ( isdefined( var_13 ) )
        {
            var_0[var_13]["guy"] waittillmatch( var_9, "end" );
            waitframe;
            continue;
        }

        if ( isdefined( var_15 ) )
        {
            var_0[var_15]["guy"] waittill( var_9 );
            continue;
        }

        return;
    }
}

_id_8C17( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 notify( "stop_sequencing_notetracks" );
    thread _id_61BD( var_0, var_1, self, var_2, var_3, var_4 );
}

anim_single_failsafeonguy( var_0, var_1 )
{

}

anim_single_failsafe( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
        var_3 thread anim_single_failsafeonguy( self, var_1 );
}

anim_single( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_3 ) && !isnumber( var_3 ) )
    {
        var_6 = var_3;
        var_3 = undefined;
    }

    if ( isdefined( var_4 ) && !isstring( var_4 ) )
    {
        var_6 = var_4;
        var_4 = undefined;
    }

    if ( isdefined( var_5 ) && isstring( var_5 ) )
    {
        var_4 = var_5;
        var_5 = undefined;
    }

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    anim_single_internal( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

anim_single_run( var_0, var_1, var_2, var_3 )
{
    anim_single_internal( var_0, var_1, var_2, 0.25, var_3 );
}

anim_single_internal( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    foreach ( var_8 in var_0 )
    {
        if ( !isdefined( var_8 ) )
            continue;

        if ( !isdefined( var_8._animactive ) )
            var_8._animactive = 0;

        var_8._animactive++;
    }

    var_10 = _id_3CCA( var_2, var_6 );
    var_11 = var_10["origin"];
    var_12 = var_10["angles"];

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    var_13 = undefined;
    var_14 = 999999;

    if ( var_5 )
        var_14 = 0;

    var_15 = undefined;
    var_16 = undefined;
    var_17 = undefined;
    var_18 = "single anim";

    foreach ( var_31, var_8 in var_0 )
    {
        var_20 = 0;
        var_21 = 0;
        var_22 = 0;
        var_23 = 0;
        var_24 = undefined;
        var_25 = undefined;
        var_26 = undefined;

        if ( isdefined( var_4 ) )
            var_26 = var_4;
        else
            var_26 = var_8.animname;

        if ( isdefined( level._id_78B2[var_26] ) && isdefined( level._id_78B2[var_26][var_1] ) )
        {
            var_20 = 1;
            var_25 = level._id_78B2[var_26][var_1];
            var_17 = var_25;
        }

        if ( isdefined( level._id_78BA[var_26] ) && isdefined( level._id_78BA[var_26][var_1] ) )
        {
            var_21 = 1;
            var_24 = level._id_78BA[var_26][var_1];
        }

        if ( isdefined( level._id_78AC[var_26] ) && isdefined( level._id_78AC[var_26][var_1] ) && ( !isai( var_8 ) || !var_8 maps\_utility::_id_2CE7() ) )
            var_22 = 1;

        if ( isdefined( level._id_78B0[var_26] ) && isdefined( level._id_78B0[var_26][var_1] ) )
            var_8 playsound( level._id_78B0[var_26][var_1] );

        if ( var_22 )
        {
            if ( isdefined( level._id_78B3[var_26] ) && isdefined( level._id_78B3[var_26][var_1] ) )
                var_27 = level._id_78B3[var_26][var_1];
            else
                var_27 = 0.2;

            var_8 _id_5509( var_1, var_26 );

            if ( isplayer( var_8 ) )
            {
                var_28 = level._id_78AC[var_26]["root"];
                var_8 _meth_814D( var_28, 0, var_27 );
                var_29 = level._id_78AC[var_26][var_1];
                var_8 setflaggedanim( var_18, var_29, 1, var_27 );
            }
            else if ( var_8.code_classname == "misc_turret" )
            {
                var_29 = level._id_78AC[var_26][var_1];
                var_8 setflaggedanim( var_18, var_29, 1, var_27 );
            }
            else
            {
                var_29 = level._id_78AC[var_26][var_1];

                if ( !var_20 && animscripts\face::animhasfacialoverride( var_29 ) )
                    var_8 animscripts\face::clearfacialanim();

                if ( animhasanimforcedefaultrate( var_29 ) )
                    var_8 _meth_83C5( var_29, 1.0 );

                var_8 _meth_8140( var_18, var_11, var_12, var_29, undefined, undefined, var_27 );
            }

            var_30 = getanimlength( level._id_78AC[var_26][var_1] );

            if ( var_30 < var_14 && !var_5 || var_30 > var_14 && var_5 )
            {
                var_14 = var_30;
                var_13 = var_31;
            }

            thread _id_8C17( var_8, var_18, var_1, var_26, level._id_78AC[var_26][var_1] );
            thread animscriptdonotetracksthread( var_8, var_18, var_1 );
        }

        if ( var_20 || var_21 )
        {
            if ( var_20 )
            {
                if ( var_21 )
                    var_8 thread _id_27DF( var_1, var_20, var_24, level._id_78B2[var_26][var_1] );

                thread anim_facialanim( var_8, var_1, level._id_78B2[var_26][var_1] );
                var_16 = var_31;
            }
            else if ( isai( var_8 ) )
            {
                if ( var_22 )
                    var_8 animscripts\face::_id_7828( var_25, var_24, 1.0 );
                else
                {
                    if ( !isdefined( var_8._id_2B10 ) || !var_8._id_2B10 )
                        var_8 thread anim_facialfiller( "single dialogue" );

                    var_8 animscripts\face::_id_7828( var_25, var_24, 1.0, "single dialogue" );
                }
            }
            else
            {
                var_8 thread maps\_utility::_id_69C4( var_24, "single dialogue" );

                if ( var_8 _meth_851E() )
                {

                }
            }

            var_15 = var_31;
        }
    }

    if ( isdefined( var_13 ) )
    {
        var_32 = spawnstruct();
        var_32 thread anim_deathnotify( var_0[var_13], var_1 );
        var_32 thread anim_animationendnotify( var_0[var_13], var_1, var_14, var_3 );
        var_32 waittill( var_1 );
    }
    else if ( isdefined( var_16 ) )
    {
        var_32 = spawnstruct();
        var_32 thread anim_deathnotify( var_0[var_16], var_1 );
        var_32 thread anim_facialendnotify( var_0[var_16], var_1, var_17 );
        var_32 waittill( var_1 );
    }
    else if ( isdefined( var_15 ) )
    {
        var_32 = spawnstruct();
        var_32 thread anim_deathnotify( var_0[var_15], var_1 );
        var_32 thread anim_dialogueendnotify( var_0[var_15], var_1 );
        var_32 waittill( var_1 );
    }

    foreach ( var_8 in var_0 )
    {
        if ( !isdefined( var_8 ) )
            continue;

        if ( isplayer( var_8 ) )
        {
            var_26 = undefined;

            if ( isdefined( var_4 ) )
                var_26 = var_4;
            else
                var_26 = var_8.animname;

            if ( isdefined( level._id_78AC[var_26][var_1] ) )
            {
                var_28 = level._id_78AC[var_26]["root"];
                var_8 _meth_814D( var_28, 1, 0.2 );
                var_29 = level._id_78AC[var_26][var_1];
                var_8 _meth_8144( var_29, 0.2 );
            }
        }

        var_8._animactive--;
        var_8._lastanimtime = gettime();
    }

    self notify( var_1 );
}

anim_deathnotify( var_0, var_1 )
{
    self endon( var_1 );
    var_0 waittill( "death" );

    if ( isdefined( var_0.anim_is_death ) && var_0.anim_is_death )
        return;

    self notify( var_1 );
}

anim_facialendnotify( var_0, var_1, var_2 )
{
    self endon( var_1 );
    var_3 = getanimlength( var_2 );
    wait(var_3);
    self notify( var_1 );
}

anim_dialogueendnotify( var_0, var_1 )
{
    self endon( var_1 );
    var_0 waittill( "single dialogue" );
    self notify( var_1 );
}

anim_animationendnotify( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 );
    var_0 endon( "death" );
    var_2 -= var_3;

    if ( var_3 > 0 && var_2 > 0 )
    {
        var_0 maps\_utility::_id_A098( "single anim", "end", var_2 );
        var_0 _meth_8143();
    }
    else
        var_0 waittillmatch( "single anim", "end" );

    self notify( var_1 );
}

animscriptdonotetracksthread( var_0, var_1, var_2 )
{
    if ( isdefined( var_0._id_2D31 ) && var_0._id_2D31 )
        return;

    var_0 endon( "stop_sequencing_notetracks" );
    var_0 endon( "death" );
    var_0 animscripts\shared::_id_2D06( var_1, undefined, undefined, 1 );
}

add_animsound( var_0 )
{
    for ( var_1 = 0; var_1 < level.animsound_hudlimit; var_1++ )
    {
        if ( isdefined( self.animsounds[var_1] ) )
            continue;

        self.animsounds[var_1] = var_0;
        return;
    }

    var_2 = getarraykeys( self.animsounds );
    var_3 = var_2[0];
    var_4 = self.animsounds[var_3]._id_3152;

    for ( var_1 = 1; var_1 < var_2.size; var_1++ )
    {
        var_5 = var_2[var_1];

        if ( self.animsounds[var_5]._id_3152 < var_4 )
        {
            var_4 = self.animsounds[var_5]._id_3152;
            var_3 = var_5;
        }
    }

    self.animsounds[var_3] = var_0;
}

animsound_exists( var_0, var_1 )
{
    var_1 = tolower( var_1 );
    var_2 = getarraykeys( self.animsounds );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( self.animsounds[var_4].anime != var_0 )
            continue;

        if ( self.animsounds[var_4]._id_6177 != var_1 )
            continue;

        self.animsounds[var_4]._id_3152 = gettime() + 60000;
        return 1;
    }

    return 0;
}

animsound_tracker( var_0, var_1, var_2 )
{
    var_1 = tolower( var_1 );
    add_to_animsound();

    if ( var_1 == "end" )
        return;

    if ( animsound_exists( var_0, var_1 ) )
        return;

    var_3 = spawnstruct();
    var_3.anime = var_0;
    var_3._id_6177 = var_1;
    var_3.animname = var_2;
    var_3._id_3152 = gettime() + 60000;
    add_animsound( var_3 );
}

animsound_start_tracker( var_0, var_1 )
{
    add_to_animsound();
    var_2 = spawnstruct();
    var_2.anime = var_0;
    var_2._id_6177 = "#" + var_0;
    var_2.animname = var_1;
    var_2._id_3152 = gettime() + 60000;

    if ( animsound_exists( var_0, var_2._id_6177 ) )
        return;

    add_animsound( var_2 );
}

animsound_start_tracker_loop( var_0, var_1, var_2 )
{
    add_to_animsound();
    var_0 = var_1 + var_0;
    var_3 = spawnstruct();
    var_3.anime = var_0;
    var_3._id_6177 = "#" + var_0;
    var_3.animname = var_2;
    var_3._id_3152 = gettime() + 60000;

    if ( animsound_exists( var_0, var_3._id_6177 ) )
        return;

    add_animsound( var_3 );
}

_id_61BD( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 endon( "stop_sequencing_notetracks" );
    var_0 endon( "death" );

    if ( isdefined( var_2 ) )
        var_6 = var_2;
    else
        var_6 = self;

    var_7 = undefined;

    if ( isdefined( var_4 ) )
        var_7 = var_4;
    else
        var_7 = var_0.animname;

    var_8 = spawnstruct();
    var_8._id_29E7 = [];
    var_9 = [];

    if ( isdefined( var_7 ) && isdefined( level._id_78B6[var_7] ) )
    {
        if ( isdefined( level._id_78B6[var_7][var_3] ) )
            var_9[var_3] = level._id_78B6[var_7][var_3];

        if ( isdefined( level._id_78B6[var_7]["any"] ) )
            var_9["any"] = level._id_78B6[var_7]["any"];
    }

    foreach ( var_18, var_11 in var_9 )
    {
        foreach ( var_13 in level._id_78B6[var_7][var_18] )
        {
            foreach ( var_15 in var_13 )
            {
                if ( isdefined( var_15["dialog"] ) )
                    var_8._id_29E7[var_15["dialog"]] = 1;
            }
        }
    }

    var_22 = 0;
    var_23 = 0;

    for (;;)
    {
        var_8._id_2A49 = 0;
        var_20 = undefined;

        if ( !var_22 && isdefined( var_7 ) && isdefined( var_3 ) )
        {
            var_22 = 1;
            var_24 = undefined;
            var_23 = isdefined( level._id_78B6[var_7] ) && isdefined( level._id_78B6[var_7][var_3] ) && isdefined( level._id_78B6[var_7][var_3]["start"] );

            if ( !var_23 )
                continue;

            var_20 = "start";
        }
        else
            var_0 waittill( var_1, var_20 );

        if ( var_20 == "end" )
            return;

        foreach ( var_18, var_11 in var_9 )
        {
            if ( isdefined( level._id_78B6[var_7][var_18][var_20] ) )
            {
                if ( getdvarint( "enableMW1GetArrayKeysAndForEach" ) != 0 )
                {
                    for ( var_26 = 0; var_26 < level._id_78B6[var_7][var_18][var_20].size; var_26++ )
                    {
                        var_15 = level._id_78B6[var_7][var_18][var_20][var_26];
                        anim_handle_notetrack( var_15, var_0, var_8, var_6 );
                    }

                    continue;
                }

                foreach ( var_15 in level._id_78B6[var_7][var_18][var_20] )
                    anim_handle_notetrack( var_15, var_0, var_8, var_6 );
            }
        }

        var_29 = getsubstr( var_20, 0, 3 );

        if ( var_29 == "ps_" )
        {
            var_30 = getsubstr( var_20, 3 );

            if ( isdefined( var_0.anim_playsound_func ) )
                var_0 thread [[ var_0.anim_playsound_func ]]( var_30, "j_head", 1 );
            else
                var_0 thread maps\_utility::_id_69C5( var_30, undefined, 1 );

            continue;
        }

        if ( var_29 == "vo_" )
        {
            var_30 = getsubstr( var_20, 3 );

            if ( isdefined( var_0.anim_playsound_func ) )
                var_0 thread [[ var_0.anim_playsound_func ]]( var_30, "j_head", 1 );
            else
                var_0 thread maps\_utility::_id_69C5( var_30, "j_head", 1 );

            continue;
        }

        if ( var_29 == "sd_" )
        {
            var_30 = getsubstr( var_20, 3 );
            var_0 thread maps\_utility::_id_865D( var_30 );
            continue;
        }

        if ( var_29 == "fx_" )
        {
            var_31 = strtok( tolower( getsubstr( var_20, 3 ) ), ",() " );

            if ( var_31.size == 2 )
            {
                if ( var_31[0] == "exploder" )
                {
                    common_scripts\_exploder::_id_3528( var_31[1] );
                    continue;
                }
                else if ( var_31[0] == "stop_exploder" )
                {
                    maps\_utility::_id_8E7E( var_31[1] );
                    continue;
                }
                else
                {
                    playfxontag( level._effect[var_31[0]], var_0, var_31[1] );
                    continue;
                }
            }
            else if ( var_31.size == 3 )
            {
                if ( var_31[0] == "playfxontag" )
                {
                    playfxontag( level._effect[var_31[1]], var_0, var_31[2] );
                    continue;
                }
                else if ( var_31[0] == "stopfxontag" )
                {
                    stopfxontag( level._effect[var_31[1]], var_0, var_31[2] );
                    continue;
                }
                else if ( var_31[0] == "killfxontag" )
                {
                    killfxontag( level._effect[var_31[1]], var_0, var_31[2] );
                    continue;
                }
            }
            else if ( var_31.size == 11 )
            {
                var_32 = ( float( var_31[2] ), float( var_31[3] ), float( var_31[4] ) );
                var_33 = ( float( var_31[5] ), float( var_31[6] ), float( var_31[7] ) );
                var_34 = ( float( var_31[8] ), float( var_31[9] ), float( var_31[10] ) );
                playfx( level._effect[var_31[1]], var_32, var_33, var_34 );
            }
        }

        var_29 = getsubstr( var_20, 0, 4 );

        if ( var_29 == "psr_" )
        {
            var_30 = getsubstr( var_20, 4 );
            maps\_utility::_id_70BD( var_30 );
            continue;
        }

        switch ( var_20 )
        {
            case "ignoreall true":
                self.ignoreall = 1;
                continue;
            case "ignoreall false":
                self.ignoreall = 0;
                continue;
            case "ignoreme true":
                self.ignoreme = 1;
                continue;
            case "ignoreme false":
                self.ignoreme = 0;
                continue;
            case "allowdeath true":
                self.allowdeath = 1;
                continue;
            case "allowdeath false":
                self.allowdeath = 0;
                continue;
        }
    }
}

anim_handle_notetrack( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0["function"] ) )
    {
        if ( !isdefined( var_0["function_args"] ) )
            self thread [[ var_0["function"] ]]( var_1 );
        else
            self thread [[ var_0["function"] ]]( var_1, var_0["function_args"] );
    }

    if ( isdefined( var_0["flag"] ) )
        common_scripts\utility::_id_383F( var_0["flag"] );

    if ( isdefined( var_0["flag_clear"] ) )
        common_scripts\utility::_id_3831( var_0["flag_clear"] );

    if ( isdefined( var_0["notify"] ) )
        level notify( var_0["notify"] );

    if ( isdefined( var_0["attach gun left"] ) )
    {
        var_1 _id_445F();
        return;
    }

    if ( isdefined( var_0["attach gun right"] ) )
    {
        var_1 _id_4460();
        return;
    }

    if ( isdefined( var_0["detach gun"] ) )
    {
        var_1 _id_445B( var_0 );
        return;
    }

    if ( isdefined( var_0["attach model"] ) )
    {
        if ( isdefined( var_0["selftag"] ) )
            var_1 attach( var_0["attach model"], var_0["selftag"] );
        else
            var_3 attach( var_0["attach model"], var_0["tag"] );

        return;
    }

    if ( isdefined( var_0["detach model"] ) )
    {
        waitframe;

        if ( isdefined( var_0["selftag"] ) )
            var_1 detach( var_0["detach model"], var_0["selftag"] );
        else
            var_3 detach( var_0["detach model"], var_0["tag"] );
    }

    if ( isdefined( var_0["sound"] ) )
    {
        var_4 = undefined;

        if ( !isdefined( var_0["sound_stays_death"] ) )
            var_4 = 1;

        var_5 = undefined;

        if ( isdefined( var_0["sound_on_tag"] ) )
            var_5 = var_0["sound_on_tag"];

        var_1 thread maps\_utility::_id_69C5( var_0["sound"], var_5, var_4 );
    }

    if ( isdefined( var_0["playersound"] ) )
        level.player playsound( var_0["playersound"] );

    if ( !var_2._id_2A49 )
    {
        if ( isdefined( var_0["dialog"] ) && isdefined( var_2._id_29E7[var_0["dialog"]] ) )
        {
            var_1 animscripts\face::_id_7828( undefined, var_0["dialog"], 1.0 );
            var_2._id_29E7[var_0["dialog"]] = undefined;
            var_2._id_2A49 = 1;
        }
    }

    if ( isdefined( var_0["create model"] ) )
        anim_addmodel( var_1, var_0 );
    else if ( isdefined( var_0["delete model"] ) )
        anim_removemodel( var_1, var_0 );

    if ( isdefined( var_0["selftag"] ) )
    {
        if ( isdefined( var_0["effect"] ) )
        {
            var_6 = isdefined( var_0["moreThanThreeHack"] );

            if ( var_6 )
                common_scripts\utility::_id_57FE( "moreThanThreeHack" );

            playfxontag( level._effect[var_0["effect"]], var_1, var_0["selftag"] );

            if ( var_6 )
                common_scripts\utility::_id_9A45( "moreThanThreeHack" );
        }

        if ( isdefined( var_0["stop_effect"] ) )
            stopfxontag( level._effect[var_0["stop_effect"]], var_1, var_0["selftag"] );

        if ( isdefined( var_0["swap_part_to_efx"] ) )
        {
            playfxontag( level._effect[var_0["swap_part_to_efx"]], var_1, var_0["selftag"] );
            var_1 hidepart( var_0["selftag"] );
        }

        if ( isdefined( var_0["trace_part_for_efx"] ) )
        {
            var_7 = undefined;
            var_8 = common_scripts\utility::_id_3FA8( var_0["trace_part_for_efx"] );

            if ( isdefined( var_0["trace_part_for_efx_water"] ) )
                var_7 = common_scripts\utility::_id_3FA8( var_0["trace_part_for_efx_water"] );

            var_9 = 0;

            if ( isdefined( var_0["trace_part_for_efx_delete_depth"] ) )
                var_9 = var_0["trace_part_for_efx_delete_depth"];

            var_1 thread _id_9492( var_0["selftag"], var_8, var_7, var_9 );
        }

        if ( isdefined( var_0["trace_part_for_efx_canceling"] ) )
            var_1 thread _id_9493( var_0["selftag"] );
    }

    if ( isdefined( var_0["tag"] ) && isdefined( var_0["effect"] ) )
        playfxontag( level._effect[var_0["effect"]], var_3, var_0["tag"] );

    if ( isdefined( var_0["selftag"] ) && isdefined( var_0["effect_looped"] ) )
        playfxontag( level._effect[var_0["effect_looped"]], var_1, var_0["selftag"] );

    if ( isdefined( var_0["lui_notify"] ) )
        luinotifyevent( var_0["lui_notify"], 0 );

    if ( isdefined( var_0["omnvar"] ) )
        setomnvar( var_0["omnvar"], var_0["value"] );
}

_id_9493( var_0 )
{
    self notify( "cancel_trace_for_part_" + var_0 );
}

_id_9492( var_0, var_1, var_2, var_3 )
{
    var_4 = "trace_part_for_efx";
    self endon( "cancel_trace_for_part_" + var_0 );
    var_5 = self gettagorigin( var_0 );
    var_6 = 0;
    var_7 = spawnstruct();
    var_7._id_554A = self gettagorigin( var_0 );
    var_7._id_491F = 0;
    var_7._id_6699 = var_0;
    var_7._id_4921 = 0;
    var_7._id_3018 = var_1;
    var_7._id_8D75 = 0;
    var_7._id_5543 = gettime();

    while ( isdefined( self ) && !var_7._id_491F )
    {
        common_scripts\utility::_id_57FE( var_4 );
        _id_92AD( var_7 );
        common_scripts\utility::_id_9A4A( var_4 );

        if ( var_7._id_8D75 == 1 && gettime() - var_7._id_5543 > 3000 )
            return;
    }

    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_2 ) && var_7._id_4921 )
        var_1 = var_2;

    playfx( var_1, var_7._id_554A );

    if ( var_3 == 0 )
        self hidepart( var_0 );
    else
        thread _id_487D( var_7._id_554A[2] - var_3, var_0 );
}

_id_487D( var_0, var_1 )
{
    self endon( "entitydeleted" );

    while ( self gettagorigin( var_1 )[2] > var_0 )
        wait 0.05;

    self hidepart( var_1 );
}

_id_92AD( var_0 )
{
    var_1 = undefined;

    if ( !isdefined( self ) )
        return;

    var_0._id_24F5 = self gettagorigin( var_0._id_6699 );

    if ( var_0._id_24F5 != var_0._id_554A )
    {
        var_0._id_5543 = gettime();
        var_0._id_8D75 = 0;

        if ( !bullettracepassed( var_0._id_554A, var_0._id_24F5, 0, self ) )
        {
            var_2 = bullettrace( var_0._id_554A, var_0._id_24F5, 0, self );

            if ( var_2["fraction"] < 1.0 )
            {
                var_0._id_554A = var_2["position"];
                var_0._id_4921 = var_2["surfacetype"] == "water";
                var_0._id_491F = 1;
                return;
            }
            else
            {

            }
        }
    }
    else
        var_0._id_8D75 = 1;

    var_0._id_554A = var_0._id_24F5;
}

anim_addmodel( var_0, var_1 )
{
    if ( !isdefined( var_0._id_7B42 ) )
        var_0._id_7B42 = [];

    var_2 = var_0._id_7B42.size;
    var_0._id_7B42[var_2] = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0._id_7B42[var_2] setmodel( var_1["create model"] );
    var_0._id_7B42[var_2].origin = var_0 gettagorigin( var_1["selftag"] );
    var_0._id_7B42[var_2].angles = var_0 gettagangles( var_1["selftag"] );
}

anim_removemodel( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0._id_7B42.size; var_2++ )
    {
        if ( isdefined( var_1["explosion"] ) )
        {
            var_3 = anglestoforward( var_0._id_7B42[var_2].angles );
            var_3 *= 120;
            var_3 += var_0._id_7B42[var_2].origin;
            playfx( level._effect[var_1["explosion"]], var_0._id_7B42[var_2].origin );
            radiusdamage( var_0._id_7B42[var_2].origin, 350, 700, 50 );
        }

        var_0._id_7B42[var_2] delete();
    }
}

_id_445F()
{
    if ( !isdefined( self._id_445E ) )
        return;

    self._id_445E delete();
    self.dropweapon = 1;
    animscripts\shared::_id_6869( self.weapon, "left" );
}

_id_4460()
{
    if ( !isdefined( self._id_445E ) )
        return;

    self._id_445E delete();
    self.dropweapon = 1;
    animscripts\shared::_id_6869( self.weapon, "right" );
}

_id_445B( var_0 )
{
    if ( isdefined( self._id_445E ) )
        return;

    var_1 = self gettagorigin( var_0["tag"] );
    var_2 = self gettagangles( var_0["tag"] );
    var_3 = 0;

    if ( isdefined( var_0["suspend"] ) )
        var_3 = var_0["suspend"];

    var_4 = spawn( "weapon_" + self.weapon, var_1, var_3 );
    var_4.angles = var_2;
    self._id_445E = var_4;
    animscripts\shared::_id_6869( self.weapon, "none" );
    self.dropweapon = 0;
}

assert_existance_of_looping_anim( var_0, var_1 )
{
    if ( !isdefined( level._id_78AC[var_1][var_0] ) )
        return 0;

    if ( !isarray( level._id_78AC[var_1][var_0] ) )
        return 0;

    return 1;
}

anim_weight( var_0, var_1 )
{
    var_2 = level._id_78AC[var_0][var_1].size;
    var_3 = randomint( var_2 );

    if ( var_2 > 1 )
    {
        var_4 = 0;
        var_5 = 0;

        for ( var_6 = 0; var_6 < var_2; var_6++ )
        {
            if ( isdefined( level._id_78AC[var_0][var_1 + "weight"] ) )
            {
                if ( isdefined( level._id_78AC[var_0][var_1 + "weight"][var_6] ) )
                {
                    var_4++;
                    var_5 += level._id_78AC[var_0][var_1 + "weight"][var_6];
                }
            }
        }

        if ( var_4 == var_2 )
        {
            var_7 = randomfloat( var_5 );
            var_5 = 0;

            for ( var_6 = 0; var_6 < var_2; var_6++ )
            {
                var_5 += level._id_78AC[var_0][var_1 + "weight"][var_6];

                if ( var_7 < var_5 )
                {
                    var_3 = var_6;
                    break;
                }
            }
        }
    }

    return var_3;
}

anim_reach_and_idle( var_0, var_1, var_2, var_3, var_4 )
{
    thread anim_reach( var_0, var_1, var_4 );
    var_5 = spawnstruct();
    var_5._id_7175 = 0;

    foreach ( var_7 in var_0 )
    {
        var_5._id_7175++;
        thread _id_4B73( var_7, var_2, var_3, var_4, var_5 );
    }

    for (;;)
    {
        var_5 waittill( "reached_position" );

        if ( var_5._id_7175 <= 0 )
            return;
    }
}

_id_9FA5()
{
    self endon( "death" );
    self waittill( "anim_reach_complete" );
}

_id_4B73( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 _id_9FA5();
    var_4._id_7175--;
    var_4 notify( "reached_position" );

    if ( isalive( var_0 ) )
        anim_loop_solo( var_0, var_1, var_3, var_2 );
}

_id_3CCA( var_0, var_1 )
{
    var_2 = ( 0.0, 0.0, 0.0 );
    var_3 = ( 0.0, 0.0, 0.0 );

    if ( !isdefined( var_1 ) )
        var_1 = self;

    if ( can_get_anim_position_from_tag( var_1, var_0 ) )
    {
        var_2 = var_1 gettagorigin( var_0 );
        var_3 = var_1 gettagangles( var_0 );
    }
    else
    {
        if ( isdefined( var_1.origin ) )
            var_2 = var_1.origin;

        if ( isdefined( var_1.angles ) )
            var_3 = var_1.angles;
    }

    var_4 = [];
    var_4["angles"] = var_3;
    var_4["origin"] = var_2;
    return var_4;
}

can_get_anim_position_from_tag( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_1 ) )
        return 0;

    if ( !isdefined( var_0 _meth_83B6() ) )
        return 0;

    if ( var_0 _meth_83B6() == "" )
        return 0;

    if ( !maps\_utility::_id_4749( var_0 _meth_83B6(), var_1 ) )
        return 0;

    return 1;
}

anim_reach_together( var_0, var_1, var_2, var_3 )
{
    thread _id_5D4C( var_0 );
    anim_reach_with_funcs( var_0, var_1, var_2, var_3, ::_id_7172, ::_id_7173 );
}

_id_5D4C( var_0 )
{
    var_1 = 0.3;
    waitframe;

    for (;;)
    {
        var_0 = maps\_utility::_id_733F( var_0 );
        var_2 = [];
        var_3 = 0;

        foreach ( var_8, var_5 in var_0 )
        {
            var_6 = var_5.goalpos;

            if ( isdefined( var_5._id_716E ) )
                var_6 = var_5._id_716E;

            var_7 = distance( var_5.origin, var_6 );
            var_2[var_5._id_9A29] = var_7;

            if ( var_7 <= 4 )
            {
                var_0[var_8] = undefined;
                continue;
            }

            var_3 += var_7;
        }

        if ( var_0.size <= 1 )
            break;

        var_3 /= var_0.size;

        foreach ( var_5 in var_0 )
        {
            var_10 = var_2[var_5._id_9A29] - var_3;
            var_11 = var_10 * 0.003;

            if ( var_11 > var_1 )
                var_11 = var_1;
            else if ( var_11 < var_1 * -1 )
                var_11 = var_1 * -1;

            var_5._id_5F65 = 1 + var_11;
        }

        wait 0.05;
    }

    foreach ( var_5 in var_0 )
    {
        if ( isalive( var_5 ) )
            var_5._id_5F65 = 1;
    }
}

anim_reach_failsafe( var_0, var_1 )
{
    if ( isarray( var_0 ) )
    {
        foreach ( var_3 in var_0 )
            thread anim_reach_failsafe( var_3, var_1 );

        return;
    }

    var_3 = var_0;
    var_3 endon( "new_anim_reach" );
    wait(var_1);
    var_3 notify( "goal" );
}

anim_reach( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = self;

    if ( isdefined( var_4 ) && !isnumber( var_4 ) )
    {
        var_6 = var_4;
        var_3 = var_5;
        var_4 = undefined;
    }
    else if ( isdefined( var_3 ) && !isstring( var_3 ) )
    {
        var_6 = var_3;
        var_3 = var_5;
        var_4 = undefined;
    }

    return var_6 anim_reach_with_funcs( var_0, var_1, var_2, var_3, ::_id_7172, ::_id_7173, undefined, var_4 );
}

anim_reach_with_funcs( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = maps\_utility::get_anim_reach_unique_id();
    var_9 = _id_3CCA( var_2 );
    var_10 = var_9["origin"];
    var_11 = var_9["angles"];

    if ( isdefined( var_6 ) )
    {
        self.type = var_6;
        self.arrivalstance = "stand";
    }

    var_12 = spawnstruct();
    var_13 = 0;
    var_14 = 0;

    foreach ( var_16 in var_0 )
    {
        if ( isdefined( var_6 ) )
            var_16.scriptedarrivalent = self;

        if ( isdefined( var_3 ) )
            var_17 = var_3;
        else
            var_17 = var_16.animname;

        if ( isdefined( level._id_78AC[var_17][var_1] ) )
        {
            if ( isarray( level._id_78AC[var_17][var_1] ) )
                var_18 = getstartorigin( var_10, var_11, level._id_78AC[var_17][var_1][0] );
            else
                var_18 = getstartorigin( var_10, var_11, level._id_78AC[var_17][var_1] );
        }
        else
            var_18 = var_10;

        var_14++;
        var_16 thread begin_anim_reach( var_12, var_18, var_4, var_5, var_1, var_7, var_8 );
    }

    var_20 = 1;
    var_12 thread _id_5DF6( thisthread, var_0, self, var_6, var_8 );

    while ( var_14 )
    {
        var_12 waittill( "reach_notify", var_16, var_21, var_22 );

        if ( isdefined( var_16 ) )
            var_16.anim_reach_success = var_21;

        if ( !var_21 )
            var_20 = 0;

        var_14--;
    }

    anim_reach_cleanup( var_0, self, var_6 );
    var_12 notify( "end_reach_thread_monitor" );
    return var_20;
}

anim_reach_cleanup( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_0 )
    {
        if ( isalive( var_4 ) && var_4.anim_reach_success )
        {
            var_4.goalradius = var_4._id_63CC;
            var_4.scriptedarrivalent = undefined;
            var_4.stopanimdistsq = 0;
        }

        if ( isdefined( var_4 ) )
            var_4.anim_reach_success = undefined;
    }

    if ( isdefined( var_2 ) )
        var_1.type = undefined;
}

_id_5DF6( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "end_reach_thread_monitor" );

    while ( isdefined( var_0 ) )
        waittillframeend;

    foreach ( var_6 in var_1 )
    {
        if ( isdefined( var_6 ) )
        {
            var_6.anim_reach_success = 1;
            var_6._id_716C = 1;
            var_6 notify( "goal", var_4 );

            if ( isdefined( var_6.name ) )
            {

            }
            else
            {

            }

            continue;
        }
    }

    anim_reach_cleanup( var_1, var_2, var_3 );
}

anim_reach_cleanup_solo( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    if ( isdefined( var_0._id_63CC ) )
        var_0.goalradius = var_0._id_63CC;

    var_0.scriptedarrivalent = undefined;
    var_0.stopanimdistsq = 0;
}

anim_teleport( var_0, var_1, var_2 )
{
    var_3 = _id_3CCA( var_2 );
    var_4 = var_3["origin"];
    var_5 = var_3["angles"];

    foreach ( var_7 in var_0 )
    {
        var_8 = getstartorigin( var_4, var_5, level._id_78AC[var_7.animname][var_1] );
        var_9 = getstartangles( var_4, var_5, level._id_78AC[var_7.animname][var_1] );

        if ( isai( var_7 ) )
        {
            var_7 _meth_81C9( var_8 );
            continue;
        }

        var_7.origin = var_8;
        var_7.angles = var_9;
    }
}

anim_moveto( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3CCA( var_2 );
    var_7 = var_6["origin"];
    var_8 = var_6["angles"];

    foreach ( var_10 in var_0 )
    {
        var_11 = getstartorigin( var_7, var_8, level._id_78AC[var_10.animname][var_1] );
        var_12 = getstartangles( var_7, var_8, level._id_78AC[var_10.animname][var_1] );

        if ( isai( var_10 ) )
            continue;

        var_10 moveto( var_11, var_3, var_4, var_5 );
        var_10 rotateto( var_12, var_3, var_4, var_5 );
    }
}

anim_generic_teleport( var_0, var_1, var_2 )
{
    var_3 = _id_3CCA( var_2 );
    var_4 = var_3["origin"];
    var_5 = var_3["angles"];
    var_6 = getstartorigin( var_4, var_5, level._id_78AC["generic"][var_1] );
    var_7 = getstartangles( var_4, var_5, level._id_78AC["generic"][var_1] );

    if ( isai( var_0 ) )
        var_0 _meth_81C9( var_6 );
    else
    {
        var_0.origin = var_6;
        var_0.angles = var_7;
    }
}

anim_spawn_generic_model( var_0, var_1, var_2 )
{
    return anim_spawn_model( var_0, "generic", var_1, var_2 );
}

anim_spawn_model( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_3CCA( var_3 );
    var_5 = var_4["origin"];
    var_6 = var_4["angles"];
    var_7 = getstartorigin( var_5, var_6, level._id_78AC[var_1][var_2] );
    var_8 = getstartorigin( var_5, var_6, level._id_78AC[var_1][var_2] );
    var_9 = spawn( "script_model", var_7 );
    var_9 setmodel( var_0 );
    var_9.angles = var_8;
    return var_9;
}

anim_spawn_tag_model( var_0, var_1 )
{
    self attach( var_0, var_1 );
}

anim_link_tag_model( var_0, var_1 )
{
    var_2 = self gettagorigin( var_1 );
    var_3 = spawn( "script_model", var_2 );
    var_3 setmodel( var_0 );
    var_3 linkto( self, var_1, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    return var_3;
}

anim_spawner_teleport( var_0, var_1, var_2 )
{
    var_3 = _id_3CCA( var_2 );
    var_4 = var_3["origin"];
    var_5 = var_3["angles"];
    var_6 = spawnstruct();

    foreach ( var_8 in var_0 )
    {
        var_9 = getstartorigin( var_4, var_5, level._id_78AC[var_8.animname][var_1] );
        var_8.origin = var_9;
    }
}

_id_716D( var_0, var_1, var_2 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "goal", var_3 );

        if ( !isdefined( var_3 ) || var_3 == var_2 )
            break;
    }

    var_4 = isalive( self ) && distancesquared( self.origin, var_1 ) <= 2500;
    var_0 notify( "reach_notify", self, var_4, var_2 );
}

begin_anim_reach( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );
    self endon( "new_anim_reach" );
    var_1 = [[ var_2 ]]( var_1 );
    thread _id_716D( var_0, var_1, var_6 );
    maps\_utility::_id_7E4D( var_1 );
    self._id_716E = var_1;
    self.goalradius = 0;

    if ( isdefined( self.a.animreachcustomradius ) )
        self.goalradius = self.a.animreachcustomradius;

    self waittill( "goal" );

    if ( isdefined( self._id_716C ) )
        self._id_716C = undefined;

    self notify( "anim_reach_complete" );
    [[ var_3 ]]();
    self notify( "new_anim_reach" );
}

_id_7172( var_0 )
{
    if ( isdefined( self._id_251A ) )
    {

    }

    self._id_63CC = self.goalradius;
    self._id_63DD = self.pathenemyfightdist;
    self._id_63DE = self.pathenemylookahead;
    self.pathenemyfightdist = 128;
    self.pathenemylookahead = 128;
    self._id_63E2 = isdefined( self._id_79E6 );

    if ( !isdefined( self._id_67CB ) )
        maps\_utility::_id_2A74();

    anim_changes_pushplayer( 1 );
    self._id_382C = self.fixednode;
    self.fixednode = 0;

    if ( !isdefined( self.scriptedarrivalent ) )
    {
        self._id_639D = self._id_2AF3;
        self._id_2AF3 = 1;
    }

    self._id_716E = undefined;
    self._id_251A = 1;
    return var_0;
}

_id_7173()
{
    anim_changes_pushplayer( 0 );
    self.fixednode = self._id_382C;
    self._id_382C = undefined;
    self.pathenemyfightdist = self._id_63DD;
    self.pathenemylookahead = self._id_63DE;
    self._id_2AF3 = self._id_639D;

    if ( self._id_63E2 )
    {
        if ( !isdefined( self._id_67CB ) )
            maps\_utility::_id_309B();

        self._id_63E2 = undefined;
    }

    self._id_251A = undefined;
}

anim_changes_pushplayer( var_0 )
{
    if ( isdefined( self._id_2D2D ) )
        return;

    self _meth_81A7( var_0 );
    return;
}

_id_716F( var_0 )
{
    var_0 = _id_7172( var_0 );
    self._id_2AF3 = 0;
    return var_0;
}

_id_7170( var_0 )
{
    var_1 = self _meth_813E( var_0 );
    var_0 = var_1;
    var_0 = _id_7172( var_0 );
    self._id_2AF3 = 1;
    return var_0;
}

_id_7171( var_0 )
{
    var_1 = self _meth_813E( var_0 );
    var_0 = var_1;
    var_0 = _id_7172( var_0 );
    self._id_2AF3 = 0;
    return var_0;
}

_id_7F29()
{
    self useanimtree( level._id_78B1[self.animname] );
}

anim_single_solo( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isnumber( var_3 ) || isnumber( var_4 ) )
    {
        anim_single_solo_preh1( var_0, var_1, var_2, var_3, var_4 );
        return;
    }

    if ( isdefined( var_4 ) )
        var_3 = var_4;

    self endon( "death" );
    var_5[0] = var_0;
    anim_single( var_5, var_1, var_2, undefined, undefined, undefined, var_3 );
}

anim_single_solo_preh1( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5[0] = var_0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    anim_single( var_5, var_1, var_2, var_3, var_4 );
}

anim_single_solo_run( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3[0] = var_0;
    anim_single( var_3, var_1, var_2, 0.25 );
}

anim_single_run_solo( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_4[0] = var_0;
    anim_single( var_4, var_1, var_2, 0.25 );
}

anim_reach_and_idle_solo( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    var_5[0] = var_0;
    anim_reach_and_idle( var_5, var_1, var_2, var_3, var_4 );
}

anim_reach_solo( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_4[0] = var_0;
    return anim_reach( var_4, var_1, var_2, undefined, var_3 );
}

anim_reach_and_approach_solo( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_4[0] = var_0;
    anim_reach_and_approach( var_4, var_1, var_2, var_3 );
}

anim_reach_and_approach_node_solo( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    var_5[0] = var_0;
    var_6 = _id_3CCA( var_2 );
    var_7 = var_6["origin"];
    var_8 = var_6["angles"];
    var_9 = var_0.animname;

    if ( isdefined( level._id_78AC[var_9][var_1] ) )
    {
        if ( isarray( level._id_78AC[var_9][var_1] ) )
            var_10 = level._id_78AC[var_9][var_1][0];
        else
            var_10 = level._id_78AC[var_9][var_1];

        var_7 = getstartorigin( var_7, var_8, var_10 );
    }

    var_11 = spawn( "script_origin", var_7 );
    var_11.angles = var_8;

    if ( isdefined( var_3 ) )
        var_11.type = var_3;
    else
        var_11.type = self.type;

    if ( isdefined( var_4 ) )
        var_11.arrivalstance = var_4;
    else
        var_11.arrivalstance = self gethighestnodestance();

    var_0.scriptedarrivalent = var_11;
    anim_reach_and_approach( var_5, var_1, var_2 );
    var_0.scriptedarrivalent = undefined;
    var_11 delete();

    while ( var_0.a._id_5F5B != "stop" )
        wait 0.05;
}

anim_reach_and_arrive_facing_anim_solo( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_3CCA( undefined );
    var_6 = var_5["origin"];
    var_7 = var_5["angles"];

    if ( !isdefined( var_4 ) )
        var_4 = var_0.animname;

    if ( isdefined( level._id_78AC[var_4][var_1] ) )
    {
        if ( isarray( level._id_78AC[var_4][var_1] ) )
            var_8 = level._id_78AC[var_4][var_1][0];
        else
            var_8 = level._id_78AC[var_4][var_1];

        var_6 = getstartorigin( var_6, var_7, var_8 );
        var_7 = getstartangles( var_6, var_7, var_8 );
    }

    if ( !isdefined( var_2 ) )
        var_2 = "exposed";

    var_9 = !isdefined( var_0._id_79E6 ) && isdefined( var_0._id_63A1 );
    var_10 = var_7[1];
    var_11 = spawnstruct();
    var_0 maps\_utility::ai_ignore_everything();
    var_0.scriptedarrivalent = undefined;
    var_0 _id_7172( var_6 );
    var_0 get_to_transition_point( var_11, var_10, var_6, var_10, var_2 );
    var_12 = var_10 - var_0 animscripts\utility::_id_5868( "cover_trans_angles", var_2, var_11.approach_number );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_0 play_arrival_animation( var_2, var_11, var_12, var_3 );
    var_0 _id_7173();
    var_0 maps\_utility::ai_unignore_everything( undefined, var_9 );
}

play_arrival_animation( var_0, var_1, var_2, var_3 )
{
    var_4 = animscripts\utility::_id_5863( "cover_trans", var_0 )[var_1.approach_number];
    var_5 = getanimlength( var_4 );
    self.approachnumber = var_1.approach_number;
    self.approachtype = var_0;
    self _meth_81E7( var_1._id_8C36, var_2, 0 );
    wait(var_5 - var_3);
}

get_to_transition_point( var_0, var_1, var_2, var_1, var_3, var_4 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( var_3 == "exposed" )
        var_5 = anim.archetypes["soldier"]["longestExposedApproachDist"];
    else
        var_5 = anim.archetypes["soldier"]["CoverTransLongestDist"][var_3];

    maps\_utility::_id_7E4D( var_1 );
    self._id_716E = var_1;
    self.goalradius = 0;
    var_6 = var_5 * var_5;

    while ( distancesquared( self.origin, var_1 ) > var_6 )
        wait 0.05;

    var_1.approach_number = calculate_approach_number( self, var_1, var_2, var_3 );
    var_1._id_8C36 = animscripts\cover_arrival::_id_3F06( var_1, var_2, var_3, var_1.approach_number );
    var_6 = lengthsquared( animscripts\utility::_id_5868( "cover_trans_dist", var_3, var_1.approach_number ) );

    while ( distancesquared( self.origin, var_1 ) > var_6 )
        wait 0.05;
}

calculate_approach_number( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = "exposed";

    var_4 = vectornormalize( var_1 - var_0.origin );
    var_5 = spawnstruct();
    animscripts\exit_node::calculatenodetransitionangles( var_5, var_3, 1, var_2, var_4, 9, -1 );
    var_6 = 1;

    for ( var_7 = 2; var_7 <= 9; var_7++ )
    {
        if ( var_5._id_9719[var_7] > var_5._id_9719[var_6] )
            var_6 = var_7;
    }

    return var_5._id_970C[var_6];
}

anim_reach_and_approach( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    anim_reach_with_funcs( var_0, var_1, var_2, undefined, ::_id_716F, ::_id_7173, var_3 );
}

anim_loop_solo( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isstring( var_4 ) || isvector( var_5 ) )
    {
        anim_loop_solo_preh1( var_0, var_1, var_3, var_2, var_4, var_5 );
        return;
    }

    self endon( "death" );
    var_0 endon( "death" );
    var_6 = [];
    var_6["guy"] = var_0;

    if ( !isdefined( var_4 ) )
        var_4 = self;

    var_6["entity"] = var_4;
    var_6["tag"] = var_2;
    var_7[0] = var_6;
    anim_loop_packet( var_7, var_1, var_3 );
}

anim_loop_solo_preh1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_6 = [];
    var_6["guy"] = var_0;
    var_6["entity"] = self;
    var_6["tag"] = var_3;
    var_6["origin_offset"] = var_5;
    var_7[0] = var_6;
    anim_loop_packet( var_7, var_1, var_2, var_4 );
}

anim_teleport_solo( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3[0] = var_0;
    anim_teleport( var_3, var_1, var_2 );
}

add_animation( var_0, var_1 )
{
    if ( !isdefined( level._id_20D3 ) )
        level._id_20D3[var_0][0] = var_1;
    else if ( !isdefined( level._id_20D3[var_0] ) )
        level._id_20D3[var_0][0] = var_1;
    else
    {
        for ( var_2 = 0; var_2 < level._id_20D3[var_0].size; var_2++ )
        {
            if ( level._id_20D3[var_0][var_2] == var_1 )
                return;
        }

        level._id_20D3[var_0][level._id_20D3[var_0].size] = var_1;
    }
}

anim_single_queue( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0._id_554C ) )
        maps\_utility::_id_9F8C( var_0._id_554C, 0.5 );

    maps\_utility::_id_3AF2( ::anim_single_solo, var_0, var_1, var_2, var_3 );

    if ( isalive( var_0 ) )
        var_0._id_554C = gettime();
}

anim_generic_queue( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( isdefined( var_0._id_554C ) )
        maps\_utility::_id_9F8C( var_0._id_554C, 0.5 );

    if ( isdefined( var_4 ) )
        maps\_utility::_id_3AF8( var_4, ::anim_single_solo, var_0, var_1, var_2, var_3, "generic" );
    else
        maps\_utility::_id_3AF2( ::anim_single_solo, var_0, var_1, var_2, var_3, "generic" );

    if ( isalive( var_0 ) )
        var_0._id_554C = gettime();
}

anim_dontpushplayer( var_0 )
{
    foreach ( var_2 in var_0 )
        var_2 _meth_81A7( 0 );
}

anim_pushplayer( var_0 )
{
    foreach ( var_2 in var_0 )
        var_2 _meth_81A7( 1 );
}

_id_73BC( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 = tolower( var_1 );
    var_5 = level._id_78B6[var_0][var_2][var_1];
    var_2 = _id_3D86( var_2 );
    var_6 = -1;

    if ( !isdefined( var_5 ) || !isarray( var_5 ) || var_5.size < 1 )
        return;

    for ( var_7 = 0; var_7 < var_5.size; var_7++ )
    {
        if ( isdefined( var_5[var_7][var_3] ) )
        {
            if ( !isdefined( var_4 ) || var_5[var_7][var_3] == var_4 )
            {
                var_6 = var_7;
                break;
            }
        }
    }

    if ( var_6 < 0 )
        return;

    if ( var_5.size == 1 )
        var_5 = [];
    else
        var_5 = maps\_utility::array_remove_index( var_5, var_6 );

    level._id_78B6[var_0][var_2][var_1] = var_5;
}

addnotetrack_dialogue( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 );
    var_2 = _id_3D86( var_2 );
    var_4 = add_notetrack_and_get_index( var_0, var_1, var_2 );
    level._id_78B6[var_0][var_2][var_1][var_4] = [];
    level._id_78B6[var_0][var_2][var_1][var_4]["dialog"] = var_3;
}

add_notetrack_and_get_index( var_0, var_1, var_2 )
{
    var_1 = tolower( var_1 );
    add_notetrack_array( var_0, var_1, var_2 );
    return level._id_78B6[var_0][var_2][var_1].size;
}

add_notetrack_array( var_0, var_1, var_2 )
{
    var_1 = tolower( var_1 );

    if ( !isdefined( level._id_78B6 ) )
        level._id_78B6 = [];

    if ( !isdefined( level._id_78B6[var_0] ) )
        level._id_78B6[var_0] = [];

    if ( !isdefined( level._id_78B6[var_0][var_2] ) )
        level._id_78B6[var_0][var_2] = [];

    if ( !isdefined( level._id_78B6[var_0][var_2][var_1] ) )
        level._id_78B6[var_0][var_2][var_1] = [];
}

addnotetrack_sound( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_1 = tolower( var_1 );
    var_2 = _id_3D86( var_2 );
    var_6 = add_notetrack_and_get_index( var_0, var_1, var_2 );
    level._id_78B6[var_0][var_2][var_1][var_6] = [];
    level._id_78B6[var_0][var_2][var_1][var_6]["sound"] = var_3;

    if ( isdefined( var_4 ) )
        level._id_78B6[var_0][var_2][var_1][var_6]["sound_stays_death"] = 1;

    if ( isdefined( var_5 ) )
        level._id_78B6[var_0][var_2][var_1][var_6]["sound_on_tag"] = var_5;
}

_id_6171( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_3D2D();
    addnotetrack_sound( var_4.animname, var_0, var_4.anim_sequence, var_1, var_2, var_3 );
}

addnotetrack_playersound( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 );
    var_2 = _id_3D86( var_2 );
    var_4 = add_notetrack_and_get_index( var_0, var_1, var_2 );
    level._id_78B6[var_0][var_2][var_1][var_4] = [];
    level._id_78B6[var_0][var_2][var_1][var_4]["playersound"] = var_3;
}

_id_3D86( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "any";

    return var_0;
}

addonstart_animsound( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_78B0[var_0] ) )
        level._id_78B0[var_0] = [];

    level._id_78B0[var_0][var_1] = var_2;
}

addnotetrack_animsound( var_0, var_1, var_2, var_3 )
{
    var_2 = tolower( var_2 );
    var_1 = _id_3D86( var_1 );
    var_4 = add_notetrack_and_get_index( var_0, var_2, var_1 );
    var_5 = [];
    var_5["sound"] = var_3;
    var_5["created_by_animSound"] = 1;
    level._id_78B6[var_0][var_1][var_2][var_4] = var_5;
}

addnotetrack_attach( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 = tolower( var_1 );
    var_4 = _id_3D86( var_4 );
    var_5 = add_notetrack_and_get_index( var_0, var_1, var_4 );
    var_6 = [];
    var_6["attach model"] = var_2;
    var_6["selftag"] = var_3;
    level._id_78B6[var_0][var_4][var_1][var_5] = var_6;
}

addnotetrack_detach( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 = tolower( var_1 );
    var_4 = _id_3D86( var_4 );
    var_5 = add_notetrack_and_get_index( var_0, var_1, var_4 );
    var_6 = [];
    var_6["detach model"] = var_2;
    var_6["selftag"] = var_3;
    level._id_78B6[var_0][var_4][var_1][var_5] = var_6;
}

addnotetrack_detach_gun( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 );
    var_2 = _id_3D86( var_2 );
    var_4 = add_notetrack_and_get_index( var_0, var_1, var_2 );
    var_5 = [];
    var_5["detach gun"] = 1;
    var_5["tag"] = "tag_weapon_right";

    if ( isdefined( var_3 ) )
        var_5["suspend"] = var_3;

    level._id_78B6[var_0][var_2][var_1][var_4] = var_5;
}

addnotetrack_customfunction( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 = tolower( var_1 );
    var_3 = _id_3D86( var_3 );
    var_5 = add_notetrack_and_get_index( var_0, var_1, var_3 );
    var_6 = [];
    var_6["function"] = var_2;
    var_6["function_args"] = var_4;
    level._id_78B6[var_0][var_3][var_1][var_5] = var_6;
}

addnotetrack_startfxontag( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    common_scripts\utility::_id_3FA8( var_3 );
    var_1 = tolower( var_1 );
    var_2 = _id_3D86( var_2 );
    var_6 = add_notetrack_and_get_index( var_0, var_1, var_2 );
    var_7 = [];
    var_7["effect"] = var_3;
    var_7["selftag"] = var_4;

    if ( isdefined( var_5 ) )
        var_7["moreThanThreeHack"] = var_5;

    level._id_78B6[var_0][var_2][var_1][var_6] = var_7;
}

addnotetrack_stopfxontag( var_0, var_1, var_2, var_3, var_4 )
{
    common_scripts\utility::_id_3FA8( var_3 );
    var_1 = tolower( var_1 );
    var_2 = _id_3D86( var_2 );
    var_5 = add_notetrack_and_get_index( var_0, var_1, var_2 );
    var_6 = [];
    var_6["stop_effect"] = var_3;
    var_6["selftag"] = var_4;
    level._id_78B6[var_0][var_2][var_1][var_5] = var_6;
}

_id_6173( var_0, var_1, var_2 )
{
    var_3 = _id_3D2D();
    common_scripts\utility::add_fx( var_1, var_1 );
    addnotetrack_swapparttoefx( var_3.animname, var_0, var_3.animsequence, var_1, var_2 );
}

_id_6172( var_0, var_1, var_2 )
{
    var_3 = _id_3D2D();
    common_scripts\utility::add_fx( var_1, var_1 );
    addnotetrack_stopfxontag( var_3.animname, var_0, var_3.animsequence, var_1, var_2 );
}

addnotetrack_swapparttoefx( var_0, var_1, var_2, var_3, var_4 )
{
    common_scripts\utility::_id_3FA8( var_3 );
    var_1 = tolower( var_1 );
    var_2 = _id_3D86( var_2 );
    var_5 = add_notetrack_and_get_index( var_0, var_1, var_2 );
    var_6 = [];
    var_6["swap_part_to_efx"] = var_3;
    var_6["selftag"] = var_4;
    level._id_78B6[var_0][var_2][var_1][var_5] = var_6;
}

_id_6174( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_3D2D();

    if ( var_0 != "start" && !animhasnotetrack( var_6 maps\_utility::_id_3EF5( var_6.anim_sequence ), var_0 ) )
        return;

    common_scripts\utility::add_fx( var_3, var_3 );

    if ( isdefined( var_4 ) )
        common_scripts\utility::add_fx( var_4, var_4 );

    addnotetrack_tracepartforefx( var_6.animname, var_0, var_1, var_6.anim_sequence, var_2, var_3, var_4, var_5 );
}

_id_6170( var_0, var_1, var_2 )
{
    var_3 = _id_3D2D();

    if ( var_0 != "start" && !animhasnotetrack( var_3 maps\_utility::_id_3EF5( var_3.anim_sequence ), var_0 ) )
        return;

    common_scripts\utility::add_fx( var_2, var_2 );
    addnotetrack_startfxontag( var_3.animname, var_0, var_3.anim_sequence, var_2, var_1, 1 );
}

_id_3D2D()
{
    var_0 = level._id_24D7;
    return var_0;
}

addnotetrack_tracepartforefx( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    common_scripts\utility::_id_3FA8( var_5 );
    var_1 = tolower( var_1 );
    var_3 = _id_3D86( var_3 );
    var_8 = add_notetrack_and_get_index( var_0, var_1, var_3 );
    var_9 = [];
    var_9["trace_part_for_efx"] = var_5;
    var_9["trace_part_for_efx_water"] = var_6;
    var_9["trace_part_for_efx_cancel"] = var_2;
    var_9["trace_part_for_efx_delete_depth"] = var_7;
    var_9["selftag"] = var_4;
    level._id_78B6[var_0][var_3][var_1][var_8] = var_9;

    if ( isdefined( var_2 ) )
    {
        var_9 = [];
        var_9["trace_part_for_efx_canceling"] = var_2;
        var_9["selftag"] = var_4;
        var_8 = add_notetrack_and_get_index( var_0, var_2, var_3 );
        level._id_78B6[var_0][var_3][var_2][var_8] = var_9;
    }
}

addnotetrack_flag( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 );
    var_3 = _id_3D86( var_3 );
    var_4 = add_notetrack_and_get_index( var_0, var_1, var_3 );
    var_5 = [];
    var_5["flag"] = var_2;
    level._id_78B6[var_0][var_3][var_1][var_4] = var_5;

    if ( !isdefined( level._id_382E ) || !isdefined( level._id_382E[var_2] ) )
        common_scripts\utility::_id_383D( var_2 );
}

addnotetrack_flag_clear( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 );
    var_3 = _id_3D86( var_3 );
    var_4 = add_notetrack_and_get_index( var_0, var_1, var_3 );
    var_5 = [];
    var_5["flag_clear"] = var_2;
    level._id_78B6[var_0][var_3][var_1][var_4] = var_5;

    if ( !isdefined( level._id_382E ) || !isdefined( level._id_382E[var_2] ) )
        common_scripts\utility::_id_383D( var_2 );
}

addnotetrack_notify( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 );
    var_3 = _id_3D86( var_3 );
    var_4 = add_notetrack_and_get_index( var_0, var_1, var_3 );
    var_5 = [];
    var_5["notify"] = var_2;
    level._id_78B6[var_0][var_3][var_1][var_4] = var_5;
}

addnotetrack_lui_notify( var_0, var_1, var_2, var_3 )
{
    var_1 = tolower( var_1 );
    var_3 = _id_3D86( var_3 );
    var_4 = add_notetrack_and_get_index( var_0, var_1, var_3 );
    var_5 = [];
    var_5["lui_notify"] = var_2;
    level._id_78B6[var_0][var_3][var_1][var_4] = var_5;
}

addnotetrack_set_omnvar( var_0, var_1, var_2, var_3, var_4 )
{
    var_1 = tolower( var_1 );
    var_4 = _id_3D86( var_4 );
    var_5 = add_notetrack_and_get_index( var_0, var_1, var_4 );
    var_6 = [];
    var_6["omnvar"] = var_2;
    var_6["value"] = var_3;
    level._id_78B6[var_0][var_4][var_1][var_5] = var_6;
}
#using_animtree("generic_human");

_id_2B04( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 )
    {
        self.bdisabledefaultfacialanims = 1;
        self _meth_8144( %head, 0.2 );
        self._id_35C7 = undefined;
    }
    else
        self.bdisabledefaultfacialanims = undefined;
}

anim_facialanim( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    self endon( var_1 );
    var_3 = 0.05;
    var_0 notify( "newLookTarget" );
    waitframe;
    _id_2B04();
    var_0 _meth_814D( %scripted_talking, level.scriptedtalkingweight, 0.2 );
    var_0 setflaggedanimknobrestart( "face_done_" + var_1, var_2, 1, 0, 1 );
    thread _id_3996( var_0, var_1, var_2 );
    thread _id_1EEB( var_0, "face_done_" + var_1, var_1 );
}

_id_3996( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0 endon( "stop_loop" );
    self endon( var_1 );

    for (;;)
    {
        _id_2B04();
        var_0 _meth_814D( %scripted_talking, level.scriptedtalkingweight, 0.4 );
        var_0 _meth_8155( "face_done_" + var_1, var_2, 1, 0, 1 );
        wait 0.05;
    }
}

anim_facialfiller( var_0, var_1 )
{
    self endon( "death" );

    if ( isai( self ) && !isalive( self ) )
        return;

    var_2 = 0.05;
    self notify( "newLookTarget" );
    self endon( "newLookTarget" );
    waitframe;

    if ( !isdefined( var_1 ) && isdefined( self.looktarget ) )
        var_1 = self.looktarget;

    if ( self _meth_84EA() )
        var_3 = %generic_talker_blend;
    else
    {
        var_4 = self _meth_843E( "jnt_lips_L" );

        if ( var_4 != -1 )
            var_3 = %generic_talker_bs;
        else if ( self _meth_813F() )
            var_3 = %generic_talker_axis;
        else
            var_3 = %generic_talker_allies;
    }

    self _meth_8148( var_3, 1, 0, 1 );
    self _meth_814D( %scripted_talking, level.scriptedtalkingweight, 0.4 );
    _id_2B04();
    _id_7ECE( var_0, var_3 );
    var_2 = 0.3;
    self _meth_8144( %scripted_talking, level.facialclearduration );
    _id_2B04( 0 );
}

_id_7ECE( var_0, var_1 )
{
    self endon( var_0 );

    for (;;)
    {
        wait 0.2;
        self _meth_8146( var_1, 1, 0, 1 );
        self _meth_814D( %scripted_talking, level.scriptedtalkingweight, 0.4 );
        _id_2B04();
    }
}

_id_9132( var_0 )
{
    self endon( "death" );
    var_1 = %generic_talker_allies;

    if ( self _meth_813F() )
        var_1 = %generic_talker_axis;

    self _meth_8148( var_1, 1, 0, 1 );
    self _meth_814D( %scripted_talking, level.scriptedtalkingweight, 0.4 );
    _id_2B04();
    wait(var_0);
    var_2 = 0.3;
    self _meth_8144( %scripted_talking, level.facialclearduration );
    _id_2B04( 0 );
}

_id_4173( var_0, var_1 )
{
    var_2 = var_0[1] - var_1[1];
    var_2 = angleclamp180( var_2 );
    return var_2;
}

_id_5861( var_0, var_1 )
{
    self notify( "lookline" );
    self endon( "lookline" );
    self endon( var_1 );
    self endon( "death" );

    for (;;)
        wait 0.05;
}

anim_reach_idle( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3.count = var_0.size;

    foreach ( var_5 in var_0 )
        thread _id_7176( var_5, var_1, var_2, var_3 );

    while ( var_3.count )
        var_3 waittill( "reached_goal" );

    self notify( "stopReachIdle" );
}

_id_7176( var_0, var_1, var_2, var_3 )
{
    anim_reach_solo( var_0, var_1 );
    var_3.count--;
    var_3 notify( "reached_goal" );

    if ( var_3.count > 0 )
        anim_loop_solo( var_0, var_2, "stopReachIdle" );
}

_id_27DF( var_0, var_1, var_2, var_3 )
{
    if ( animhasnotetrack( var_3, "dialog" ) )
        self waittillmatch( "face_done_" + var_0, "dialog" );

    if ( var_1 )
        animscripts\face::_id_7828( undefined, var_2, 1.0 );
    else
        animscripts\face::_id_7828( undefined, var_2, 1.0, "single dialogue" );
}

_id_1EEB( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0 waittillmatch( var_1, "end" );
    var_3 = 0.3;
    var_0 _meth_8144( %scripted_talking, level.facialclearduration );
    _id_2B04( 0 );
}

anim_start_pos( var_0, var_1, var_2 )
{
    var_3 = _id_3CCA( var_2 );
    var_4 = var_3["origin"];
    var_5 = var_3["angles"];
    common_scripts\utility::array_thread( var_0, ::_id_7EC3, var_1, var_4, var_5 );
}

anim_start_pos_solo( var_0, var_1, var_2 )
{
    var_3[0] = var_0;
    anim_start_pos( var_3, var_1, var_2 );
}

_id_7EC3( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = undefined;

    if ( isdefined( var_3 ) )
        var_5 = var_3;
    else
        var_5 = self.animname;

    if ( isdefined( var_4 ) && var_4 )
        var_6 = level._id_78AC[var_5][var_0][0];
    else if ( isarray( level._id_78AC[var_5][var_0] ) )
        var_6 = common_scripts\utility::_id_710E( level._id_78AC[var_5][var_0] );
    else
        var_6 = level._id_78AC[var_5][var_0];

    if ( isai( self ) )
    {
        var_7 = getstartorigin( var_1, var_2, var_6 );
        var_8 = getstartangles( var_1, var_2, var_6 );

        if ( isdefined( self.anim_start_at_groundpos ) )
            var_7 = maps\_utility::_id_4417( var_7 );

        if ( should_use_forced_teleport_to_anim_start() )
        {
            self _meth_81CA( var_7, var_8 );
            return;
        }

        self _meth_81C9( var_7, var_8 );
        return;
    }
    else if ( self.code_classname == "script_vehicle" )
        self _meth_8278( getstartorigin( var_1, var_2, var_6 ), getstartangles( var_1, var_2, var_6 ) );
    else
    {
        self.origin = getstartorigin( var_1, var_2, var_6 );
        self.angles = getstartangles( var_1, var_2, var_6 );
    }
}

anim_at_self( var_0, var_1 )
{
    var_2 = [];
    var_2["guy"] = self;
    var_2["entity"] = self;
    return var_2;
}

anim_at_entity( var_0, var_1 )
{
    var_2 = [];
    var_2["guy"] = self;
    var_2["entity"] = var_0;
    var_2["tag"] = var_1;
    return var_2;
}

add_to_animsound()
{
    if ( !isdefined( self.animsounds ) )
        self.animsounds = [];

    var_0 = 0;

    for ( var_1 = 0; var_1 < level.animsounds.size; var_1++ )
    {
        if ( self == level.animsounds[var_1] )
        {
            var_0 = 1;
            break;
        }
    }

    if ( !var_0 )
        level.animsounds[level.animsounds.size] = self;
}

anim_set_rate_single( var_0, var_1, var_2 )
{
    var_0 thread anim_set_rate_internal( var_1, var_2 );
}

anim_set_rate( var_0, var_1, var_2 )
{
    common_scripts\utility::array_thread( var_0, ::anim_set_rate_internal, var_1, var_2 );
}

anim_set_rate_internal( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isdefined( var_2 ) )
        var_3 = var_2;
    else
        var_3 = self.animname;

    var_4 = maps\_utility::_id_3EF6( var_0, var_3 );

    if ( isarray( var_4 ) )
        var_4 = var_4[0];

    self setflaggedanim( "single anim", var_4, 1, 0, var_1 );
}

anim_set_time( var_0, var_1, var_2 )
{
    common_scripts\utility::array_thread( var_0, ::anim_self_set_time, var_1, var_2 );
}

anim_self_set_time( var_0, var_1 )
{
    var_2 = maps\_utility::_id_3EF5( var_0 );
    self setanimtime( var_2, var_1 );
}

_id_5509( var_0, var_1 )
{
    if ( !isdefined( self._id_5508 ) )
    {
        self._id_5508 = gettime();
        return;
    }

    var_2 = gettime();

    if ( self._id_5508 == var_2 )
    {
        self endon( "death" );
        wait 0.05;
    }

    self._id_5508 = var_2;
}

_id_7DFD( var_0, var_1 )
{
    var_0._id_2564 = animscripts\cover_arrival::_id_2565;
    var_0._id_8D2F = level._id_78AC[var_0.animname][var_1];
}

_id_2399( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = "generic";
    else
        level._id_78B1[var_3] = var_0;

    var_5 = spawnstruct();
    var_5.animtree = var_0;
    var_5.model = var_4;

    if ( isdefined( var_4 ) )
        level._id_78B5[var_3] = var_4;

    if ( isdefined( var_2 ) )
        level._id_78AC[var_3][var_1] = var_2;

    var_5.animname = var_3;
    var_5.anim_sequence = var_1;
    level._id_24D7 = var_5;
}

animhasanimforcedefaultrate( var_0 )
{
    return animhasnotetrack( var_0, "animrate_forcedefault" );
}
