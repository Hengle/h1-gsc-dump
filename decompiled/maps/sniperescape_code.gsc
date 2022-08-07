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

move_in()
{
    level endon( "movein_trigger" + self._not_team );

    if ( !isdefined( level.move_in_trigger_used[self._not_team] ) )
    {
        level.move_in_trigger_used[self._not_team] = 1;
        var_0 = spawn_guys_from_targetname( self._not_team );
        common_scripts\utility::_id_0D13( var_0, ::stay_put );
        common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_7E5D, 1 );
        level.move_in_trigger_used[self._not_team] = var_0;
    }

    self waittill( "trigger" );
    var_0 = level.move_in_trigger_used[self._not_team];

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( !isalive( var_0[var_1] ) )
            continue;

        if ( var_0[var_1] isdog() )
            var_0[var_1] delete();
    }

    var_0 = maps\_utility::_id_733F( var_0 );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_7E5D, 0 );
    common_scripts\utility::_id_0D13( var_0, ::ai_move_in );
    self notify( "movein_trigger" + self._not_team );
}

spawn_guys_from_targetname( var_0 )
{
    var_1 = [];
    var_2 = getentarray( var_0, "targetname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_4.count = 1;
        var_5 = var_4 maps\_utility::_id_88C3( 1 );
        maps\_utility::_id_88F1( var_5 );

        if ( isalive( var_5 ) )
            var_1[var_1.size] = var_5;

        if ( 1 )
            continue;

        var_1[var_1.size] = var_5;
    }

    return var_1;
}

chase_chopper_guys_land()
{
    self endon( "death" );
    self waittill( "jumpedout" );

    if ( common_scripts\utility::_id_382E( "enter_burnt" ) )
    {
        var_0 = getnodearray( "park_delete_node", "targetname" );
        thread fall_back_and_delete( var_0 );
        return;
    }

    thread ai_move_in();
}

chopper_guys_land()
{
    self endon( "death" );
    self waittill( "jumpedout" );

    if ( common_scripts\utility::_id_382E( "player_defends_heat_area" ) )
    {
        var_0 = getnode( "enemy_flee_node", "targetname" );
        thread flee_heat_area( var_0 );
        return;
    }

    thread ai_move_in();
}

not_move_in_guy()
{
    if ( isdefined( self.dontmovein ) )
        return 1;

    if ( !isdefined( self.script_parentname ) )
        return 0;

    return self.script_parentname == "apartment_hunter";
}

ai_move_in()
{
    if ( !isalive( self ) )
        return;

    if ( not_move_in_guy() )
        return;

    self endon( "death" );
    self endon( "stop_moving_in" );
    self notify( "stop_going_to_node" );

    if ( isdefined( self._not_team ) )
        maps\_spawner::_id_4241();

    thread reacquire_player_pos();
}

stop_moving_in()
{
    self.dontmovein = 1;
    self notify( "stop_moving_in" );
}

reacquire_player_pos()
{
    self notify( "stop_moving_in" );
    self endon( "stop_moving_in" );
    self endon( "death" );

    for (;;)
    {
        self _meth_81aa( level.playercardbackground.origin );
        self.goalradius = 1500;
        wait 5;
    }
}

stay_put()
{
    self _meth_81aa( self.origin );
    self.goalradius = 64;
}

debounce_think()
{
    if ( !isdefined( self._id_7A26 ) )
        return;

    var_0 = strtok( self._id_7A26, " " );
    common_scripts\utility::_id_0CF0( var_0, ::add_trigger_to_debounce_list, self );
    self waittill( "trigger" );
    common_scripts\utility::_id_0CF0( var_0, ::delete_trigger_with_linkname );
    common_scripts\utility::_id_0CF0( var_0, ::turn_off_triggers_from_links, 3 );

    for (;;)
    {
        self waittill( "trigger" );
        common_scripts\utility::_id_0CF0( var_0, ::turn_off_triggers_from_links, 3 );
        wait 1;
    }
}

turn_off_triggers_from_links( var_0, var_1 )
{
    common_scripts\utility::_id_0D13( level.debounce_triggers[var_0], ::turn_off_trigger_for_time, var_1 );
}

turn_off_trigger_for_time( var_0 )
{
    self notify( "new_debouce" );
    self endon( "new_debouce" );
    self endon( "death" );
    common_scripts\utility::_id_97CC();
    wait(var_0);
    common_scripts\utility::_id_97CE();
}

delete_trigger_with_linkname( var_0 )
{
    var_1 = getent( var_0, "script_linkname" );

    if ( !isdefined( var_1 ) )
        return;

    if ( isdefined( var_1._id_7A26 ) )
    {
        var_2 = strtok( var_1._id_7A26, " " );
        common_scripts\utility::_id_0CF0( var_2, ::remove_trigger_from_debounce_lists, var_1 );
        var_1 common_scripts\utility::_id_97CC();
    }
}

add_trigger_to_debounce_list( var_0, var_1 )
{
    if ( !isdefined( level.debounce_triggers[var_0] ) )
        level.debounce_triggers[var_0] = [];

    level.debounce_triggers[var_0][level.debounce_triggers[var_0].size] = var_1;
}

remove_trigger_from_debounce_lists( var_0, var_1 )
{
    var_2 = getarraykeys( level.debounce_triggers[var_0] );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( level.debounce_triggers[var_0][var_4] != var_1 )
            continue;

        level.debounce_triggers[var_0][var_4] = undefined;
        return;
    }
}

enemy_override()
{
    self.accuracy = 0.2;
    var_0 = self.engagemindist;
    var_1 = self.engageminfalloffdist;
    var_2 = self.engagemaxdist;
    var_3 = self.engagemaxfalloffdist;

    if ( isdefined( level.engagement_dist_func[self.classname] ) )
        [[ level.engagement_dist_func[self.classname] ]]();
    else
        return;

    self endon( "death" );
    self waittill( "enemy" );

    for (;;)
    {
        wait(randomfloat( 5 ));

        if ( !isdefined( self.node_relinquished ) )
            continue;

        if ( !isdefined( self.enemy ) )
            continue;

        if ( distance( self.origin, self.node_relinquished.origin ) > 128 )
            continue;

        var_4 = self.engagemindist - 150;
        var_5 = self.engageminfalloffdist - 150;
        var_6 = self.engagemaxdist - 150;
        var_7 = self.engagemaxfalloffdist - 150;

        if ( var_4 < var_0 )
            var_4 = var_0;

        if ( var_5 < var_1 )
            var_5 = var_1;

        if ( var_6 < var_2 )
            var_6 = var_2;

        if ( var_7 < var_3 )
            var_7 = var_3;

        self _meth_8170( var_4, var_5 );
        self _meth_8171( var_6, var_7 );
        wait 12;
    }
}

engagement_shotgun()
{
    self _meth_8170( 900, 700 );
    self _meth_8171( 1000, 1200 );
}

engagement_rifle()
{
    self _meth_8170( 1200, 1000 );
    self _meth_8171( 1400, 2000 );
}

engagement_sniper()
{
    self _meth_8170( 1600, 1200 );
    self _meth_8171( 1800, 2000 );
}

engagement_smg()
{
    self _meth_8170( 900, 700 );
    self _meth_8171( 1000, 1200 );
}

engagement_gun()
{
    self _meth_8170( 1600, 1200 );
    self _meth_8171( 1800, 2000 );
}

group1_enemies_think( var_0 )
{
    var_0.count++;
    self waittill( "death" );
    var_0.count--;

    if ( var_0.count <= 1 )
        maps\_utility::_id_0709( "group2_movein" );
}

increment_count_and_spawn()
{
    self.count = 1;
    maps\_utility::_id_88C3();
}

heat_spawners_attack( var_0, var_1, var_2 )
{
    level endon( "heat_enemies_back_off" );

    if ( !isdefined( level._id_382E[var_1] ) )
        common_scripts\utility::_id_383D( var_1 );

    if ( !isdefined( level._id_382E[var_2] ) )
        common_scripts\utility::_id_383D( var_2 );

    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, ::chase_friendlies );
    var_3 = 1;

    if ( level._id_3BFE > 1 )
        var_3 = 2;

    for (;;)
    {
        common_scripts\utility::_id_3857( var_2 );
        var_4 = getaiarray( "axis" ).size;

        if ( var_4 > 14 )
        {
            wait(randomfloatrange( 1, 2 ));
            continue;
        }

        common_scripts\utility::_id_384A( var_1 );

        if ( common_scripts\utility::_id_382E( var_2 ) )
            continue;

        var_5 = common_scripts\utility::_id_0CF5( var_0 );
        spawn_limited_number_from_spawners( var_5, var_5, 3, var_3 );
        wait 0.05;
    }
}

leave_one_think()
{
    var_0 = getentarray( self._not_team, "targetname" );
    self waittill( "trigger" );
    var_1 = common_scripts\utility::_id_710E( var_0 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == var_1 )
            continue;

        var_0[var_2] delete();
    }
}

objective_position_update( var_0 )
{
    level endon( "stop_updating_objective" );
    objective_onentity( var_0, self );

    for (;;)
        wait 0.05;
}

add_engagement_func( var_0, var_1 )
{
    level.engagement_dist_func[var_0] = var_1;
}

enemy_accuracy_assignment()
{
    level.last_callout_direction = "";
    level.next_enemy_call_out = 0;
    level endon( "stop_adjusting_enemy_accuracy" );
    level.callout_near_dist = 250;

    for (;;)
    {
        wait 0.05;
        var_0 = getaiarray( "axis" );
        var_1 = [];

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            if ( distance( level.playercardbackground.origin, var_0[var_2].origin ) < 500 )
            {
                var_0[var_2]._id_1300 = 1;
                continue;
            }

            var_1[var_1.size] = var_0[var_2];
        }

        var_3 = level.playercardbackground getplayerangles();
        var_4 = anglestoforward( var_3 );

        if ( !var_1.size )
            continue;

        var_0 = var_1;
        var_5 = 1;
        var_6 = 0;
        var_7 = [];
        var_7[var_5] = [];
        var_7[var_6] = [];
        var_8 = [];
        var_9 = 1;
        var_10 = undefined;

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            var_11 = var_0[var_2];
            var_12 = vectornormalize( var_11.origin - level.playercardbackground.origin );
            var_13 = vectordot( var_4, var_12 );
            var_11._id_2D80 = var_13;
            var_14 = var_13 > 0.8;
            var_7[var_14][var_7[var_14].size] = var_11;

            if ( var_13 < var_9 )
            {
                var_9 = var_13;
                var_10 = var_11;
            }
        }

        for ( var_2 = 0; var_2 < var_7[var_5].size; var_2++ )
            var_7[var_5][var_2]._id_1300 = 0.7;

        for ( var_2 = 0; var_2 < var_7[var_6].size; var_2++ )
        {
            var_7[var_6][var_2]._id_1300 = 0.2;
            var_7[var_6][var_2].threatsightdelayfalloff = 0;
        }

        if ( isdefined( var_10 ) )
        {

        }
    }
}

ai_is_near_teammates( var_0 )
{
    var_1 = getaiarray( self.team );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] == self )
            continue;

        if ( distance( self.origin, var_1[var_2].origin ) <= var_0 )
            return 1;
    }

    return 0;
}

new_enemy_callout( var_0 )
{
    if ( !common_scripts\utility::_id_382E( "price_calls_out_enemy_location" ) )
        return;

    if ( gettime() < level.next_enemy_call_out )
        return;

    if ( !isalive( level._id_6F7C ) )
        return;

    var_1 = level.callout_near_dist;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( !var_3 _meth_81c2( level.playercardbackground ) )
            continue;

        if ( var_3._id_2D80 >= 0.2 )
            continue;

        if ( !var_3 ai_is_near_teammates( var_1 ) )
            continue;

        price_calls_out_guy( var_3 );
        return;
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( !var_3 _meth_81c2( level.playercardbackground ) )
            continue;

        if ( !var_3 ai_is_near_teammates( var_1 ) )
            continue;

        var_3 = var_0[var_2];
        price_calls_out_guy( var_3 );
        return;
    }
}

price_clears_dialogue()
{
    maps\_utility::_id_70C9();
    level.price_dialogue_master delete();
    create_price_dialogue_master();
}

create_price_dialogue_master()
{
    level.price_dialogue_master = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level.price_dialogue_master.last_dialogue_line = -5000;
}

price_line( var_0 )
{
    if ( isdefined( level._id_78BA["price"][var_0] ) )
        level.price_dialogue_master maps\_utility::_id_3AF2( ::play_sound_on_price, level._id_78BA["price"][var_0] );
    else
        level.price_dialogue_master maps\_utility::_id_3AF2( ::play_sound_on_player, var_0 );
}

play_sound_on_price( var_0 )
{
    maps\_utility::_id_9F8C( self.last_dialogue_line, 1 );

    if ( !isdefined( self ) )
        return;

    if ( isalive( level._id_6F7C ) )
        self linkto( level._id_6F7C, "tag_eye", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    else
        self linkto( level.playercardbackground, "", ( 0.0, 0.0, 60.0 ), ( 0.0, 0.0, 0.0 ) );

    maps\_utility::_id_69C5( var_0, "", 1 );

    if ( !isdefined( self ) )
        return;

    self.last_dialogue_line = gettime();
}

play_sound_on_player( var_0 )
{
    maps\_utility::_id_9F8C( self.last_dialogue_line, 1 );

    if ( !isdefined( self ) )
        return;

    maps\_utility::_id_70BD( var_0 );

    if ( !isdefined( self ) )
        return;

    self.last_dialogue_line = gettime();
}

price_is_talking()
{
    if ( !isdefined( level.price_dialogue_master ) )
        return 0;

    if ( !isdefined( level.price_dialogue_master._id_3AF2 ) )
        return 0;

    return level.price_dialogue_master._id_3AF2.size > 0;
}

price_calls_out_guy( var_0 )
{
    if ( !common_scripts\utility::_id_382E( "price_cuts_to_woods" ) )
        return;

    var_1 = getentarray( "incoming_trigger", "targetname" );
    var_2 = "enemies";

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_0 istouching( var_1[var_3] ) )
        {
            var_2 = var_1[var_3]._id_793E;
            break;
        }
    }

    var_4 = animscripts\battlechatter::_id_3F5A( level.playercardbackground.origin, var_0.origin );

    if ( var_4 == level.last_callout_direction )
        return;

    level.last_callout_direction = var_4;
    level.next_enemy_call_out = gettime() + randomfloatrange( 4500, 6500 );
    price_line( var_2 + "_" + var_4 );
}

player_hit_debug()
{
    level.playercardbackground endon( "death" );

    for (;;)
    {
        level.playercardbackground waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( var_1 ) )
            continue;
    }
}

delete_living()
{
    if ( isalive( self ) )
        self delete();
}

heli_attacks_start()
{
    var_0 = maps\_vehicle::_id_8979( "heli_attacks_start" );
    var_0 maps\_vehicle_code::helipath( var_0._not_team, 70, 70 );
}

heli_trigger()
{
    var_0 = [];

    if ( isdefined( self._not_team ) )
    {
        self waittill( "trigger" );
        var_1 = maps\_vehicle::_id_8979( self._not_team );
        var_0[var_0.size] = var_1;
    }
    else
    {
        level waittill( "vehiclegroup spawned" + self._id_7B1A, var_2 );
        var_0 = var_2;
    }

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_1 = var_0[var_3];
        var_1 maps\_vehicle_code::helipath( var_1._not_team, 30, 30 );
    }
}

block_path()
{
    var_0 = getent( self._not_team, "targetname" );
    var_0 connectpaths();
    var_0 notsolid();
    self waittill( "trigger" );
    var_0 solid();
    var_0 disconnectpaths();
    var_1 = 0.25;

    if ( isdefined( self.script_lightset ) )
        var_1 = self.script_lightset;

    wait(var_1);
    var_0 connectpaths();
    var_0 delete();
}

get_patrol_anims()
{
    var_0 = [];
    var_0[1] = "patrol_look_up_once";
    var_0[2] = "patrol_360_once";
    var_0[3] = "patrol_jog_once";
    var_0[4] = "patrol_orders_once";
    return var_0;
}

get_patrol_run_anims()
{
    var_0 = [];
    var_0[1] = "patrol_look_up";
    var_0[2] = "patrol_360";
    var_0[3] = "patrol_jog";
    var_0[4] = "patrol_orders";
    return var_0;
}

patrol_guy()
{
    self endon( "death" );
    var_0 = get_patrol_anims();
    self.allowdeath = 1;
    maps\_utility::_id_7E45( "patrol_jog" );
    var_1 = getent( self._not_team, "targetname" );
    maps\_utility::_id_07BE( maps\_utility::_id_A099, "death" );
    maps\_utility::_id_07BE( maps\_utility::_id_A099, "enemy" );
    level maps\_utility::_id_075F( common_scripts\utility::_id_383F, "wounding_enemy_detected" );
    thread maps\_utility::_id_2BDD();
    var_1 maps\_anim::_id_0BD0( self, var_0[self._id_7A18] );

    if ( !isdefined( self.enemy ) )
    {
        maps\_anim::_id_0BCA( self, "gravity", var_0[self._id_7A18] );
        self._id_2AF3 = 1;

        if ( !isdefined( self.enemy ) )
        {
            var_2 = getent( var_1._not_team, "targetname" );
            thread maps\_spawner::_id_4248( var_2 );
        }
    }

    while ( !isdefined( self.enemy ) )
        wait 0.05;

    self._id_2AF3 = 0;
    delete_wounding_sight_blocker();
    animscripts\init::_id_7DBE();
    maps\_utility::_id_1ED1();
    self.weapon_change = 16;
    self.goalradius = 350;

    if ( isdefined( self.script_origin ) && self.script_origin == "house_enter_guy" )
    {
        self _meth_81aa( level._id_6F7C.origin );
        self.goalradius = 16;
        self.pathlookaheaddist = 80;
        self.pathrandompercent = 80;
        return;
    }

    for (;;)
    {
        if ( isalive( self.enemy ) )
            self _meth_81aa( self.enemy.origin );

        wait 5;
    }
}

delete_wounding_sight_blocker()
{
    if ( common_scripts\utility::_id_382E( "wounding_sight_blocker_deleted" ) )
        return;

    var_0 = getent( "wounding_sight_blocker", "targetname" );
    var_0 connectpaths();
    var_0 delete();
    common_scripts\utility::_id_383F( "wounding_sight_blocker_deleted" );
}

player_touches_wounded_blocker()
{
    if ( common_scripts\utility::_id_382E( "wounding_sight_blocker_deleted" ) )
        return;

    level endon( "wounding_sight_blocker_deleted" );
    common_scripts\utility::_id_384A( "player_touches_wounding_clip" );
    delete_wounding_sight_blocker();
}

countdown( var_0 )
{
    var_1 = 1200;

    if ( isdefined( var_0 ) )
        var_1 = var_0 * 60;

    level.evac_fail_time = gettime() + var_1 * 1000;
    thread set_min_time_remaining( 10 );
    var_2 = maps\_hud_util::_id_3D17( undefined, undefined, undefined, undefined, var_1 );
    var_2 setpulsefx( 30, 1200000, 700 );
    var_2._id_92B2.land = &"SNIPERESCAPE_TIME_REMAINING";
    var_2 settenthstimer( var_1 );

    if ( !common_scripts\utility::_id_382E( "player_enters_fairgrounds" ) )
    {
        common_scripts\utility::_id_3856( "player_enters_fairgrounds", var_1 );

        if ( !common_scripts\utility::_id_382E( "player_enters_fairgrounds" ) )
        {
            setdvar( "ui_deadquote", &"SNIPERESCAPE_FAILED_TO_EVAC" );
            maps\_utility::_id_5CDF();
            return;
        }
    }

    maps\_hud_util::destroy_countdown_hud( var_2 );
}

defend_heat_area_until_enemies_leave()
{
    level endon( "heat_area_cleared" );
    var_0 = getent( "price_death_org", "targetname" ).origin;
    var_1 = getnode( "enemy_flee_node", "targetname" );
    var_2 = 1250;

    for (;;)
    {
        common_scripts\utility::_id_383F( "player_defends_heat_area" );
        thread defend_heat_area_until_player_goes_back( var_0, var_1, var_2 );
        common_scripts\utility::_id_3857( "stop_heat_spawners" );
        common_scripts\utility::_id_3831( "player_defends_heat_area" );
        level notify( "player_goes_back_to_heat_area" );
        var_3 = getaispeciesarray( "axis", "all" );
        common_scripts\utility::_id_0D13( var_3, ::reacquire_player_pos );
        maps\_utility::_id_9FC0( "heat_enemies_back_off" );
    }
}

defend_heat_area_until_player_goes_back( var_0, var_1, var_2 )
{
    level endon( "heat_area_cleared" );
    level._id_6F7C endon( "death" );

    for (;;)
    {
        var_3 = getaispeciesarray( "axis", "all" );
        var_3 = common_scripts\utility::_id_3CCB( var_0, var_3 );
        var_4 = 5;

        if ( var_3.size < var_4 )
            var_4 = var_3.size;

        for ( var_5 = 0; var_5 < var_4; var_5++ )
            var_3[var_5] maps\_utility::_id_27EF( var_5 * 0.25, ::flee_heat_area, var_1 );

        for ( var_5 = var_4; var_5 < var_3.size; var_5++ )
            var_3[var_5] thread flee_heat_area( var_1 );

        wait_until_the_heat_defend_area_is_clear( var_0, var_2 );
    }
}

wait_until_the_heat_defend_area_is_clear( var_0, var_1 )
{
    if ( !isalive( level._id_6F7C ) )
        return;

    level._id_6F7C endon( "death" );

    for (;;)
    {
        wait 1;

        if ( distance( level._id_6F7C.origin, var_0 ) > 200 )
            continue;

        var_2 = getaispeciesarray( "axis", "all" );
        var_3 = maps\_utility::_id_3CFA( var_0, var_2 );

        if ( !isalive( var_3 ) )
        {
            common_scripts\utility::_id_383F( "heat_area_cleared" );
            return;
        }

        if ( distance( var_3.origin, var_0 ) > var_1 )
        {
            common_scripts\utility::_id_383F( "heat_area_cleared" );
            var_4 = getnode( "enemy_flee_node", "targetname" );
            common_scripts\utility::_id_0D13( var_2, ::flee_heat_area, var_4 );
            return;
        }
    }
}

flee_heat_area( var_0 )
{
    level endon( "player_goes_back_to_heat_area" );
    self notify( "stop_moving_in" );
    self notify( "stop_going_to_node" );
    self _meth_81a9( var_0 );
    self.goalradius = 64;
    self endon( "death" );
    self waittill( "goal" );

    if ( distance( self.origin, var_0.origin ) <= 70 )
        self delete();
}

kill_shielded_price()
{
    level notify( "stop_updating_objective" );
    level._id_6F7C maps\_utility::_id_8EA4();
    price_dies();
}

player_too_far_from_macmillan_fail()
{
    setdvar( "ui_deadquote", &"SNIPERESCAPE_TOO_FAR_FROM_MACMILLAN" );
    maps\_utility::_id_5CDF();
}

price_dies()
{
    if ( isalive( level._id_6F7C ) )
        level._id_6F7C kill( ( 0.0, 0.0, 0.0 ) );

    setdvar( "ui_deadquote", &"SNIPERESCAPE_CPT_MACMILLAN_DIED" );
    maps\_utility::_id_5CDF();
}

price_wounding_kill_trigger()
{
    level endon( "price_is_safe_after_wounding" );
    common_scripts\utility::_id_384A( "player_leaves_price_wounding" );
    kill_shielded_price();
}

heli_shoots_rockets_at_ent( var_0 )
{
    var_1 = missile_createattractorent( var_0, 100000, 60000 );
    maps\_helicopter_globals::_id_37BA( "mi28_seeker", 3, var_0, 0.75 );
    wait 5;
    missile_deleteattractor( var_1 );
}

kills_enemies_then_wounds_price_then_leaves()
{
    level endon( "price_was_hit_by_heli" );
    level._id_6F7C thread price_heli_hit_detection();
    kill_all_visible_enemies();
    common_scripts\utility::_id_383F( "price_heli_moves_on" );
    self setturrettargetent( level._id_6F7C );
    maps\sniperescape_wounding::heli_fires();
}

price_heli_hit_detection()
{
    for (;;)
    {
        level._id_6F7C waittill( "damage", var_0, var_1 );

        if ( isdefined( var_1 ) && var_1 == level.price_heli )
            break;
    }

    common_scripts\utility::_id_383F( "price_was_hit_by_heli" );
}

can_see_from_array( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( bullettracepassed( self.origin, var_0[var_1].origin + ( 0.0, 0.0, 64.0 ), 0, self ) )
            return var_0[var_1];
    }

    return undefined;
}

remove_drivers_from_array( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2]._id_2E18 ) )
            var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

kill_all_enemies()
{
    var_0 = getaiarray( "axis" );
    common_scripts\utility::_id_0D13( var_0, ::die_soon );
}

kill_all_visible_enemies()
{
    for (;;)
    {
        var_0 = getaiarray( "axis" );
        var_0 = remove_drivers_from_array( var_0 );
        var_1 = can_see_from_array( var_0 );

        if ( !isalive( var_1 ) )
            return;

        var_1 thread die_soon();

        while ( isalive( var_1 ) )
        {
            self setturrettargetent( var_1, common_scripts\utility::_id_712D( 15 ) + ( 0.0, 0.0, 16.0 ) );
            self fireweapon();
            wait 0.15;
        }
    }
}

kill_all_visible_enemies_forever()
{
    self endon( "stop_killing_enemies" );
    self endon( "death" );

    for (;;)
    {
        kill_all_visible_enemies();
        wait 1;
    }
}

die_soon()
{
    self endon( "death" );
    wait(randomfloatrange( 0.5, 2.0 ));
    self kill( ( 0.0, 0.0, 0.0 ) );
}

array_remove_without_model( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3].motiontrackerenabled == var_1 )
            var_2[var_2.size] = var_0[var_3];
    }

    return var_2;
}

price_flees_grenades()
{
    if ( common_scripts\utility::_id_382E( "fairbattle_detected" ) )
        return;

    var_0 = getentarray( "grenade", "classname" );
    var_0 = array_remove_without_model( var_0, "projectile_m67fraggrenade" );

    if ( !var_0.size )
        return;

    var_1 = common_scripts\utility::_id_3F33( level._id_6F7C.origin, var_0 );
    var_2 = 450;

    if ( distance( var_1.origin, level._id_6F7C.origin ) > var_2 )
        return;

    var_3 = ( 0.0, 0.0, 0.0 );

    for (;;)
    {
        var_3 = var_1.origin;
        wait 0.05;

        if ( !isdefined( var_1 ) )
            return;

        if ( distance( var_1.origin, level._id_6F7C.origin ) > var_2 )
            return;

        if ( var_1.origin == var_3 )
            break;

        var_3 = var_1.origin;
    }

    level._id_6F7C notify( "stop_loop" );
    var_4 = 0;

    for (;;)
    {
        if ( !isdefined( var_1 ) )
            break;

        var_5 = anglestoforward( level._id_6F7C.angles );
        var_6 = vectornormalize( var_1.origin - level._id_6F7C.origin );
        var_7 = vectordot( var_5, var_6 );

        if ( var_7 > 0.2 )
            break;

        if ( level._id_6F7C should_turn_right( var_1.origin ) )
            thread price_turns_right();
        else
            thread price_turns_left();

        wait 1;
        var_4 = 1;
    }

    if ( isdefined( var_1 ) )
    {
        for (;;)
        {
            if ( !isdefined( var_1 ) )
                break;

            if ( distance( var_1.origin, level._id_6F7C.origin ) > var_2 )
                break;

            var_4 = 1;
            level._id_6F7C maps\_anim::_id_0BB5( level._id_6F7C, "gravity", "wounded_crawl" );
            insure_crawler_is_above_ground();
        }
    }

    level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle" );
}

price_teleports_to_player()
{
    var_0 = spawn( "script_origin", level._id_6F7C.origin );
    level._id_6F7C linkto( var_0 );
    var_0 moveto( level.playercardbackground.origin, 1 );
    wait 1;
    var_0 delete();

    if ( 1 )
        return;

    for (;;)
    {
        var_1 = 200;
        var_0 movez( 200, var_1 );

        for ( var_2 = 0; var_2 < var_1; var_2++ )
        {
            if ( physicstrace( level._id_6F7C.origin + ( 0.0, 0.0, 2.0 ), level._id_6F7C.origin + ( 0.0, 0.0, -10.0 ) ) != level._id_6F7C.origin + ( 0.0, 0.0, -10.0 ) )
            {
                var_0 delete();
                return;
            }

            wait 0.05;
        }
    }
}

underground()
{
    return level._id_6F7C.origin[2] < level.playercardbackground.origin[2] - 1500;
}

price_teleports_to_spot( var_0 )
{
    level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle" );
    price_teleports_to_org( var_0 );
    level._id_6F7C notify( "stop_loop" );
}

price_teleports_to_org( var_0 )
{
    var_1 = spawn( "script_origin", level._id_6F7C.origin );
    level._id_6F7C linkto( var_1 );
    var_1 moveto( var_0 + ( 0.0, 0.0, 2.0 ), 2 );
    wait 2;
    var_1 delete();
}

insure_crawler_is_above_ground()
{
    if ( !underground() )
        return;

    level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle" );
    price_teleports_to_player();
    level._id_6F7C notify( "stop_loop" );
    waitframe;
}

price_picks_target()
{
    if ( common_scripts\utility::_id_382E( "fair_hold_fire" ) )
        return 0;

    if ( isdefined( level._id_6F7C.targetorg ) && isalive( level.price_target_guy ) )
    {
        if ( level.price_target_time > gettime() + level.price_sticky_target_time )
            return 1;
    }

    level.callout_near_dist = 50000;
    common_scripts\utility::_id_383F( "price_cuts_to_woods" );
    price_flees_grenades();
    var_0 = anglestoforward( ( 0, level._id_6F7C.angles[1], 0 ) );
    var_1 = getaispeciesarray( "axis", "all" );
    var_2 = get_array_within_fov( level._id_6F7C.origin, var_0, var_1, 0.707 );
    var_1 = var_2[1];
    var_3 = var_2[0];
    var_1 = level._id_6F7C get_cantrace_array( var_1 );

    if ( !var_1.size )
    {
        if ( var_3.size > 0 )
        {
            level._id_6F7C notify( "stop_loop" );

            foreach ( var_5 in var_3 )
            {
                if ( isdefined( var_5 ) )
                {
                    var_6 = bullettracepassed( level._id_6F7C geteye(), var_5 geteye(), 0, self );

                    if ( var_6 )
                    {
                        thread new_enemy_callout( var_3 );
                        price_turns_towards_guy( var_5 );
                        level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
                        return price_picks_target();
                    }
                }
            }

            level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
        }

        return 0;
    }

    if ( var_3.size > 0 )
        thread new_enemy_callout( var_3 );

    if ( !var_1.size )
        return 0;

    var_5 = common_scripts\utility::_id_3F33( level._id_6F7C.origin, var_1 );

    if ( common_scripts\utility::_id_382E( "fairbattle_high_intensity" ) && distance( level._id_6F7C.origin, var_5.origin ) > 650 )
        var_5 = common_scripts\utility::_id_3F91( level._id_6F7C.origin, var_1 );

    thread price_targets_guy( var_5 );
    return 1;
}

price_targets_guy( var_0 )
{
    if ( isdefined( level._id_6F7C.targetorg ) )
        level._id_6F7C.targetorg delete();

    var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_1 linkto( var_0, "TAG_EYE", ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ) );
    level.price_target_guy = var_0;
    level.price_target_time = gettime();
    level._id_6F7C.targetorg = var_1;
    level._id_6F7C _meth_816b( var_1 );
    var_1 endon( "death" );
    level._id_6F7C waittill( "death" );
    var_1 delete();
}

price_turns_towards_guy( var_0 )
{
    if ( level._id_6F7C should_turn_right( var_0.origin ) )
        price_turns_right();
    else
        price_turns_left();
}

should_turn_right( var_0 )
{
    var_1 = anglestoright( ( 0, self.angles[1], 0 ) );
    var_2 = vectornormalize( var_0 - self.origin );
    return vectordot( var_1, var_2 ) > 0;
}

get_not_in_pain( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] isdog() )
        {
            var_1[var_1.size] = var_0[var_2];
            continue;
        }

        if ( var_0[var_2].script_context != "pain" )
            var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

greater_dot( var_0, var_1 )
{
    return var_0._id_2D80 > var_1._id_2D80;
}

lesser_dot( var_0, var_1 )
{
    return var_0._id_2D80 < var_1._id_2D80;
}

insert_in_array( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        if ( !var_4 )
        {
            if ( [[ var_2 ]]( var_0[var_5], var_1 ) )
            {
                var_3[var_3.size] = var_1;
                var_4 = 1;
            }
        }

        var_3[var_3.size] = var_0[var_5];
    }

    if ( !var_4 )
        var_3[var_3.size] = var_1;

    return var_3;
}

get_array_within_fov( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_4[1] = [];
    var_4[0] = [];
    var_5[1] = ::lesser_dot;
    var_5[0] = ::lesser_dot;

    for ( var_6 = 0; var_6 < var_2.size; var_6++ )
    {
        var_7 = var_2[var_6];
        var_8 = vectornormalize( var_7.origin - var_0 );
        var_9 = vectordot( var_1, var_8 );
        var_7._id_2D80 = var_9;
        var_10 = var_9 >= var_3;
        var_4[var_10] = insert_in_array( var_4[var_10], var_7, var_5[var_10] );
    }

    return var_4;
}

line_for_time( var_0, var_1, var_2, var_3 )
{
    var_3 *= 20;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
        wait 0.05;
}

get_cantrace_array( var_0 )
{
    var_1 = [];
    var_2 = self geteye();

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !bullettracepassed( var_2, var_0[var_3] geteye(), 0, undefined ) )
            continue;

        var_1[var_1.size] = var_0[var_3];
    }

    return var_1;
}

get_canshoot_array( var_0 )
{
    var_1 = [];
    var_2 = self gettagorigin( "tag_flash" );
    var_3 = self getshootatpos() - var_2;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( !self _meth_81c0( var_0[var_4], var_3 ) )
            continue;

        var_1[var_1.size] = var_0[var_4];
    }

    return var_1;
}

get_cansee_array( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !self _meth_81c2( var_0[var_2] ) )
            continue;

        var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

price_moves_to_sniping_position()
{
    var_0 = getent( "price_gnoll", "targetname" );
    var_1 = var_0.origin;
    var_2 = ( -3039.22, -3567.34, 117.2 );
    level._id_6F7C notify( "stop_loop" );

    for (;;)
    {
        var_3 = anglestoforward( level._id_6F7C.angles );
        var_4 = var_1 - level._id_6F7C.origin;
        var_4 = ( var_4[0], var_4[1], 0 );
        var_5 = vectornormalize( var_4 );
        var_6 = vectordot( var_3, var_5 );
        var_7 = distance( level._id_6F7C.origin, var_1 );

        if ( var_7 < 16 )
            break;

        if ( var_6 > -0.7 )
        {
            if ( level._id_6F7C should_turn_right( var_1 ) )
                price_turns_left();
            else
                price_turns_right();

            continue;
        }

        if ( var_7 > 32 )
        {
            level._id_6F7C maps\_anim::_id_0BB5( level._id_6F7C, "gravity", "wounded_crawl" );
            insure_crawler_is_above_ground();

            if ( distance( level._id_6F7C.origin, var_1 ) >= var_7 - 5 )
                price_teleports_to_spot( var_1 );

            continue;
        }

        break;
    }

    var_8 = getent( "park_reinforce", "targetname" );
    price_aims_at( var_8.origin );

    for (;;)
    {
        var_3 = anglestoforward( level._id_6F7C.angles );
        var_5 = vectornormalize( var_8.origin - level._id_6F7C.origin );
        var_6 = vectordot( var_3, var_5 );

        if ( var_6 < 0.7 )
        {
            if ( level._id_6F7C should_turn_right( var_8.origin ) )
                price_turns_right();
            else
                price_turns_left();

            continue;
        }

        break;
    }

    var_3 = anglestoforward( level._id_6F7C.angles );
    var_5 = vectornormalize( var_8.origin - level._id_6F7C.origin );
    var_6 = vectordot( var_3, var_5 );
    waitframe;
    level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
    common_scripts\utility::_id_3831( "price_moves_to_position" );
}

price_aims_at( var_0 )
{
    if ( !isdefined( level._id_6F7C.targetorg ) )
    {
        var_1 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        level._id_6F7C.targetorg = var_1;
    }

    level._id_6F7C.targetorg.origin = var_0;
}

price_turns_right()
{
    level._id_6F7C maps\_anim::_id_0BB5( level._id_6F7C, "gravity", "wounded_turn_right" );
}

price_turns_left()
{
    level._id_6F7C maps\_anim::_id_0BB5( level._id_6F7C, "gravity", "wounded_turn_left" );
}

idle_price_aim_at_player()
{
    self endon( "stop_loop" );
    self endon( "death" );
    self endon( "stop_aim_player" );
    self endon( "price_stops_thinking" );

    if ( !isdefined( self.player_head_tracking ) || !self.player_head_tracking )
        thread maps\_headtracking::player_head_tracking();

    for (;;)
    {
        if ( !common_scripts\utility::_id_382E( "price_moves_to_position" ) && self.idlecooldowntime < gettime() + 50 )
            price_aims_at( level.playercardbackground.origin );

        wait 0.05;
    }
}

stop_head_tracking()
{
    self waittill( "stop_aim_player" );
    maps\_headtracking::head_tracking_end();
}

idle_until_price_has_target()
{
    level._id_6F7C endon( "death" );
    level._id_6F7C notify( "stop_loop" );
    waitframe;
    level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );

    if ( isdefined( level._id_6F7C.targetorg ) )
        level._id_6F7C.targetorg delete();

    level._id_6F7C.idlecooldowntime = gettime() + 5000;
    level._id_6F7C thread idle_price_aim_at_player();

    for (;;)
    {
        if ( price_picks_target() )
        {
            level._id_6F7C notify( "stop_aim_player" );
            break;
        }

        if ( common_scripts\utility::_id_382E( "price_moves_to_position" ) )
        {
            price_moves_to_sniping_position();
            continue;
        }
        else if ( level._id_6F7C.idlecooldowntime < gettime() )
        {
            var_0 = 1;
            var_1 = 0;

            while ( var_0 )
            {
                var_2 = anglestoforward( level._id_6F7C.angles );
                var_3 = vectornormalize( level.playercardbackground.origin - level._id_6F7C.origin );
                var_4 = vectordot( var_2, var_3 );

                if ( var_4 < 0.5 )
                {
                    var_1 = 1;

                    if ( level._id_6F7C should_turn_right( level.playercardbackground.origin ) )
                        price_turns_right();
                    else
                        price_turns_left();

                    continue;
                }

                var_0 = 0;
                break;
            }

            if ( var_1 )
            {
                level._id_6F7C notify( "stop_loop" );
                waitframe;
                level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
                level._id_6F7C thread idle_price_aim_at_player();
            }
        }

        wait 0.1;
    }
}

should_teleport()
{
    var_0 = physicstrace( level._id_6F7C.origin + ( 0.0, 0.0, 2.0 ), level._id_6F7C.origin + ( 0.0, 0.0, -100.0 ) );
    return var_0[2] > level._id_6F7C.origin[2] + 60;
}

fight_until_price_has_no_target()
{
    level._id_6F7C endon( "death" );
    level._id_6F7C endon( "no_enemies" );

    for (;;)
    {
        thread price_fights_enemies();
        level._id_6F7C waittill( "damage", var_0, var_1, var_2, var_3, var_4 );
        level._id_6F7C notify( "stop_loop" );
        var_5 = gettime();

        if ( isalive( var_1 ) && var_1.team == "axis" && var_4 == "MOD_RIFLE_BULLET" )
            price_fends_off_attacker( var_1 );

        level._id_6F7C notify( "stop_loop" );
        waitframe;
        maps\_utility::_id_9F8C( var_5, 0.05 );
        level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
    }
}

line_to_guy( var_0 )
{
    level._id_6F7C endon( "death" );
    var_0 endon( "death" );

    for (;;)
        wait 0.05;
}

price_fends_off_attacker( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    var_0 endon( "death" );

    for (;;)
    {
        var_1 = anglestoforward( level._id_6F7C.angles );
        var_2 = vectornormalize( var_0.origin - level._id_6F7C.origin );
        var_3 = vectordot( var_1, var_2 );

        if ( var_3 < 0.8 )
        {
            if ( level._id_6F7C should_turn_right( var_0.origin ) )
                thread price_turns_right();
            else
                thread price_turns_left();

            wait 1.2;
            continue;
        }

        thread price_targets_guy( var_0 );

        if ( !level._id_6F7C.on_target )
        {
            waitframe;
            var_4 = gettime();
            level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
            level._id_6F7C common_scripts\utility::_id_A0A0( "on_target", 0.5 );
            maps\_utility::_id_9F8C( var_4, 0.05 );
            level._id_6F7C notify( "stop_loop" );
        }

        if ( level._id_6F7C.on_target )
        {
            var_5 = level._id_6F7C gettagorigin( "tag_flash" );
            var_6 = level._id_6F7C getshootatpos() - var_5;

            if ( level._id_6F7C _meth_81c0( level._id_6F7C.targetorg.origin, var_6 ) )
                level._id_6F7C maps\_anim::_id_0C24( level._id_6F7C, "wounded_fire" );
            else
            {
                level._id_6F7C maps\_anim::_id_0BB5( level._id_6F7C, "gravity", "wounded_crawl" );
                insure_crawler_is_above_ground();
            }
        }
    }
}

price_fights_enemies()
{
    level._id_6F7C endon( "death" );
    level._id_6F7C endon( "damage" );
    level._id_6F7C endon( "pickup" );
    level.price_next_shoot_time = 0;

    for (;;)
    {
        if ( gettime() < level.price_next_shoot_time )
            wait(( level.price_next_shoot_time - gettime() ) * 0.001);

        level._id_6F7C common_scripts\utility::_id_A0A0( "on_target", 2 );

        if ( !level._id_6F7C.fastfire )
        {
            var_0 = distance( level._id_6F7C.targetorg.origin, level._id_6F7C.origin );
            var_0 -= 400;
            var_0 *= 0.004;

            if ( var_0 < 0.15 )
                var_0 = 0.15;

            wait(randomfloatrange( var_0 * 0.75, var_0 ));
        }

        if ( gettime() < level._id_6F7C.first_shot_time )
            wait(( level._id_6F7C.first_shot_time - gettime() ) * 0.001);

        if ( level._id_6F7C.on_target )
        {
            var_1 = level._id_6F7C gettagorigin( "tag_flash" );
            var_2 = level._id_6F7C getshootatpos() - var_1;

            if ( level._id_6F7C _meth_81c0( level._id_6F7C.targetorg.origin, var_2 ) )
            {
                level._id_6F7C notify( "stop_loop" );
                level._id_6F7C maps\_anim::_id_0C24( level._id_6F7C, "wounded_fire" );
                level._id_6F7C thread maps\_anim::_id_0BE1( level._id_6F7C, "wounded_idle", undefined, "stop_loop" );
            }
        }

        if ( !price_picks_target() )
            break;
    }

    level._id_6F7C notify( "no_enemies" );
}

area_is_clear( var_0, var_1 )
{
    var_2 = 6;
    var_3 = 360 / var_2;

    for ( var_4 = 0; var_4 < var_2; var_4++ )
    {
        var_5 = ( -25, var_4 * var_3, 0 );
        var_6 = anglestoforward( var_5 );
        var_7 = var_0 + var_6 * 25;
        var_8 = physicstrace( var_0, var_7 );

        if ( distance( var_8, var_7 ) > 0.01 )
            return 0;

        var_8 = physicstrace( var_7 + ( 0.0, 0.0, 42.0 ), var_7 );

        if ( distance( var_8, var_7 ) > 0.01 )
            return 0;
    }

    return 1;
}

upwards_normal( var_0 )
{
    var_1 = 0.25;

    if ( abs( var_0[0] ) > var_1 )
        return 0;

    if ( abs( var_0[1] ) > var_1 )
        return 0;

    return var_0[2] >= 1 - var_1;
}

wait_for_player_to_drop_price( var_0 )
{
    for (;;)
    {
        wait_for_player_to_drop_price_func( var_0 );
        return;
    }
}

wait_for_player_to_drop_price_func( var_0 )
{
    var_0 endon( "trigger" );
    var_1 = getent( "price_gnoll", "targetname" );

    for (;;)
    {
        var_2 = 0;
        var_0.origin = ( 0.0, 0.0, -1500.0 );
        var_3 = level.playercardbackground geteye();
        var_4 = level.playercardbackground getplayerangles();
        var_5 = var_4[0] + 15;

        if ( var_5 > 54 )
            var_5 = 54;

        if ( var_5 < 40 )
            var_5 = 40;

        level._id_6854 = var_5;
        var_4 = ( var_5, var_4[1], 0 );
        var_6 = anglestoforward( var_4 );
        var_7 = anglestoright( var_4 );
        var_8 = 1.3;
        var_9 = var_3 + ( var_6 * 25.65 + var_7 * 31.6933 ) * var_8;
        var_9 += ( 0.0, 0.0, level.playercardbackground.origin[2] - var_3[2] - 5.0 );
        var_10 = bullettrace( var_3, var_9, 1, level.playercardbackground );
        var_11 = physicstrace( var_3, var_9 );
        level.price_trace = var_11;

        if ( var_11 != var_10["position"] )
        {
            wait 0.05;
            continue;
        }

        if ( var_10["position"][2] > level.playercardbackground.origin[2] + 26 )
        {
            wait 0.05;
            continue;
        }

        if ( distance( level.playercardbackground.origin, var_11 ) > 100 )
        {
            wait 0.05;
            continue;
        }

        if ( !upwards_normal( var_10["normal"] ) )
        {
            wait 0.05;
            continue;
        }

        if ( !area_is_clear( var_11, var_2 ) )
        {
            wait 0.05;
            continue;
        }

        level.playerdroppointorg = level.playercardbackground.origin;
        level.playerdropangles = level.playercardbackground.angles;
        level.price_drop_point = var_11;
        var_12 = ( 0.0, 0.0, 0.2 );
        var_0.origin = level.playercardbackground.origin + var_12;
        wait 0.05;
    }
}

price_wounded_logic()
{
    if ( isdefined( level._id_6F7C._id_58D7 ) )
        level._id_6F7C maps\_utility::_id_8EA4();

    level._id_6F7C thread wounded_setup();
    level endon( "player_made_it_to_seaknight" );

    for (;;)
    {
        price_defends_his_spot_until_he_is_picked_up();
        player_carries_price_until_he_drops_him();
    }
}

price_updates_objective_pos()
{
    level._id_6F7C endon( "death" );

    if ( !common_scripts\utility::_id_382E( "beacon_ready" ) )
        objective_position( maps\sniperescape_wounding::getobj( "wounded" ), level._id_6F7C.origin );
}

price_defends_his_spot_until_he_is_picked_up()
{
    thread price_updates_objective_pos();
    thread price_dies_if_player_goes_too_far();
    thread player_loses_if_price_dies();
    thread price_decides_if_he_can_be_picked_up();
    level._id_6F7C thread price_aims_at_his_enemy();
    level._id_6F7C endon( "pickup" );
    level._id_6F7C endon( "death" );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        price_slides_into_proper_putdown_position();

    if ( !common_scripts\utility::_id_382E( "first_pickup" ) )
    {
        var_0 = getnode( "price_wounding_node", "targetname" );
        var_0 maps\_anim::_id_0BE1( level._id_6F7C, "crash_idle" );
    }

    for (;;)
    {
        idle_until_price_has_target();
        fight_until_price_has_no_target();
    }
}

price_slides_into_proper_putdown_position()
{
    if ( !isdefined( level.price_drop_point ) )
        return;

    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    var_0.origin = level._id_6F7C.origin;
    level._id_6F7C linkto( var_0 );
    level._id_6F7C thread maps\_anim::_id_0BC7( level._id_6F7C, "wounded_idle_reach" );
    var_0 moveto( level.price_drop_point, 0.5, 0.2, 0.2 );
    level.price_drop_point = undefined;
    wait 0.5;
    var_0 delete();
    level._id_6F7C notify( "stop_first_frame" );
}

price_decides_if_he_can_be_picked_up()
{
    level._id_6F7C endon( "death" );
    var_0 = 0;

    for (;;)
    {
        level._id_6F7C waittill( "trigger" );
        waittillframeend;

        if ( level.playercardbackground isleaning() )
            continue;

        if ( isdefined( level.playercardbackground._id_0E28 ) )
            continue;

        if ( common_scripts\utility::_id_382E( "price_wants_apartment_cleared" ) && !common_scripts\utility::_id_382E( "apartment_cleared" ) )
        {
            if ( gettime() > var_0 )
            {
                var_0 = gettime() + 5000;
                thread price_line( "wait_make_sure" );
            }
        }

        break;
    }

    level.playercardbackground._id_2CD9 = 1;
    level._id_6F7C notify( "pickup" );
}

price_aims_at_his_enemy()
{
    level endon( "price_picked_up" );
    self endon( "price_stops_thinking" );
    level._id_6F7C endon( "death" );
    var_0 = level._id_6F7C maps\_utility::_id_3EF5( "wounded_aim_left" );
    var_1 = level._id_6F7C maps\_utility::_id_3EF5( "wounded_aim_right" );
    var_2 = level._id_6F7C maps\_utility::_id_3EF5( "wounded_base" );
    self _meth_814d( var_2, 1, 0, 1 );
    level._id_6F7C.on_target = 0;
    var_3 = 0;

    for (;;)
    {
        if ( !isdefined( level._id_6F7C.targetorg ) )
        {
            wait 0.05;
            continue;
        }

        var_4 = level._id_6F7C.targetorg.origin;
        var_5 = animscripts\utility::_id_4177( var_4 );
        var_6 = angleclamp180( var_5 - var_3 );
        level._id_6F7C.on_target = abs( var_6 ) <= 7;

        if ( level._id_6F7C.on_target )
            level._id_6F7C notify( "on_target" );
        else
            var_6 = common_scripts\utility::_id_856D( var_6 ) * 3;

        var_5 = angleclamp180( var_3 + var_6 );

        if ( var_5 < -45.0 )
            var_5 = -45.0;

        if ( var_5 > 45.0 )
            var_5 = 45.0;

        var_7 = var_5 / 90;
        var_7 += 0.5;
        self _meth_814d( var_0, 1 - var_7, 0.05 );
        self _meth_814d( var_1, var_7, 0.05 );
        var_3 = var_5;
        wait 0.05;
    }
}

price_calls_out_kills()
{
    level._id_6F7C endon( "death" );
    level._id_6F7C endon( "pickup" );

    for (;;)
    {
        if ( isalive( level._id_6F7C.enemy ) )
        {
            var_0 = level._id_6F7C.enemy;
            price_waits_for_enemy_death_or_new_enemy();
            price_calls_out_kill_if_he_should( var_0 );
            continue;
        }

        level._id_6F7C waittill( "enemy" );
    }
}

price_waits_for_enemy_death_or_new_enemy()
{
    level._id_6F7C endon( "enemy" );
    level._id_6F7C.enemy waittill( "death", var_0, var_1, var_2, var_3 );
    var_4 = 23;
}

price_calls_out_kill_if_he_should( var_0 )
{
    if ( isalive( var_0 ) )
        return;

    if ( price_is_talking() )
        return;

    if ( !isdefined( var_0 ) )
        return;

    price_calls_out_a_kill();
    wait 2;
}

price_calls_out_a_kill()
{
    if ( !isalive( level._id_6F7C ) )
        return;

    if ( level.last_price_kill + 10000 > gettime() )
        return;

    if ( randomint( 100 ) > 80 )
        return;

    var_0 = [];
    var_0[var_0.size] = "got_one";
    var_0[var_0.size] = "tango_down";
    var_0[var_0.size] = "he_is_down";

    if ( level.last_price_kill + 20000 > gettime() )
        var_0[var_0.size] = "got_another";

    var_0[var_0.size] = "target_neutralized";
    var_0[var_0.size] = "got_him";
    var_1 = common_scripts\utility::_id_710E( var_0 );

    if ( isdefined( level.last_price_line ) )
    {
        for (;;)
        {
            if ( var_1 != level.last_price_line )
                break;

            var_1 = common_scripts\utility::_id_710E( var_0 );
        }
    }

    level.last_price_line = var_1;
    level.last_price_kill = gettime();
    thread price_line( var_1 );
}

player_loses_if_price_dies()
{
    level._id_6F7C endon( "pickup" );
    level._id_6F7C waittill( "death" );
    price_dies();
}

price_dies_if_player_goes_too_far()
{
    if ( common_scripts\utility::_id_382E( "price_can_be_left" ) )
        return;

    common_scripts\utility::_id_384A( "first_pickup" );
    level endon( "price_can_be_left" );
    level._id_6F7C endon( "death" );
    level._id_6F7C endon( "pickup" );

    for (;;)
    {
        if ( distance( level.playercardbackground.origin, level._id_6F7C.origin ) > 1000 )
            break;

        wait 1;
    }

    price_line( "dont_go_far" );

    for (;;)
    {
        if ( distance( level.playercardbackground.origin, level._id_6F7C.origin ) > 1500 )
        {
            player_too_far_from_macmillan_fail();
            return;
        }

        wait 1;
    }
}

draw_player_viewtag()
{
    for (;;)
    {
        maps\_debug::_id_2DD0( level.playercardbackground.origin, level.playercardbackground getplayerangles() );
        wait 0.05;
    }
}

drop_to_floor()
{
    var_0 = bullettrace( self.origin + ( 0.0, 0.0, 32.0 ), self.origin, 0, undefined );
    self.origin = var_0["position"];
}
#using_animtree("generic_human");

player_picks_up_price()
{
    level._id_6F7C notify( "price_stops_thinking" );
    level._id_6F7C notify( "stop_loop" );
    level._id_6F7C notify( "head_tracking_end" );
    var_0 = "wounded_pickup";

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
    {
        level.oldnearclip = getdvar( "r_znear" );
        setsaveddvar( "r_znear", 1.0 );
    }

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        level.wounded_model = "player_carry";
    else
        level.wounded_model = "wounded_carry";

    if ( !common_scripts\utility::_id_382E( "first_pickup" ) )
    {
        var_1 = getnode( "price_wounding_node", "targetname" );
        common_scripts\utility::_id_383F( "first_pickup" );
        var_0 = "crash_pickup";
        level._id_6F7C setanimtime( level._id_6F7C maps\_utility::_id_3EF5( var_0 ), 0 );
        level.playercardbackground disableweapons();
        level.playercardbackground thread maps\_utility::_id_69C4( "wpn_lrg_holster_plr" );
        var_1 = getnode( "price_wounding_node", "targetname" );
        var_2 = maps\_utility::_id_88D1( "player_carry" );
        var_2 hide();
        var_1 maps\_anim::_id_0BC7( var_2, var_0 );
        wait 0.1;
        thread h1_pricecarry_pickup_dof_initial();
        var_3 = distance( var_2 gettagorigin( "tag_player" ), level.playercardbackground.origin );
        var_4 = var_3 * 0.011;

        if ( getdvarint( "use_old_crash_pickup" ) == 1 )
            var_2 maps\_utility::_id_5696( "tag_player", var_4, 1.0, 0, 0, 0, 0 );
        else
            var_2 maps\_utility::_id_5699( level.playercardbackground, "tag_player", var_4, 1.0, 0, 0, 0, 0 );

        thread maps\sniperescape_wounding::blocking_fence_falls();
        thread price_line( "find_good_spot" );
        var_1 notify( "stop_loop" );
        var_5 = maps\_utility::_id_590F( var_2, level._id_6F7C );
        var_1 notify( "stop_loop" );
        var_2 show();

        if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        {

        }

        var_1 maps\_anim::_id_0C18( var_5, var_0 );
        thread price_talks_as_he_is_picked_up();
        level.playercardbackground unlink();
        var_2 delete();

        if ( getdvar( "no_heli_protection" ) == "" )
            level.playercardbackground setorigin( ( 3577.0, -8420.0, 0.125 ) );

        if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        {
            var_2 = maps\_utility::_id_88D1( "wounded_carry" );
            level.eplayerview = var_2;
            var_2 = maps\_utility::_id_88D1( "carry_price" );
            var_2 maps\_anim::_id_7EC3( "carry_idle", level.playercardbackground.origin, level.playercardbackground.angles );
            level.price_carried = var_2;
            level.price_carried.nearz = " ";
            maps\_move_with_animation::carrystart( level.price_carried, ::carryloopcondition );
        }

        return;
    }
    else
    {
        thread price_talks_as_he_is_picked_up();
        level.playercardbackground thread maps\_utility::_id_69C4( "wpn_lrg_holster_plr" );
    }

    var_6 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    level.playercardbackground maps\_utility::_id_5693( level.playercardbackground.origin, ( 0, vectortoyaw( level._id_6F7C.origin - level.playercardbackground.origin ), level.playercardbackground.angles[2] ), 0.2, 1, 0, 0, 0, 0 );
    var_6.origin = level.playercardbackground.origin;
    var_6.angles = level.playercardbackground.angles;
    var_6 drop_to_floor();
    level._id_6F7C notify( "stop_loop" );
    var_2 = maps\_utility::_id_88D1( level.wounded_model );
    var_2 hide();
    var_6 thread maps\_anim::_id_0BE1( level._id_6F7C, "pickup_idle", undefined, "stop_idle" );
    var_6 maps\_anim::_id_0BC7( var_2, var_0 );
    wait 0.1;
    thread h1_pricecarry_pickup_dof_generic();
    level._id_6F7C maps\_headtracking::head_tracking_end( 0, 1 );
    level._id_6F7C _meth_8144( %wounded_aim, 0 );
    var_7 = var_2 gettagorigin( "tag_player" );
    var_8 = bullettrace( var_7 + ( 0.0, 0.0, 32.0 ), var_7, 0, undefined );

    if ( var_8["fraction"] < 1 )
    {
        var_6.origin += var_8["position"] - var_7;
        var_2 maps\_anim::_id_7EC3( var_0, var_6.origin, var_6.angles );
    }

    var_2 maps\_utility::_id_5697( level.playercardbackground, "tag_player", 0.4, 1.0, 0, 0, 0, 0 );
    var_9 = level.playercardbackground.origin;
    var_10 = level.playercardbackground.origin - var_2 gettagorigin( "tag_player" );
    var_2.origin += var_10;
    var_6.origin += var_10;

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        level.playercardbackground playerlinkto( var_2, "tag_player", 1.0, 0, 0, 0, 0 );
    else
        level.playercardbackground playerlinktodelta( var_2, "tag_player", 1.0, 0, 0, 0, 0 );

    var_2 show();
    var_6 notify( "stop_idle" );
    var_5 = maps\_utility::_id_590F( var_2, level._id_6F7C );
    var_11 = level.price_carried;

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
    {
        var_11 = maps\_utility::_id_88D1( "carry_price" );
        var_11 hide();
        var_11 maps\_anim::_id_7EC3( "carry_idle", level.playercardbackground.origin, level.playercardbackground.angles );
    }

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        var_6 thread maps\_anim::_id_0C18( var_5, var_0 );
        wait 2.0;
    }
    else
        var_6 maps\_anim::_id_0C18( var_5, var_0 );

    var_6 notify( var_0 );
    var_8 = bullettrace( level.playercardbackground.origin + ( 0.0, 0.0, 32.0 ), level.playercardbackground.origin, 0, undefined );

    if ( var_8["fraction"] < 1 )
    {
        var_2 moveto( var_2.origin + var_8["position"] - level.playercardbackground.origin, 0.1 );
        wait 0.1;
    }

    level.playercardbackground unlink();
    var_6 delete();

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
    {
        var_2 delete();
        level.playercardbackground setorigin( var_9 );
    }
    else
    {
        level.eplayerview = var_2;
        var_11.origin = level.playercardbackground.origin;
        var_11.angles = level.playercardbackground.angles;
        var_11 show();
        level.price_carried = var_11;
        level.price_carried.nearz = " ";
        level._id_6F7C delete();
        maps\_move_with_animation::carrystart( level.price_carried, ::carryloopcondition, 0 );
    }
}

player_puts_down_price()
{
    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        maps\_move_with_animation::carrystop();

    thread h1_pricecarry_putdown_dof_generic();
    level._id_6F7C notify( "stop_loop" );
    var_0 = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
    maps\_utility::_id_5693( level.playerdroppointorg, level.playerdropangles, 0.2, 1.0, 0, 0, 0, 0 );
    var_0.origin = level.playercardbackground.origin;
    var_0.angles = level.playercardbackground.angles;
    var_0 drop_to_floor();
    var_1 = maps\_utility::_id_88D1( level.wounded_model );
    var_1 hide();
    var_0 maps\_anim::_id_0BC7( var_1, "wounded_putdown" );
    wait 0.1;
    var_2 = var_1 gettagorigin( "tag_player" );
    var_3 = bullettrace( var_2 + ( 0.0, 0.0, 32.0 ), var_2, 0, undefined );

    if ( var_3["fraction"] < 1 )
    {
        var_0.origin += var_3["position"] - var_2;
        var_1 maps\_anim::_id_7EC3( "wounded_putdown", var_0.origin, var_0.angles );
    }

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        level.eplayerview delete();

    var_1 maps\_utility::_id_5697( level.playercardbackground, "tag_player", 0.25, 1.0, 0, 0, 0, 0 );
    var_1 show();

    if ( getdvarint( "use_old_crash_pickup" ) != 1 )
        level.price_carried delete();

    var_4 = level.playercardbackground.origin;
    var_5 = getent( "price_spawner", "targetname" );
    var_5._id_0C72 = "price";
    var_5 maps\_anim::_id_7EC3( "wounded_putdown", var_0.origin, var_0.angles );
    var_5.count = 1;
    level._id_6F7C = var_5 stalingradspawn();
    maps\_utility::_id_88F1( level._id_6F7C );
    level._id_6F7C._id_0C72 = "price";
    level._id_6F7C setmodel( "body_complete_usmc_ghillie_price_damaged" );
    level._id_6F7C thread wounded_setup();
    level._id_6F7C thread maps\sniperescape::monitor_macmellon();
    var_6 = [];
    var_6[var_6.size] = var_1;
    var_6[var_6.size] = level._id_6F7C;
    thread price_talks_as_he_is_picked_up( 1 );

    if ( getdvarint( "use_old_crash_pickup" ) == 1 )
        level.playercardbackground playerlinkto( var_1, "tag_player", 0.5, 1.0, 0, 0, 0, 0 );
    else
        level.playercardbackground playerlinktodelta( var_1, "tag_player", 1.0, 0, 0, 0, 0, 0 );

    if ( getdvarint( "use_old_crash_pickup" ) != 1 && isdefined( level.price_drop_point ) )
    {
        var_7 = getgroundposition( var_4, 15 );
        var_4 = ( var_4[0], var_4[1], var_7[2] );
    }

    var_0 maps\_anim::_id_0C18( var_6, "wounded_putdown" );
    level.playercardbackground unlink();
    var_0 delete();
    var_1 delete();
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowprone( 1 );
    level.playercardbackground allowsprint( 1 );
    level.playercardbackground allowjump( 1 );
    level.playercardbackground allowlean( 1 );
    level.playercardbackground setorigin( var_4 );

    if ( common_scripts\utility::_id_382E( "to_the_pool" ) && sufficient_time_remaining() )
        common_scripts\utility::_id_383F( "can_save" );
    else
        common_scripts\utility::_id_3831( "can_save" );

    if ( common_scripts\utility::_id_382E( "enter_burnt" ) && !common_scripts\utility::_id_382E( "to_the_pool" ) )
        level._id_6F7C.ignoretriggers = 1;

    common_scripts\utility::_id_3831( "price_picked_up" );
    maps\_hud_util::_id_8AF4();
    level notify( "price_dropped" );
    var_8 = getgroundposition( level.price_drop_point, 15 );
    level._id_6F7C _meth_81ca( var_8, level._id_6F7C.angles, 100 );
    level.price_drop_point = undefined;
    thread price_asks_to_be_picked_up_when_its_safe();

    if ( isdefined( level.oldnearclip ) )
    {
        setsaveddvar( "r_znear", level.oldnearclip );
        level.oldnearclip = undefined;
    }
}

h1_pricecarry_pickup_dof_initial()
{
    if ( common_scripts\utility::_id_382E( "faiground_battle_begins" ) )
        return;

    wait 0.35;
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( 10, 18, 1.0, 1.0 );
    wait 1.0;
    level.playercardbackground _meth_84a7( 6, 20, 2.5, 2.5 );
    wait 0.85;
    level.playercardbackground _meth_84a7( 6, 15, 2.5, 2.5 );
    wait 0.85;
    level.playercardbackground _meth_84a7( 10, 110, 1.5, 1.5 );
}

h1_pricecarry_pickup_dof_generic()
{
    if ( common_scripts\utility::_id_382E( "faiground_battle_begins" ) )
        return;

    wait 0.35;
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( 10, 18, 1.0, 1.0 );
    wait 1.0;
    level.playercardbackground _meth_84a7( 6, 20, 2.5, 2.5 );
    wait 1.0;
    level.playercardbackground _meth_84a7( 10, 110, 1.5, 1.5 );
}

h1_pricecarry_putdown_dof_generic()
{
    if ( common_scripts\utility::_id_382E( "faiground_battle_begins" ) )
        return;

    level.playercardbackground _meth_84a5();
    wait 0.5;
    level.playercardbackground _meth_84a7( 16, 110, 1.5, 1.5 );
    wait 1.0;
    level.playercardbackground _meth_84a6();
}

carryloopcondition()
{
    return 1;
}

gethealthyenemies()
{
    var_0 = getaispeciesarray( "axis", "all" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_2E18 ) )
            continue;

        if ( !var_0[var_2].ignoresuppression )
        {
            var_1[var_1.size] = var_0[var_2];
            break;
        }
    }

    return var_1;
}

price_asks_to_be_picked_up_when_its_safe()
{
    level endon( "price_picked_up" );
    level endon( "price_wants_apartment_cleared" );

    for (;;)
    {
        var_0 = gethealthyenemies();

        if ( var_0.size )
            break;

        wait 1;
    }

    wait 3;

    for (;;)
    {
        var_0 = gethealthyenemies();

        if ( !var_0.size )
            break;

        wait 1;
    }

    wait 2;
    price_asks_to_be_picked_up();
}

price_talks_as_he_is_picked_up( var_0 )
{
    if ( randomint( 100 ) > 10 )
    {
        if ( !isdefined( var_0 ) && randomint( 100 ) > 30 )
            maps\_utility::_id_27EF( 2.0, ::bonus_price_line, "pickup_breathing" );

        return;
    }

    var_1 = "put_down_" + ( randomint( 3 ) + 1 );
    price_line( var_1 );
}

bonus_price_line( var_0 )
{
    if ( price_is_talking() )
        return;

    price_line( var_0 );
}

price_talks_if_player_takes_damage()
{
    level endon( "price_dropped" );

    for (;;)
    {
        level.playercardbackground waittill( "damage" );
        price_line( "put_me_down_quick" );
        wait 4;
    }
}

price_talks_if_enemies_get_near()
{
    level endon( "price_dropped" );

    for (;;)
    {
        var_0 = getaispeciesarray( "axis", "all" );

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1];

            if ( !isalive( var_2 ) )
                continue;

            if ( !isalive( var_2.enemy ) )
                continue;

            if ( var_2 _meth_81c2( level.playercardbackground ) )
                price_asks_to_be_put_down();

            wait 0.05;
        }

        wait 0.05;
    }
}

price_talks_if_enemies_are_near()
{
    level endon( "price_dropped" );

    for (;;)
    {
        level waittill( "an_enemy_shot", var_0 );

        if ( !isalive( var_0 ) )
            continue;

        if ( var_0 _meth_81c2( level.playercardbackground ) )
            price_asks_to_be_put_down();
    }
}

price_asks_to_be_put_down()
{
    if ( isalive( level._id_6F7C ) )
        return;

    var_0 = [];
    var_0[var_0.size] = "new_put_me_down_1";
    var_0[var_0.size] = "new_put_me_down_2";
    var_0[var_0.size] = "new_put_me_down_3";
    var_0[var_0.size] = "new_put_me_down_4";

    if ( !isdefined( level.lastputdownline ) )
        level.lastputdownline = 0;

    var_1 = randomint( var_0.size );

    if ( var_1 == level.lastputdownline )
        var_1++;

    if ( var_1 >= var_0.size )
        var_1 = 0;

    level.lastputdownline = var_1;
    price_line( var_0[var_1] );
    wait 6;
}

wounded_combat_trigger()
{
    self waittill( "trigger" );
    var_0 = getentarray( self._not_team, "targetname" );

    if ( !var_0.size )
        return;

    wait 1.35;
    price_talks_if_enemies_get_near();
}

player_carries_price_until_he_drops_him()
{
    level._id_6F7C notify( "price_stops_aiming" );
    set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );
    level.playercardbackground setmovespeedscale( 0.85 );

    if ( !isalive( level._id_6F7C ) )
        level waittill( "forever and ever" );

    level.playercardbackground thread take_weapons();
    level.playercardbackground allowcrouch( 0 );
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowsprint( 0 );
    level.playercardbackground allowjump( 0 );
    level.playercardbackground allowlean( 0 );
    player_picks_up_price();
    common_scripts\utility::_id_383F( "price_picked_up" );
    common_scripts\utility::_id_383F( "carry_me_music_resume" );
    maps\_hud_util::_id_8AF5();

    if ( sufficient_time_remaining() )
        common_scripts\utility::_id_383F( "can_save" );

    if ( !common_scripts\utility::_id_382E( "enter_burnt" ) && !common_scripts\utility::_id_382E( "to_the_pool" ) )
        maps\_utility::_id_1143( "on_the_run" );

    if ( isdefined( level._id_6F7C ) )
        level._id_6F7C delete();

    var_0 = getent( "price_drop_trigger", "targetname" );
    var_0 sethintstring( &"SNIPERESCAPE_HOLD_1_TO_PUT_CPT_MACMILLAN" );
    level endon( "player_made_it_to_seaknight" );
    wait_for_player_to_drop_price( var_0 );
    var_0.origin = ( 0.0, 0.0, -1500.0 );
    player_puts_down_price();

    if ( !isalive( level._id_6F7C ) )
    {
        price_dies();
        level waittill( "foreverevervever" );
    }

    level.playercardbackground give_back_weapons();
    level.playercardbackground setmovespeedscale( 1 );
    level.playercardbackground._id_2CD9 = undefined;
}

give_back_weapons()
{
    self enableweapons();

    if ( 1 )
        return;

    level.playercardbackground notify( "stop_taking_away_ammo" );
    var_0 = self.heldweapons;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];
        self giveweapon( var_2 );
        self setweaponammoclip( var_2, self.stored_ammo[var_2] );
    }
}

take_weapons()
{
    self disableweapons();

    if ( 1 )
        return;

    self endon( "stop_taking_away_ammo" );
    self.heldweapons = self getweaponslistall();
    self.stored_ammo = [];

    for ( var_0 = 0; var_0 < self.heldweapons.size; var_0++ )
    {
        var_1 = self.heldweapons[var_0];
        self.stored_ammo[var_1] = self getweaponammoclip( var_1 );
    }

    for (;;)
    {
        self takeallweapons();
        wait 0.05;
    }
}

take_away_player_ammo()
{
    self endon( "stop_taking_away_ammo" );

    for (;;)
    {
        var_0 = self getweaponslistprimaries();

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            self setweaponammoclip( var_0[var_1], 0 );

        wait 0.05;
    }
}

give_back_player_ammo()
{
    var_0 = self getweaponslistprimaries();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        self givestartammo( var_0[var_1] );
}

max_price_health()
{
    var_0 = [];
    var_0[0] = 800;
    var_0[1] = 600;
    var_0[2] = 500;
    var_0[3] = 400;

    if ( common_scripts\utility::_id_382E( "to_the_pool" ) )
        level._id_6F7C.helmet = 50000;
    else
        level._id_6F7C.helmet = var_0[level._id_3BFE] * 4;

    level._id_6F7C.helmet = 50000;
}

wounded_setup()
{
    level.last_callout_direction = "";
    level.next_enemy_call_out = 0;
    level._id_6F7C.allowpain = 0;
    level._id_6F7C._id_38A8 = 1;
    level._id_6F7C _meth_81a7( 1 );
    level._id_6F7C.first_shot_time = gettime() + 2200;
    level._id_6F7C._id_2652 = level._id_6F7C maps\_utility::_id_3EF5( "wounded_death" );
    level._id_6F7C._id_1300 = 1000;
    level._id_6F7C._id_2D3A = 1;
    max_price_health();
    level._id_6F7C.allowdeath = 1;
    level._id_6F7C thread regen();
    level._id_6F7C.a._id_6E5A = "prone";
    level._id_6F7C sethintstring( &"SNIPERESCAPE_HOLD_1_TO_PICK_UP_CPT" );
    level._id_6F7C setthreatbiasgroup( "price" );
    level._id_6F7C _meth_81aa( level._id_6F7C.origin );
    level._id_6F7C.fastfire = 0;
    level._id_6F7C thread deathdetect();

    if ( common_scripts\utility::_id_382E( "faiground_battle_begins" ) )
        thread fairground_price_adjustment();

    level._id_6F7C endon( "death" );

    for (;;)
    {
        level._id_6F7C.usepathsmoothingvalues = price_should_be_useable();
        wait 0.05;
    }
}

int_vec_compare( var_0, var_1 )
{
    var_0 = ( int( var_0[0] ), int( var_0[1] ), int( var_0[2] ) );
    var_1 = ( int( var_1[0] ), int( var_1[1] ), int( var_1[2] ) );
    return var_0 == var_1;
}

price_should_be_useable()
{
    if ( level.playercardbackground isleaning() )
        return 0;

    var_0 = playerphysicstrace( level.playercardbackground.origin + ( 0.0, 0.0, 60.0 ), level.playercardbackground.origin + ( 0.0, 0.0, 2.0 ) );

    if ( !int_vec_compare( var_0, level.playercardbackground.origin + ( 0.0, 0.0, 2.0 ) ) )
        return 0;

    return common_scripts\utility::_id_382E( "can_manage_price" );
}

deathdetect()
{
    self waittill( "death", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
    var_0 = var_0;
}

fairground_price_adjustment()
{
    level._id_6F7C endon( "death" );

    if ( !isdefined( level._id_6F7C._id_0669 ) )
        level._id_6F7C thread maps\_stealth_logic::friendly_logic();

    common_scripts\utility::_id_384A( "fairbattle_high_intensity" );
    level._id_6F7C.threatsightdelayfalloff = -15000;
    level._id_6F7C.ignoretriggers = 0;
}

regen()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage" );
        thread regenner();
    }
}

regenner()
{
    self endon( "death" );
    self endon( "damage" );
    wait 5;
    max_price_health();
}

price_fires( var_0 )
{
    self.a._id_55D7 = gettime();
    self _meth_81ea( 0.25, level._id_6F7C.targetorg.origin );
    var_1[0] = 400;
    var_1[1] = 400;
    var_1[2] = 0;
    var_1[3] = 0;
    level.price_next_shoot_time = gettime() + randomintrange( 2250, 2950 ) - var_1[level._id_3BFE];
}

enemy_spawn_zone()
{
    var_0 = strtok( self._id_7A26, " " );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = getent( var_0[var_2], "script_linkname" );

        if ( isdefined( var_3 ) )
            var_1[var_1.size] = var_3;
    }

    self.zone_spawners = var_1;

    for (;;)
    {
        self waittill( "trigger" );

        if ( isdefined( level.zone_trigger ) )
            continue;

        level.zone_trigger = self;

        while ( level.playercardbackground istouching( self ) )
            wait 0.05;

        level.zone_trigger = undefined;
    }
}

dog_check()
{
    if ( isdog() )
        self setthreatbiasgroup( "dog" );
}

chase_friendlies()
{
    if ( isdog() )
        self setthreatbiasgroup( "dog" );

    ai_move_in();
}

enemy_zone_spawner()
{
    anim._id_83F3 = animscripts\utility::_id_83F5;
    var_0 = getentarray( "zone_spawner", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1]._id_7A07 = 0;

    var_2 = 0;
    maps\_utility::_id_A089( maps\_utility::_id_6BA7, 600, maps\_utility::_id_9373, 15 );

    for (;;)
    {
        common_scripts\utility::_id_3857( "enter_burnt" );
        waitframe;

        if ( getaispeciesarray( "all", "all" ).size >= 26 )
        {
            wait 1;
            continue;
        }

        if ( !isdefined( level.zone_trigger ) )
        {
            wait 1;
            continue;
        }

        for ( var_1 = 0; var_1 < 2; var_1++ )
        {
            var_0 = common_scripts\utility::_id_0CF5( var_0 );
            var_2--;

            if ( var_2 < 0 || var_2 >= level.zone_trigger.zone_spawners.size )
                var_2 = level.zone_trigger.zone_spawners.size - 1;

            var_3 = level.zone_trigger.zone_spawners[var_2];
            var_4 = getentarray( var_3._not_team, "targetname" );
            spawn_limited_number_from_spawners( var_0, var_4, 4, 1 );
        }

        wait_until_its_time_to_spawn_another_wave();
    }
}

price_asks_to_be_picked_up()
{
    var_0 = "lets_get_moving_" + ( randomint( 2 ) + 1 );

    if ( common_scripts\utility::_id_382E( "price_wants_apartment_cleared" ) )
        common_scripts\utility::_id_384A( "apartment_cleared" );

    wait 1.5;

    if ( common_scripts\utility::_id_382E( "fair_snipers_died" ) )
        return;

    price_line( var_0 );
}

wait_until_its_time_to_spawn_another_wave()
{
    level endon( "time_to_spawn_a_new_wave" );
    thread spawn_wave_if_player_moves_far_with_price();
    maps\_utility::_id_A07F( "axis" );

    if ( isalive( level._id_6F7C ) )
        price_asks_to_be_picked_up();

    wait 14;
}

spawn_wave_if_player_moves_far_with_price()
{
    level endon( "time_to_spawn_a_new_wave" );

    for (;;)
    {
        if ( isalive( level._id_6F7C ) )
        {
            common_scripts\utility::_id_382F( "price_picked_up" );
            common_scripts\utility::_id_384A( "price_picked_up" );
        }

        wait_until_price_is_dropped_or_player_goes_far( level.playercardbackground.origin );
    }
}

wait_until_price_is_dropped_or_player_goes_far( var_0 )
{
    level endon( "price_dropped" );

    for (;;)
    {
        if ( distance( var_0, level.playercardbackground.origin ) > 1050 )
        {
            level notify( "time_to_spawn_a_new_wave" );
            return;
        }

        wait 1;
    }
}

isdog()
{
    return self.classname == "actor_enemy_dog";
}

spawn_limited_number_from_spawners( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = getaispeciesarray( "axis", "dog" ).size;

        if ( var_4 >= var_2 )
            break;

        if ( var_0[var_5] isdog() && var_6 >= var_3 )
            continue;

        var_0[var_5].origin = var_1[var_4].origin;
        var_0[var_5].count = 1;
        var_0[var_5]._id_7A07 = 0;
        var_0[var_5] dospawn();
        var_4++;
    }
}

dog_attacks_fence()
{
    var_0 = getnode( "dog_fence_node", "targetname" );
    var_1 = getent( "fence_dog_spawner", "targetname" );
    var_2 = var_1 stalingradspawn();

    if ( maps\_utility::_id_88F1( var_2 ) )
        return;

    var_2._id_0C72 = "dog";
    var_2.helmet = 5;
    var_2.allowdeath = 1;
    var_2 endon( "death" );
    var_2 thread apartment_dog_death();
    var_2.ignoretriggers = 1;
    var_0 maps\_anim::_id_0C24( var_2, "fence_attack" );
    var_2.ignoretriggers = 0;
    var_2.helmet = 50;
    var_2 ai_move_in();
}

apartment_dog_death()
{
    self waittill( "death" );
    common_scripts\utility::_id_383F( "fence_dog_dies" );
}

price_followup_line()
{
    level endon( "price_picked_up" );
    common_scripts\utility::_id_382F( "price_picked_up" );
    wait 3;

    for (;;)
    {
        while ( level.price_dialogue_master._id_3AF2.size > 0 )
            wait 0.05;

        price_line( "carry_me" );
        common_scripts\utility::_id_383F( "carry_me_music_resume" );
        wait(randomfloatrange( 8, 12 ));
    }
}

set_objective_pos_to_extraction_point( var_0 )
{
    var_1 = extraction_point();
    objective_position( var_0, var_1 );
}

extraction_point()
{
    if ( !common_scripts\utility::_id_382E( "player_moves_through_burnt_apartment" ) )
    {
        var_0 = getent( "objective_burnt_babystep", "targetname" );
        return var_0.origin;
    }

    return getent( "enemy_fair_dest", "targetname" ).origin;
}

on_the_run_enemies()
{
    self notify( "stop_old_on_the_run_enemies" );
    self endon( "stop_old_on_the_run_enemies" );
    self endon( "death" );

    if ( isdefined( self._id_750E ) )
        self waittill( "jumpedout" );

    thread ai_move_in();
}

fairground_enemies()
{
    self endon( "death" );

    if ( isdefined( self._id_750E ) )
        self waittill( "jumpedout" );

    thread ai_move_in();
}

tracks_ent( var_0 )
{
    self endon( "stop_tracking_weapon" );
    var_1 = getent( "pool_trigger", "targetname" );

    for (;;)
    {
        if ( level.playercardbackground istouching( var_1 ) || sighttracepassed( self gettagorigin( "tag_barrel" ), level.playercardbackground geteye(), 0, undefined ) )
            self setturrettargetent( level.playercardbackground, ( 0.0, 0.0, 24.0 ) );
        else
            self setturrettargetent( var_0 );

        var_2 = vectortoangles( var_0.origin - self.origin );
        self setgoalyaw( var_2[1] );
        wait 0.1;
    }
}

shoot_at_entity_chain( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    self setturrettargetent( var_1 );
    thread maps\sniperescape_wounding::heli_fires();
    thread tracks_ent( var_1 );

    for (;;)
    {
        if ( !isdefined( var_0._not_team ) )
            break;

        var_2 = getent( var_0._not_team, "targetname" );
        var_3 = distance( var_2.origin, var_0.origin ) * 0.0035;

        if ( var_3 < 0.05 )
            var_3 = 0.05;

        var_1 moveto( var_2.origin, var_3 );
        wait(var_3);
        var_0 = var_2;
    }

    var_1 delete();
    self notify( "stop_firing_weapon" );
    self notify( "stop_tracking_weapon" );
}

incoming_heli_exists()
{
    var_0 = getentarray( "script_vehicle", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( !issubstr( var_2.motiontrackerenabled, "mi17" ) )
            continue;

        if ( var_2._id_9A3C == "default" )
            return 1;
    }

    return 0;
}

seaknight_badplace()
{
    var_0 = getent( "seaknight_badplace", "targetname" );

    for (;;)
    {
        if ( distance( self.origin, var_0.origin ) < 800 )
            break;

        wait 0.05;
    }

    badplace_cylinder( "seaknight_badplace", 0, var_0.origin, var_0.rank, 512, "axis" );
}

player_navigates_burnt_apartment()
{
    var_0 = getnodearray( "park_delete_node", "targetname" );
    level endon( "to_the_pool" );
    common_scripts\utility::_id_382F( "to_the_pool" );

    for (;;)
    {
        common_scripts\utility::_id_384A( "enter_burnt" );
        common_scripts\utility::_id_3831( "price_calls_out_enemy_location" );
        maps\_utility::_id_735B( "axis", ::on_the_run_enemies );
        var_1 = getaispeciesarray( "axis", "all" );
        common_scripts\utility::_id_0D13( var_1, ::fall_back_and_delete, var_0 );
        common_scripts\utility::_id_3857( "enter_burnt" );
        common_scripts\utility::_id_383F( "price_calls_out_enemy_location" );
        maps\_utility::_id_0761( "axis", ::on_the_run_enemies );
        level notify( "restarting_on_the_run" );
        var_1 = getaispeciesarray( "axis", "all" );
        common_scripts\utility::_id_0D13( var_1, ::on_the_run_enemies );
    }
}

apartment_hunters()
{
    common_scripts\utility::_id_384A( "apartment_hunters_start" );
    var_0 = getentarray( "apartment_hunter", "targetname" );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_0798, ::apartment_hunter_think );
    common_scripts\utility::_id_0D13( var_0, maps\_utility::_id_88C3 );
}

apartment_hunter_think()
{
    var_0 = getnode( "apartment_hunter_delete", "targetname" );
    self endon( "death" );
    self _meth_81a9( var_0 );
    self.goalradius = 32;
    self.invisible = 0;
    self.ignoreforfixednodesafecheck = 1;
    self waittill( "goal" );
    self delete();
}

fall_back_and_delete( var_0 )
{
    if ( isdefined( self.script_parentname ) && self.script_parentname == "apartment_hunter" )
        return;

    self endon( "death" );
    level endon( "restarting_on_the_run" );

    if ( isdefined( self._id_750E ) )
        self waittill( "jumpedout" );

    waitframe;
    self notify( "stop_moving_in" );
    var_1 = common_scripts\utility::_id_710E( var_0 );
    self _meth_81a9( var_1 );
    self.goalradius = 64;
    self waittill( "goal" );
    self delete();
}

_id_2856()
{
    self delete();
}

curtain( var_0 )
{
    maps\_utility::_id_0D61( "curtain" );
    self _meth_814d( maps\_utility::_id_3EF5( var_0 ), 1, 0, 1 );

    for (;;)
    {
        self _meth_814d( maps\_utility::_id_3EF5( var_0 ), 1, 0, randomfloat( 0.7 ) );
        wait(randomfloat( 0.5 ));
    }
}

update_seaknight_objective_pos( var_0 )
{
    var_1 = undefined;

    for (;;)
    {
        if ( !isdefined( var_1 ) || var_1 != level.seaknight )
        {
            var_1 = level.seaknight;
            objective_onentity( var_0, var_1 );
        }

        wait 0.05;
    }
}

spawn_vehicle_from_targetname_and_create_ref( var_0 )
{
    var_1 = maps\_vehicle::_id_8979( var_0 );
    level.ending_vehicles[var_0] = var_1;
}

fairground_air_war()
{
    common_scripts\utility::_id_384A( "seaknight_flies_in" );
    level.ending_vehicles = [];
    maps\_utility::_id_27EF( 0, ::spawn_vehicle_from_targetname_and_create_ref, "ending_bad_heli_1" );
    maps\_utility::_id_27EF( 10, ::spawn_vehicle_from_targetname_and_create_ref, "ending_bad_heli_2" );
    maps\_utility::_id_27EF( 12, ::spawn_vehicle_from_targetname_and_create_ref, "ending_bad_heli_3" );
    maps\_utility::_id_27EF( 16, ::spawn_vehicle_from_targetname_and_create_ref, "ending_bad_heli_4" );
    maps\_utility::_id_27EF( 15.5, ::spawn_vehicle_from_targetname_and_create_ref, "ending_good_heli_1" );
    maps\_utility::_id_27EF( 18, ::spawn_vehicle_from_targetname_and_create_ref, "ending_good_heli_2" );
    wait 20;
    wait 3.5;
    var_0 = level.ending_vehicles["ending_bad_heli_1"];
    var_1 = level.ending_vehicles["ending_bad_heli_2"];
    var_2 = level.ending_vehicles["ending_bad_heli_3"];
    var_3 = level.ending_vehicles["ending_bad_heli_4"];
    var_4 = level.ending_vehicles["ending_good_heli_1"];
    var_5 = level.ending_vehicles["ending_good_heli_2"];
    var_4 maps\_vehicle::vehicle_flag_arrived( "ending_good_helis_leave" );
    var_4 notify( "stop_killing_enemies" );
    var_4 shoots_down( var_0 );
    wait 2;
    var_4 thread kill_all_visible_enemies_forever();
    wait 5;
    var_5 maps\_vehicle::vehicle_flag_arrived( "ending_good_helis_leave" );
    var_5 notify( "stop_killing_enemies" );
    common_scripts\utility::_id_383F( "ending_bad_heli2_leaves" );
    var_5 shoots_down( var_1 );
    common_scripts\utility::_id_383F( "ending_bad_heli4_leaves" );
    wait 2;
    var_5 thread kill_all_visible_enemies_forever();
    var_4 notify( "stop_killing_enemies" );
    var_4 shoots_down( var_3 );
    common_scripts\utility::_id_383F( "ending_bad_heli3_leaves" );
    wait 2;
    var_4 thread kill_all_visible_enemies_forever();
    wait 1;
    var_5 notify( "stop_killing_enemies" );
    var_5 shoots_down( var_2 );
    wait 2;
    var_5 thread kill_all_visible_enemies_forever();
    wait 1200;
}

shoots_down( var_0, var_1 )
{
    self endon( "death" );
    self endon( "death_spiral" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self setvehweapon( "cobra_seeker" );
    var_2 = ( 0.0, 0.0, -50.0 );
    self fireweapon( "tag_store_L_2_a", var_0, common_scripts\utility::_id_712D( var_1 ) + var_2 );
    wait 0.2;
    self fireweapon( "tag_store_L_2_b", var_0, common_scripts\utility::_id_712D( var_1 ) + var_2 );
    wait 0.2;
    self fireweapon( "tag_store_L_2_c", var_0, common_scripts\utility::_id_712D( var_1 ) + var_2 );
    self setvehweapon( "cobra_20mm" );
}

create_apartment_badplace()
{
    var_0 = getent( "apartment_bad_place", "targetname" );
    badplace_cylinder( "apartment_badplace", 0, var_0.origin, var_0.rank, 200, "axis" );
}

delete_apartment_badplace()
{
    badplace_delete( "apartment_badplace" );
}

more_plant_claymores()
{
    common_scripts\utility::_id_384A( "plant_claymore" );
    common_scripts\utility::_id_3831( "plant_claymore" );
    price_line( "place_claymore" );
}

burnt_spawners()
{
    var_0 = getentarray( "burnt_spawner", "targetname" );
    var_1 = 0;

    for (;;)
    {
        common_scripts\utility::_id_384A( "deep_inside_burnt" );

        if ( gettime() < var_1 )
            wait(( var_1 - gettime() ) * 0.001);

        common_scripts\utility::_id_0D13( var_0, ::increment_count_and_spawn );
        var_1 = gettime() + 15000;
    }
}

spooky_dog()
{
    var_0 = getent( "spooky_dog_spawner", "targetname" );
    common_scripts\utility::_id_384A( "spawn_spooky_dog" );

    if ( getdvar( "player_hasnt_been_spooked" ) == "" )
    {
        setdvar( "player_hasnt_been_spooked", "1" );
        var_0 thread maps\_utility::_id_0798( ::spooky_dog_spawns );
    }
    else
    {
        var_1 = getent( "dog_tele", "targetname" );
        var_0.origin = var_1.origin;
        var_0._id_7A40 = 1;
        var_0 thread maps\_utility::_id_0798( ::spooky_dog_spawns_hidden );
    }

    var_0 maps\_utility::_id_88C3();
}

spooky_dog_spawns_hidden()
{
    var_0 = getent( "spooky_dog_trigger", "targetname" );
    self.goalradius = 64;
    var_1 = getent( "dog_end_goal", "script_noteworthy" );
    self.favoriteenemy = level.playercardbackground;
    thread maps\_spawner::_id_4248( var_1 );
    var_0 maps\_utility::_id_07BE( maps\_utility::_id_A099, "trigger" );
    level maps\_utility::_id_075F( common_scripts\utility::_id_383F, "price_wants_apartment_cleared" );
    thread maps\_utility::_id_2BDC();
    spooky_deletes_on_trigger( var_0 );
}

spooky_dog_spawns()
{
    self endon( "death" );
    self.pathlookaheaddist = 0;
    self.pathrandompercent = 0;
    var_0 = getent( "spooky_dog_trigger", "targetname" );
    common_scripts\utility::_id_384A( "spooky_waits" );
    common_scripts\utility::_id_383F( "price_wants_apartment_cleared" );

    if ( common_scripts\utility::_id_382E( "price_picked_up" ) )
    {
        level common_scripts\utility::_id_A0A0( "price_picked_up", 2.0 );

        if ( !common_scripts\utility::_id_382E( "price_picked_up" ) )
            wait 0.25;

        common_scripts\utility::_id_383F( "spooky_goes" );

        if ( !isalive( level._id_6F7C ) )
            thread price_line( "sweep_the_rooms" );

        self waittill( "reached_path_end" );
        spooky_deletes_on_trigger( var_0 );
        return;
    }

    price_line( "sweep_the_rooms" );
    self notify( "stop_going_to_node" );
    self.goalradius = 2048;
    maps\_utility::_id_7E0B();
}

spooky_deletes_on_trigger( var_0, var_1 )
{
    self endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 5;

    if ( level.playercardbackground istouching( var_0 ) )
    {
        self _meth_81aa( level.playercardbackground.origin );
        self.goalradius = 1024;
        return;
    }

    var_0 maps\_utility::_id_9FC8( 5 );
    self delete();
}

spooky_sighting()
{
    var_0 = getent( "spooky_sighting", "targetname" );
    var_0 thread maps\_utility::_id_0798( ::spooky_dog_is_sighted );
}

spooky_dog_is_sighted()
{
    self endon( "death" );
    self waittill( "reached_path_end" );
    self _meth_81aa( self.origin );
    self.goalradius = 32;
    var_0 = getent( "spooky_dog_trigger", "targetname" );
    spooky_deletes_on_trigger( var_0, 0.1 );
}

second_apartment_line()
{
    for (;;)
    {
        common_scripts\utility::_id_384A( "lets_go_that_way" );

        if ( isalive( level._id_6F7C ) )
        {
            common_scripts\utility::_id_3857( "lets_go_that_way" );
            continue;
        }

        price_line( "head_for_apartment" );
        return;
    }
}

set_go_line()
{
    self waittill( "trigger", var_0 );

    if ( isalive( var_0 ) )
        var_0._id_0574 = self.script_parentname;
}

waittill_noteworthy_dies( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isalive( var_1[var_2] ) )
            var_1[var_2] waittill( "death" );
    }
}

door_opens( var_0 )
{
    var_1 = getent( self._not_team, "targetname" );

    if ( isdefined( var_1 ) )
        var_1 linkto( self );

    self playsound( "wood_door_kick" );
    var_2 = -120;

    if ( isdefined( var_0 ) )
        var_2 *= var_0;

    self rotateyaw( var_2, 0.3, 0, 0.3 );
    self connectpaths();
}

flee_guy_runs()
{
    self endon( "death" );
    self.ignoreforfixednodesafecheck = 1;
    stop_moving_in();

    for (;;)
    {
        if ( self _meth_81c2( level.playercardbackground ) )
            break;

        wait 0.05;
    }

    wait 1.5;
    var_0 = getnode( self._id_7A26, "script_linkname" );
    self _meth_81a9( var_0 );
    self.goalradius = 64;
    self waittill( "goal" );
    self.ignoreforfixednodesafecheck = 0;
    self _meth_81aa( level.playercardbackground.origin );
    self.goalradius = 1024;
}

force_patrol_think()
{
    stop_moving_in();
    self endon( "death" );

    if ( !isalive( level._id_6F7C ) )
    {
        self.allowdeath = 1;
        self._id_2AF3 = 1;
        var_0 = get_patrol_anims();
        var_1 = getent( self._not_team, "targetname" );
        var_1 maps\_anim::_id_0BD0( self, var_0[self._id_7A18] );
        self.a._id_5F5B = "run";
        maps\_anim::_id_0BC9( self, var_0[self._id_7A18] );
        self._id_2AF3 = 0;
    }

    thread reacquire_player_pos();
}

flicker_light()
{
    maps\_lights::_id_1928();
}

price_fair_defendspot()
{
    var_0 = getent( "price_gnoll", "targetname" );
    return var_0.origin;
}

enemy_door_trigger()
{
    self waittill( "trigger" );
    var_0 = getentarray( self._not_team, "targetname" );
    var_1 = 1;

    if ( isdefined( self._id_7A26 ) )
    {
        var_2 = getent( self._id_7A26, "script_linkname" );

        if ( isdefined( var_2 ) )
        {
            if ( level.playercardbackground istouching( var_2 ) )
                var_1 = 0.75;
        }
    }

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_0[var_3].script_parentname == "enemy_door_right" )
        {
            var_0[var_3] thread door_opens( -1 * var_1 );
            continue;
        }

        var_0[var_3] thread door_opens( var_1 );
    }
}

spawn_classname( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];

        if ( issubstr( var_6.classname, var_1 ) )
            var_4[var_4.size] = var_6;
    }

    var_3 = isdefined( var_3 ) && level._id_3BFE >= 2;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        var_6 = var_4[var_5];

        if ( level._id_3BFE <= 1 )
        {
            level.fair_grenade_guy_countdown--;

            if ( level.fair_grenade_guy_countdown <= 0 )
            {
                level.fair_grenade_guy_countdown = 5;
                self.grenadeammo = 1;
            }
            else
                self.grenadeammo = 0;
        }
        else
            self.grenadeammo = 1;

        if ( var_3 && randomint( 100 ) > 30 )
            var_6._id_79DE = 3;
        else
            var_6._id_79DE = undefined;

        var_6.count = 1;
        var_7 = var_6 dospawn();

        if ( isalive( var_7 ) )
            level.fair_battle_guys_spawned++;
    }
}

best_fair_path( var_0 )
{
    var_1 = level.fair_paths;

    if ( var_0 )
        var_1 = level.fair_paths_alt;

    var_2 = var_1[0];

    for ( var_3 = 1; var_3 < var_1.size; var_3++ )
    {
        var_4 = var_1[var_3];

        if ( var_4.uses < var_2.uses )
            var_2 = var_4;
    }

    return var_2;
}

price_opens_fire()
{
    common_scripts\utility::_id_3852( "open_fire", "fairbattle_detected" );

    if ( !common_scripts\utility::_id_382E( "fairbattle_detected" ) )
    {
        price_line( "open_fire" );
        wait 2.0;
    }

    common_scripts\utility::_id_3831( "fair_hold_fire" );
    level._id_6F7C.first_shot_time = gettime();
    level._id_6F7C.fastfire = 1;
}

fair_guy_sets_high_intensity()
{
    fair_guy_waits_for_run_or_death();
    level.fair_runners++;

    if ( level.fair_runners >= 1 )
        common_scripts\utility::_id_383F( "fairbattle_high_intensity" );
}

fair_guy_waits_for_run_or_death()
{
    self endon( "death" );
    self endon( "damage" );
    maps\_utility::_id_32E0( "reached_run_point" );
}

fairground_force_high_intensity()
{
    level endon( "fairbattle_high_intensity" );
    common_scripts\utility::_id_384A( "fairbattle_detected" );
    wait 18;
    common_scripts\utility::_id_383F( "fairbattle_high_intensity" );
}

stealth_break_detection()
{
    common_scripts\utility::_id_A087( "alerted_once", "alerted_again" );
    common_scripts\utility::_id_383F( "fairbattle_detected" );
}

faiground_stealth_detection()
{
    level waittill( "event_awareness" );
    common_scripts\utility::_id_383F( "fairbattle_gunshot" );
    common_scripts\utility::_id_383F( "fairbattle_detected" );
}

fair_guy_pre_battle_behavior( var_0 )
{
    var_1 = [];
    level endon( "fairbattle_high_intensity" );
    thread patrol_fairgrounds_for_player( var_0 );
    common_scripts\utility::_id_384A( "fairbattle_detected" );
    self._id_2AF3 = 0;
    self.favoriteenemy = level.playercardbackground;
}

fair_guy_responds_to_invisible_attack()
{
    if ( maps\_utility::_id_32D8( "reached_run_point" ) )
        return;

    wait(randomfloatrange( 0.1, 0.8 ));
    maps\_anim::_id_0BCA( self, "gravity", "prone_dive" );
    thread maps\_anim::_id_0BCE( self, "prone_idle", undefined, "stop_loop" );
    self _meth_81ce( "prone" );
    var_0 = randomfloatrange( 0.1, 2 );
    maps\_utility::_id_07BE( maps\_utility::_id_0694, var_0 );
    maps\_utility::_id_07BE( ::player_gets_near );
    maps\_utility::_id_075B( "death" );
    maps\_utility::_id_2BDD();
    wait 1;
    self notify( "stop_loop" );
    self _meth_8143();
    var_0 = randomfloatrange( 3, 4 );
    maps\_utility::_id_07BE( maps\_utility::_id_32E0, "reached_run_point" );
    maps\_utility::_id_07BE( maps\_utility::_id_0694, var_0 );
    maps\_utility::_id_2BDD();
    maps\_utility::_id_32DE( "reached_run_point" );
}

player_gets_near()
{
    wait(randomfloat( 1 ));

    for (;;)
    {
        if ( distance( level.playercardbackground.origin, self.origin ) < 400 )
            break;

        wait 0.1;
    }
}

fair_stop_path_if_near_player()
{
    self endon( "death" );

    for (;;)
    {
        if ( distance( self.origin, level.playercardbackground.origin ) < 500 )
        {
            self notify( "stop_going_to_node" );
            return;
        }

        wait 1;
    }
}

fair_alt_spawner_think()
{
    fair_guy_moves_in( 1 );
}

fair_spawner_think()
{
    fair_guy_moves_in( 0 );
}

fair_guy_moves_in( var_0 )
{
    if ( isdog() )
    {
        self setthreatbiasgroup( "dog" );
        var_1 = best_fair_path( var_0 );
        var_1.uses++;
        thread fair_stop_path_if_near_player();
        self._id_2AF3 = 1;
        maps\_spawner::_id_4249( var_1 );
        self._id_2AF3 = 0;
        thread reacquire_player_pos();
        return;
    }

    maps\_utility::_id_32DD( "reached_run_point" );
    thread fairground_guy_modify_attack_based_on_player();
    self endon( "death" );
    self endon( "long_death" );
    self._id_2D3B = 1;
    thread fair_guy_sets_high_intensity();

    if ( level._id_3BFE < 2 )
        self.a.forced_cover = "hide";

    if ( !common_scripts\utility::_id_382E( "fairbattle_detected" ) )
    {
        fair_guy_pre_battle_behavior( var_0 );

        if ( !fairground_should_skip_prone_moment() )
            fair_guy_responds_to_invisible_attack();

        wait(randomfloatrange( 0.2, 2 ));
        self notify( "stop_animmode" );
    }
    else
    {
        var_1 = best_fair_path( var_0 );
        var_1.uses++;
        self._id_2AF3 = 1;
        thread maps\_spawner::_id_4249( var_1 );
        wait_until_near_player_or_run_point();
        self._id_2AF3 = 0;
        var_2 = getent( "park_reinforce", "targetname" );
        self _meth_81aa( var_2.origin );
    }

    fairground_attack_logic();
}

wait_until_near_player_or_run_point()
{
    self endon( "reached_path_end" );
    self endon( "reached_run_point" );

    for (;;)
    {
        if ( distance( self.origin, level.playercardbackground.origin ) < 1024 )
            return;

        wait 1;
    }
}

found_good_cover_spot()
{
    if ( !isdefined( self.goalpos ) )
        return 0;

    if ( !isdefined( self.node_relinquished ) )
        return 0;

    if ( !issubstr( self.node_relinquished.unlockpoints, "over" ) )
        return 0;

    return 1;
}

fairground_should_skip_prone_moment()
{
    return common_scripts\utility::_id_382E( "fairbattle_threat_visible" );
}

fairground_guy_modify_attack_based_on_player()
{
    self endon( "death" );

    for (;;)
    {
        fairguy_cant_fight();
        var_0 = 200;
        var_1 = 256;
        var_2 = 128;

        if ( level.playercardbackground getstance() != "prone" )
        {
            var_0 = 750;
            var_1 = 900;
            var_2 = 600;
        }

        var_3 = distance( self.origin, level.playercardbackground.origin );

        if ( var_3 > var_1 )
        {
            fairguy_cant_fight();
            wait 5;
            continue;
        }

        if ( var_3 < var_2 )
        {
            fairguy_can_fight();
            wait 1;
            continue;
        }

        if ( var_3 < var_0 )
        {
            if ( self _meth_81c2( level.playercardbackground ) )
            {
                fairguy_can_fight();
                wait 5;
                continue;
            }
        }

        wait 1;
    }
}

rpgguy()
{
    return issubstr( self.classname, "RPG" );
}

fairguy_cant_fight()
{
    if ( !common_scripts\utility::_id_382E( "player_plays_nice" ) )
    {
        fairguy_can_fight();
        return;
    }

    self.canfight = 0;

    if ( rpgguy() )
        return;

    if ( level._id_3BFE < 2 )
        self.a.forced_cover = "hide";
}

fairguy_can_fight()
{
    self.canfight = 1;
    self.a.forced_cover = "none";
    self._id_2D3B = undefined;
}

fair_zone_orgs_init()
{
    if ( isdefined( self.id_num ) )
        return;

    self.id_num = level.fairground_zone_orgs_all.size;
    level.fairground_zone_orgs_all[self.id_num] = self;
}

fair_zone_trigger()
{
    var_0 = maps\_utility::_id_3DC0();
    common_scripts\utility::_id_0D13( var_0, ::fair_zone_orgs_init );

    for (;;)
    {
        self waittill( "trigger" );
        level.fair_zone = self;
        level.fairground_zone_orgs = var_0;
        level notify( "fairground_new_zone" );
        common_scripts\utility::_id_97CC();
        level common_scripts\utility::_id_A087( "fairground_new_zone", "fairground_clear_zone" );
        common_scripts\utility::_id_97CE();
    }
}

fair_zone_clear()
{
    level.fair_zone = undefined;
    level notify( "fairground_clear_zone" );
}

fairground_attack_logic()
{
    self notify( "stop_going_to_node" );
    self endon( "death" );
    maps\_utility::_id_7E45( "sprint" );
    self.ignoreforfixednodesafecheck = 0;
    self _meth_81ce( "stand", "prone", "crouch" );

    if ( rpgguy() )
    {
        self _meth_8170( 500, 500 );
        self _meth_8171( 800, 800 );
    }

    self _meth_8170( 1500, 0 );
    self _meth_8171( 1800, 1800 );
    var_0 = self.classname == "actor_enemy_merc_SNPR_dragunov" || self.classname == "actor_enemy_merc_LMG_rpd";

    if ( level._id_3BFE >= 2 )
        self.fairground_flanker = !var_0;
    else
    {
        self.fairground_flanker = 0;

        if ( !var_0 )
        {
            level.fairground_generic_count--;

            if ( level.fairground_generic_count <= 0 )
            {
                self.fairground_flanker = 1;
                level.fairground_generic_count = level.fairground_generic_skillcount[level._id_3BFE];
            }
        }
    }

    if ( !self.fairground_flanker )
    {
        fairground_generic_attack_behavior();
        return;
    }

    for (;;)
    {
        if ( isdefined( level.fair_zone ) )
            fairground_zone_attack_behavior();
        else
            fairground_generic_attack_behavior();

        wait(randomfloatrange( 2, 5 ));
    }
}

fairground_rotate_current_zone()
{
    for (;;)
    {
        if ( isdefined( level.fairground_zone_orgs ) )
        {
            level.fairground_zone_index++;

            if ( level.fairground_zone_index >= level.fairground_zone_orgs.size )
                level.fairground_zone_index = 0;

            level.fairground_current_zone_org = level.fairground_zone_orgs[level.fairground_zone_index];
        }

        wait 6;
    }
}

fairground_zone_attack_behavior()
{
    level endon( "fairground_clear_zone" );

    if ( isdefined( level.engagement_dist_func[self.classname] ) )
        [[ level.engagement_dist_func[self.classname] ]]();
    else
        engagement_gun();

    var_0 = level.fairground_zone_orgs[level.fairground_zone_index];

    if ( isdefined( level.fairground_current_zone_org ) )
        var_0 = level.fairground_current_zone_org;

    wait 0.05;
    self _meth_81aa( var_0.origin );
    self.goalradius = var_0.rank;
    self waittill( "goal" );

    for (;;)
    {
        var_0 = common_scripts\utility::_id_3F33( level.playercardbackground.origin, level.fairground_zone_orgs_all );
        self _meth_81aa( var_0.origin );
        var_1 = distance( self.origin, var_0.origin );

        if ( var_1 < 700 )
            var_1 = 700;

        self.goalradius = var_1;
        wait(randomfloat( 3 ));
    }
}

fairground_generic_attack_behavior()
{
    if ( self.fairground_flanker )
        level endon( "fairground_new_zone" );

    for (;;)
    {
        var_0 = getent( "enemy_fair_dest", "targetname" );
        self _meth_81aa( var_0.origin );
        self.goalradius = 3000;

        if ( !isalive( self.enemy ) )
        {
            while ( !isalive( self.enemy ) )
                wait 1;
        }

        var_1 = distance( self.origin, self.enemy.origin );

        if ( !rpgguy() )
        {
            self _meth_8170( var_1 * 0.85, 0 );
            self _meth_8171( var_1 * 0.95, var_1 );
        }

        for (;;)
        {
            if ( !common_scripts\utility::_id_382E( "player_plays_nice" ) && !common_scripts\utility::_id_382E( "seaknight_leaves" ) )
                fairground_kill_mean_player_until_he_plays_nice();

            if ( found_good_cover_spot() )
            {
                if ( distance( self.node_relinquished.origin, self.origin ) > 128 )
                    break;
            }

            wait 1;
        }

        self _meth_81aa( self.node_relinquished.origin );
        self.goalradius = 64;

        if ( common_scripts\utility::_id_382E( "player_plays_nice" ) )
        {
            level common_scripts\utility::_id_A0A0( "player_plays_nice", randomfloatrange( 20, 30 ) );
            continue;
        }

        fairground_kill_mean_player_until_he_plays_nice();
    }
}

fairground_kill_mean_player_until_he_plays_nice()
{
    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "player_made_it_to_seaknight" ) )
        {
            wait 1;
            return;
        }

        self _meth_81aa( level.playercardbackground.origin );
        self.goalradius = 1024;
        wait 5;
    }
}

fairground_detect_activity_and_set_flag()
{
    waittill_stealth_broken();
    common_scripts\utility::_id_383F( "fairbattle_gunshot" );
    common_scripts\utility::_id_383F( "fairbattle_detected" );
}

waittill_stealth_broken()
{
    self endon( "damage" );
    self endon( "death" );
    self endon( "explode" );
    self endon( "projectile_impact" );
    self endon( "explode" );
    self endon( "doFlashBanged" );
    self endon( "bulletwhizby" );
    level waittill( "foreverevere" );
}

fairground_detect_activity_and_set_visible()
{
    self endon( "death" );
    level endon( "fairbattle_detected" );

    if ( common_scripts\utility::_id_382E( "fairbattle_detected" ) )
        return;

    for (;;)
    {
        self waittill( "enemy" );

        if ( !isalive( self.enemy ) )
            continue;

        if ( distance( self.enemy.origin, self.origin ) > self.enemy.meleeattackdist )
            continue;

        common_scripts\utility::_id_383F( "fairbattle_threat_visible" );
        common_scripts\utility::_id_383F( "fairbattle_gunshot" );
        common_scripts\utility::_id_383F( "fairbattle_detected" );
    }
}

patrol_fairgrounds_for_player( var_0 )
{
    self endon( "death" );
    thread fairground_detect_activity_and_set_flag();
    thread fairground_detect_activity_and_set_visible();
    var_1 = best_fair_path( var_0 );
    var_1.uses++;
    maps\_utility::_id_7E45( "patrol_jog" );
    self._id_2AF3 = 1;
    thread maps\_spawner::_id_4249( var_1, ::do_patrol_anim_at_org );
}

do_patrol_anim_at_org( var_0 )
{
    thread do_patrol_anim_at_org_thread( var_0 );
}

print3d_forever( var_0, var_1, var_2, var_3, var_4 )
{
    for (;;)
        wait 0.05;
}

do_patrol_anim_at_org_thread( var_0 )
{
    if ( isdefined( var_0.script_parentname ) && var_0.script_parentname == "run_point" )
        maps\_utility::_id_32DE( "reached_run_point" );

    if ( common_scripts\utility::_id_382E( "fairbattle_detected" ) )
        return;

    if ( !isdefined( var_0._not_team ) )
        return;

    if ( !isdefined( var_0.marker ) )
    {
        var_0.marker = 1;

        if ( !isdefined( level.gmarker ) )
            level.gmarker = 0;

        level.gmarker++;
    }

    self endon( "death" );

    if ( !isdefined( var_0._id_7A18 ) )
        return;

    self.allowdeath = 1;
    self.a._id_5F5B = "run";
    var_1 = get_patrol_anims();
    thread delayed_patrol_anim( var_1[var_0._id_7A18] );
    var_0._id_7A18 = undefined;
}

delayed_patrol_anim( var_0 )
{
    self endon( "stop_animmode" );
    self endon( "death" );
    wait 0.5;
    maps\_anim::_id_0BCA( self, "gravity", var_0 );
}

remove_cant_see_player( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( var_3 _meth_81c2( level.playercardbackground ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

wait_until_saw_enemy()
{
    for (;;)
    {
        var_0 = getaiarray( "axis" );
        var_1 = self geteye();
        var_2 = gettime();

        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            var_4 = var_0[var_3];

            if ( !isalive( var_4 ) )
                continue;

            var_5 = var_4 geteye();
            var_6 = bullettrace( var_1, var_5, 0, undefined );

            if ( var_6["fraction"] == 1 )
            {
                maps\_utility::_id_9F8C( var_2, 1 );
                return;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

fairground_price_dialogue()
{
    level endon( "fairbattle_high_intensity" );
    level._id_6F7C maps\_utility::_id_07BE( ::wait_until_saw_enemy );
    maps\_utility::_id_07BE( common_scripts\utility::_id_384A, "enemies_in_sight" );
    maps\_utility::_id_07BE( common_scripts\utility::_id_384A, "tangos_in_sight" );
    maps\_utility::_id_2BDD();
    common_scripts\utility::_id_383F( "enemies_in_sight" );
    price_line( "let_them_get_closer" );
    common_scripts\utility::_id_384A( "get_ready_to_fire" );
    price_line( "standby_to_engage" );
}

fairground_player_visibility()
{
    var_0 = level.playercardbackground.meleeattackdist;

    for (;;)
    {
        if ( common_scripts\utility::_id_382E( "fairbattle_detected" ) )
            break;

        if ( level.playercardbackground getstance() == "stand" )
            level.playercardbackground.meleeattackdist = 1800;

        if ( level.playercardbackground getstance() == "crouch" )
            level.playercardbackground.meleeattackdist = 700;

        if ( level.playercardbackground getstance() == "prone" )
            level.playercardbackground.meleeattackdist = 128;

        wait 0.5;
    }

    level.playercardbackground.meleeattackdist = var_0;
}

price_warns_player()
{
    var_0 = "watch_out_1";
    var_1 = undefined;

    for (;;)
    {
        var_2 = getaispeciesarray( "axis", "all" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            wait 0.05;

            if ( !isalive( var_2[var_3] ) )
                continue;

            if ( !isalive( var_2[var_3].enemy ) )
                continue;

            if ( !isplayer( var_2[var_3].enemy ) )
                continue;

            if ( isalive( var_1 ) && var_2[var_3] == var_1 )
                continue;

            if ( distance( var_2[var_3].origin, level.playercardbackground.origin ) > 500 )
                break;

            var_1 = var_2[var_3];
            price_line( var_0 );

            if ( var_0 == "watch_out_1" )
                var_0 = "watch_out_2";
            else
                var_0 = "watch_out_1";

            wait 3;
        }

        wait 0.05;
    }
}

all_guys_drop_grenades()
{
    self waittill( "death" );
    level._id_60CB = -5;
}

fairground_battle()
{
    var_0 = [];
    var_0[0] = 0.5;
    var_0[1] = 0.7;
    var_0[2] = 0.85;
    var_0[3] = 0.85;
    maps\_utility::_id_0761( "axis", ::all_guys_drop_grenades );
    level.price_sticky_target_time = 1000;
    anim._id_6A64 = var_0[level._id_3BFE];
    level.playercardbackground.attackeraccuracy = anim._id_6A64;

    if ( level._id_3BFE >= 2 )
    {
        level._id_584F = 2000;
        level.playercardbackground.deathinvulnerabletime = 750;
    }

    var_1 = [];
    var_1[0] = 1.25;
    var_1[1] = 1.25;
    var_1[2] = 1.15;
    var_1[3] = 1.0;
    setsaveddvar( "ai_accuracydistscale", var_1[level._id_3BFE] );
    level.fair_grenade_guy_countdown = 0;
    level.fair_battle_guys_spawned = 0;
    level._id_6F7C.meleeattackdist = 1400;
    level.fairground_zone_orgs_all = [];
    level.fairground_zone_index = 0;
    thread fairground_rotate_current_zone();
    level.fairground_generic_skillcount[0] = 3;
    level.fairground_generic_skillcount[1] = 2;
    level.fairground_generic_count = 0;
    common_scripts\utility::_id_76BB( "fair_zone_trigger", ::fair_zone_trigger );
    common_scripts\utility::_id_76BB( "fair_zone_clear", ::fair_zone_clear );
    level maps\_utility::_id_07BE( common_scripts\utility::_id_384A, "fairbattle_detected" );
    level maps\_utility::_id_075F( maps\_utility::_id_7C82, "_stealth_stop_stealth_logic" );
    thread price_warns_player();
    common_scripts\utility::_id_3831( "open_fire" );

    if ( isalive( level._id_6F7C ) )
    {
        thread fairground_price_adjustment();
        thread price_opens_fire();
    }

    var_2 = getaispeciesarray( "axis", "all" );
    common_scripts\utility::_id_0D13( var_2, ::die_soon );

    if ( isalive( level._id_6F7C ) )
        level._id_6F7C _meth_816a();

    common_scripts\utility::_id_382F( "fairbattle_high_intensity" );
    setsaveddvar( "ai_eventDistGunShot", 4500 );
    thread maps\sniperescape_wounding::fairground_keep_player_out_of_pool();
    thread fairground_price_dialogue();
    thread fairground_player_visibility();
    level._id_0669._id_5836._id_298E["hidden"]["stand"] = 2048;
    common_scripts\utility::_id_383F( "faiground_battle_begins" );
    common_scripts\utility::_id_383F( "aa_seaknight_rescue" );
    maps\_utility::_id_735B( "axis", ::enemy_override );
    var_3 = getentarray( "secondary_path", "script_noteworthy" );
    common_scripts\utility::_id_0D13( var_3, ::secondary_path_think );
    thread fairground_force_high_intensity();
    level.fair_paths = common_scripts\utility::_id_40FD( "fair_path", "targetname" );
    level.fair_paths_alt = common_scripts\utility::_id_40FD( "fair_path_alt", "targetname" );
    var_4 = getent( "field_ref_spot", "targetname" );
    level.fair_paths = common_scripts\utility::_id_3CCB( var_4.origin, level.fair_paths );
    common_scripts\utility::_id_0D13( level.fair_paths, ::init_fair_paths );
    level.fair_paths_alt = common_scripts\utility::_id_3CCB( var_4.origin, level.fair_paths_alt );
    common_scripts\utility::_id_0D13( level.fair_paths_alt, ::init_fair_paths );
    level.fair_runners = 0;
    var_5 = getentarray( "fair_spawner", "targetname" );
    common_scripts\utility::_id_0D13( var_5, maps\_utility::_id_0798, ::fair_spawner_think );
    var_6 = getentarray( "fair_spawner_alt", "targetname" );
    common_scripts\utility::_id_0D13( var_6, maps\_utility::_id_0798, ::fair_alt_spawner_think );
    level.playercardbackground.ignoretriggers = 1;
    fairground_pre_detection();
    level.playercardbackground.ignoretriggers = 0;
    level.playercardbackground.threatsightdelayfalloff = 500;
    common_scripts\utility::_id_384A( "fairbattle_detected" );
    common_scripts\utility::_id_384A( "fairbattle_high_intensity" );
    common_scripts\utility::_id_3831( "fair_hold_fire" );
    fairground_post_detection();
}

init_fair_paths()
{
    self.uses = 1;

    if ( isdefined( self.script_parentname ) )
        self.uses = 0;
}

fairground_pre_detection()
{
    level endon( "fairbattle_detected" );
    var_0 = get_fair_spawners();

    if ( level._id_8C36 != "fair_battle2" )
    {
        spawn_classname( var_0, "ak47", 2 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
        wait 4;
        var_0 = get_fair_spawners();
        spawn_classname( var_0, "ak47", 2 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
        wait 4;
    }
    else
        spawn_classname( var_0, "ak47", 2 );
}

get_fair_spawners()
{
    var_0 = getent( "alt_fair_trigger", "targetname" );

    if ( level.playercardbackground istouching( var_0 ) )
        return getentarray( "fair_spawner_alt", "targetname" );
    else
        return getentarray( "fair_spawner", "targetname" );
}

spawn_intro_wave()
{
    var_0 = get_fair_spawners();

    if ( level._id_3BFE == 0 )
    {
        spawn_classname( var_0, "ak47", 1 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
        spawn_classname( var_0, "winc", 1 );
    }
    else if ( level._id_3BFE == 1 )
    {
        spawn_classname( var_0, "ak47", 1 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
        spawn_classname( var_0, "winc", 1 );
    }
    else if ( level._id_3BFE == 2 )
    {
        spawn_classname( var_0, "winc", 2 );
        spawn_classname( var_0, "g3", 2, 1 );
        spawn_classname( var_0, "drag", 2 );
    }
    else if ( level._id_3BFE == 3 )
    {
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "rpd", 1, 1 );
        spawn_classname( var_0, "drag", 3 );
    }
}

spawn_lowbie_mixed()
{
    var_0 = get_fair_spawners();

    if ( level._id_3BFE == 0 )
    {
        spawn_classname( var_0, "ak47", 2 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "winc", 2 );
    }
    else if ( level._id_3BFE == 1 )
    {
        spawn_classname( var_0, "winc", 2 );
        spawn_classname( var_0, "g3", 2 );
        spawn_classname( var_0, "mp5", 2 );
    }
    else if ( level._id_3BFE == 2 )
    {
        spawn_classname( var_0, "winc", 2, 1 );
        spawn_classname( var_0, "g3", 2, 1 );
        spawn_classname( var_0, "mp5", 2 );
    }
    else if ( level._id_3BFE == 3 )
    {
        spawn_classname( var_0, "ak47", 1, 1 );
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "mp5", 3 );
    }
}

spawn_sniper_mixed()
{
    var_0 = get_fair_spawners();

    if ( level._id_3BFE == 0 )
    {
        spawn_classname( var_0, "ak47", 1 );
        spawn_classname( var_0, "mp5", 2 );
        spawn_classname( var_0, "drag", 4 );
    }
    else if ( level._id_3BFE == 1 )
    {
        spawn_classname( var_0, "ak47", 1 );
        spawn_classname( var_0, "g3", 1 );
        spawn_classname( var_0, "mp5", 1 );
        spawn_classname( var_0, "drag", 3 );
    }
    else if ( level._id_3BFE == 2 )
    {
        spawn_classname( var_0, "ak47", 1, 1 );
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "drag", 4 );
    }
    else if ( level._id_3BFE == 3 )
    {
        spawn_classname( var_0, "RPG", 1 );
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "drag", 4 );
    }
}

spawn_saw_support()
{
    var_0 = get_fair_spawners();
    spawn_classname( var_0, "rpd", 3, 1 );

    if ( level._id_3BFE >= 2 )
    {
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "dog", 1 );
    }
    else
    {
        spawn_classname( var_0, "g3", 1, 1 );
        spawn_classname( var_0, "winc", 1, 1 );
        spawn_classname( var_0, "mp5", 1 );
    }
}

spawn_saw_support_no_dog()
{
    var_0 = get_fair_spawners();
    spawn_classname( var_0, "rpd", 3, 1 );
    spawn_classname( var_0, "g3", 1, 1 );
    spawn_classname( var_0, "winc", 1, 1 );
    spawn_classname( var_0, "mp5", 1 );
}

spawn_rpg_support()
{
    var_0 = get_fair_spawners();
    spawn_classname( var_0, "RPG", 3 );
    spawn_classname( var_0, "g3", 1, 1 );
    spawn_classname( var_0, "winc", 1, 1 );
    spawn_classname( var_0, "mp5", 1 );
}

spawn_dog_support()
{
    var_0 = get_fair_spawners();

    if ( level._id_3BFE == 0 )
        spawn_classname( var_0, "dog", 2 );
    else if ( level._id_3BFE == 1 )
        spawn_classname( var_0, "dog", 2 );
    else if ( level._id_3BFE == 2 )
        spawn_classname( var_0, "dog", 3 );
    else if ( level._id_3BFE == 3 )
        spawn_classname( var_0, "dog", 3 );
}

player_has_red_flashing_overlay()
{
    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
    {
        var_1 = level.players[var_0];

        if ( var_1 maps\_utility::_id_32D8( "player_has_red_flashing_overlay" ) )
            return 1;
    }

    return 0;
}

fairbattle_autosave()
{
    if ( level._id_8C36 == "seaknight" )
        return;

    for ( var_0 = 0; var_0 < 14; var_0++ )
    {
        if ( issaverecentlyloaded() )
            return;

        wait 1;

        if ( issaverecentlyloaded() )
            return;

        if ( player_has_red_flashing_overlay() )
            continue;

        if ( maps\_utility::_id_6B6F() )
            continue;

        var_1 = getaispeciesarray( "axis", "all" );
        var_1 = remove_vehicle_riders_from_array( var_1 );
        var_2 = level.fair_battle_guys_spawned - var_1.size;
        var_3 = var_2 / level.fair_battle_guys_spawned;
        level.killed_guys = var_2;
        level.killed_ratio = var_3;

        if ( var_3 < 0.7 )
            continue;

        if ( var_1.size )
        {
            var_4 = common_scripts\utility::_id_3F33( level.playercardbackground.origin, var_1 );

            if ( distance( var_4.origin, level.playercardbackground.origin ) < 760 )
                continue;
        }

        if ( maps\_utility::_id_114E() )
            return;
    }
}

remove_vehicle_riders_from_array( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( !isdefined( var_0[var_2]._id_750E ) )
            var_1[var_1.size] = var_0[var_2];
    }

    return var_1;
}

spawn_heli_pod_1()
{
    wait 25;
    maps\_vehicle::_id_8979( "fairground_heli1" );
    maps\_vehicle::_id_8979( "fairground_heli2" );
    thread chopper_discussion();
    thread fairbattle_autosave();
}

spawn_heli_pod_2()
{
    maps\_vehicle::_id_8979( "fairground_heli3" );
    maps\_vehicle::_id_8979( "fairground_heli4" );
}

chopper_discussion()
{
    wait 4;
    price_line( "enemy_choppers" );
    wait 7;
    wait 38;
    price_line( "where_are_you" );
    price_line( "be_there_asap" );
}

fairground_post_detection()
{
    maps\_utility::_id_1333( "axis" );
    var_0 = [];
    var_0["intro_wave"] = ::spawn_intro_wave;
    var_0["lowbie_mixed"] = ::spawn_lowbie_mixed;
    var_0["heli_pod_1"] = ::spawn_heli_pod_1;
    var_0["heli_pod_2"] = ::spawn_heli_pod_2;
    var_0["saw_support"] = ::spawn_saw_support;
    var_0["saw_support_no_dog"] = ::spawn_saw_support_no_dog;
    var_0["rpg_support"] = ::spawn_rpg_support;
    var_0["dog_support"] = ::spawn_dog_support;
    var_0["sniper_mixed"] = ::spawn_sniper_mixed;
    var_1 = [];
    var_1["intro_wave"] = 6;
    var_1["lowbie_mixed"] = 6;
    var_1["heli_pod_1"] = 8;
    var_1["heli_pod_2"] = 8;
    var_1["saw_support"] = 6;
    var_1["saw_support_no_dog"] = 6;
    var_1["rpg_support"] = 6;
    var_1["dog_support"] = 3;
    var_1["sniper_mixed"] = 6;
    var_2 = spawnstruct();
    var_2._id_9373 = gettime();
    var_2.events = [];

    if ( level._id_8C36 != "fair_battle2" )
    {
        var_2 = add_to_schedule( var_2, "intro_wave", 12 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 6 );
        var_2 = add_to_schedule( var_2, "rpg_support", 7 );
        var_2 = add_to_schedule( var_2, "sniper_mixed", 12 );
        var_2 = add_to_schedule( var_2, "saw_support", 5 );
        var_2 = add_to_schedule( var_2, "rpg_support", 4 );
    }

    var_2 = add_to_schedule( var_2, "heli_pod_1", 4 );
    var_2 = add_to_schedule( var_2, "heli_pod_2", 28 );

    if ( level._id_3BFE >= 2 )
    {
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 28 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 2 );
        var_2 = add_to_schedule( var_2, "saw_support", 2 );
    }
    else
    {
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 34 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 2 );
    }

    for ( var_3 = 0; var_3 < 5; var_3++ )
    {
        var_2 = add_to_schedule( var_2, "saw_support_no_dog", 11 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 11 );
        var_2 = add_to_schedule( var_2, "saw_support", 11 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 11 );
        var_2 = add_to_schedule( var_2, "rpg_support", 11 );
        var_2 = add_to_schedule( var_2, "lowbie_mixed", 11 );
    }

    var_4 = 0;

    for (;;)
    {
        var_5 = var_2.events[var_4];
        var_6 = gettime();

        if ( var_5["timer"] > var_6 )
            wait(( var_5["timer"] - var_6 ) * 0.001);

        wait_until_enough_ai_headroom( var_1[var_5["event"]] );

        if ( getaispeciesarray( "axis", "all" ).size <= 8 )
        {

        }

        thread [[ var_0[var_5["event"]] ]]();
        var_4++;

        if ( var_4 >= var_2.events.size )
            break;
    }
}

wait_until_enough_ai_headroom( var_0 )
{
    for (;;)
    {
        if ( getaispeciesarray( "all" ).size + var_0 <= 32 )
            break;

        wait 1;
    }
}

add_to_schedule( var_0, var_1, var_2 )
{
    var_2 *= 1000;
    var_0._id_9373 += var_2;
    var_3 = [];
    var_3["event"] = var_1;
    var_3["timer"] = var_0._id_9373;
    var_0.events[var_0.events.size] = var_3;
    return var_0;
}

fairground_enemy_helis()
{
    level endon( "seaknight_flies_in" );
    common_scripts\utility::_id_382F( "seaknight_flies_in" );
    wait 5;
    var_0 = [];
    var_0[var_0.size] = "fairground_heli1";
    var_0[var_0.size] = "fairground_heli2";
    var_0[var_0.size] = "fairground_heli3";
    var_0[var_0.size] = "fairground_heli4";
    var_0[var_0.size] = "fairground_heli5";
    var_1 = 26;

    for (;;)
    {
        var_0 = common_scripts\utility::_id_0CF5( var_0 );

        for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        {
            while ( getaispeciesarray( "all", "all" ).size >= 31 )
                wait 1;

            var_3 = var_0[var_2];
            thread heli_drops_off_guys_at_fairground( var_3 );
            wait(var_1);
            var_1 -= 2;

            if ( var_1 < 8 )
                var_1 = 8;
        }
    }
}

heli_drops_off_guys_at_fairground( var_0 )
{
    common_scripts\utility::_id_383F( "enemy_choppers_incoming" );
    var_1 = maps\_vehicle::_id_8979( var_0 );
    var_1 waittill( "unloading" );
    waitframe;
    wait 6;

    if ( !incoming_heli_exists() )
        common_scripts\utility::_id_3831( "enemy_choppers_incoming" );
}

price_says_this_is_fine()
{
    level endon( "price_picked_up" );

    for (;;)
    {
        if ( distance( level.playercardbackground.origin, price_fair_defendspot() ) < level.price_gnoll_dist )
        {
            thread price_line( "this_is_fine" );
            common_scripts\utility::_id_383F( "can_manage_price" );
            return;
        }

        wait 0.5;
    }
}

secondary_path_think()
{
    var_0 = getentarray( self.teambalanced, "targetname" );
    var_0 = common_scripts\utility::_id_0CF6( var_0, self );
    var_0[var_0.size] = self;
    level._id_4242[self.teambalanced] = var_0;
}

should_halt()
{
    if ( !isalive( level._id_6F7C.enemy ) )
        return 1;

    return distance( level._id_6F7C.enemy.origin, level._id_6F7C.origin ) > 1024;
}

price_kill_check()
{
    self waittill( "death", var_0 );

    if ( !isalive( var_0 ) )
        return;

    if ( !isalive( level._id_6F7C ) )
        return;

    if ( var_0 != level._id_6F7C )
        return;

    wait 1.0;
    price_calls_out_a_kill();
}

heat_progression_summons_kill_heli()
{
    level.kill_heli_progression++;
    self.info_player_start = level.kill_heli_progression;
    level.kill_heli_progression_triggers[self.info_player_start] = 0;
    level.kill_heli_progression_warnings[self.info_player_start] = 0;
    level endon( "break_for_apartment" );
    waitframe;
    var_0 = [];
    var_1 = getentarray( "heat_progression", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2]._id_7A18 < self._id_7A18 )
            var_0[var_0.size] = var_1[var_2];
    }

    for (;;)
    {
        self waittill( "trigger" );

        if ( self.info_player_start < level.kill_heli_index && gettime() > level.kill_heli_last_warning_refresh_time )
        {
            level.kill_heli_last_warning_time = 0;
            level.kill_heli_last_warning_refresh_time = gettime() + 5000;
        }

        level.kill_heli_index = self.info_player_start;
        level.kill_heli_triggers = var_0;
    }
}

_id_5319()
{
    var_0 = 75;
    var_1 = 68;
    var_2 = 1;
    var_3 = [];
    var_3[var_3.size] = 20;
    var_3[var_3.size] = 40;
    var_3[var_3.size] = 60;
    level.kill_heli_last_warning_time = gettime() + 5000;

    for (;;)
    {
        for ( var_4 = 0; var_4 < level.kill_heli_triggers.size; var_4++ )
        {
            var_5 = level.kill_heli_triggers[var_4].info_player_start;

            if ( level.kill_heli_progression_triggers[var_5] < var_1 )
                level.kill_heli_progression_triggers[var_5]++;
        }

        level.kill_heli_progression_triggers[level.kill_heli_index]++;
        wait 1;

        if ( common_scripts\utility::_id_382E( "break_for_apartment" ) )
            return;

        var_6 = level.kill_heli_progression_triggers[level.kill_heli_index];

        if ( common_scripts\utility::_id_382E( "price_calls_out_kills" ) )
        {
            if ( var_6 > var_3[0] )
                common_scripts\utility::_id_3831( "price_calls_out_kills" );
        }
        else if ( var_6 < var_3[0] )
            common_scripts\utility::_id_383F( "price_calls_out_kills" );

        if ( gettime() > level.kill_heli_last_warning_time )
        {
            if ( var_6 > var_3[level.kill_heli_progression_warnings[level.kill_heli_index]] )
            {
                level.kill_heli_progression_warnings[level.kill_heli_index]++;

                if ( level.kill_heli_progression_warnings[level.kill_heli_index] >= var_3.size )
                    level.kill_heli_progression_warnings[level.kill_heli_index] = var_3.size - 1;

                thread price_line( "gotta_go_" + var_2 );
                var_2++;

                if ( var_2 > 10 )
                    var_2 = 1;

                level.kill_heli_last_warning_time = gettime() + 10000;
            }
        }

        if ( var_6 > var_0 )
            break;
    }

    if ( common_scripts\utility::_id_382E( "break_for_apartment" ) )
        return;

    var_7 = maps\_vehicle::_id_8979( "kill_heli" );
    var_7 setvehweapon( "hind_turret_penetration" );
    var_7 waittill( "reached_dynamic_path_end" );
    common_scripts\utility::_id_383F( "kill_heli_attacks" );
    var_8 = common_scripts\utility::_id_40FD( "kill_heli_spot", "targetname" );

    for (;;)
    {
        var_9 = common_scripts\utility::_id_3F33( level.playercardbackground.origin, var_8 );
        var_7 vehicle_setspeed( 40, 10, 10 );
        var_7 neargoalnotifydist( 100 );
        var_7 setgoalpos( var_9.origin, 1 );
        var_7 waittill( "near_goal" );

        if ( common_scripts\utility::_id_382E( "break_for_apartment" ) )
            return;

        for ( var_4 = 0; var_4 < 30; var_4++ )
        {
            var_10 = vectortoangles( level.playercardbackground.origin - var_7.origin );
            var_7 setgoalyaw( var_10[1] );
            var_7 setturrettargetent( level.playercardbackground, common_scripts\utility::_id_712D( 15 ) + ( 0.0, 0.0, 16.0 ) );
            var_7 fireweapon();
            wait 0.05;
        }

        wait(randomfloatrange( 0.8, 1.3 ));
    }
}

sufficient_time_remaining()
{
    if ( common_scripts\utility::_id_382E( "player_enters_fairgrounds" ) )
        return 1;

    return get_seconds_until_no_saving() > 0;
}

get_seconds_until_no_saving()
{
    return ( level.evac_fail_time - level.evac_min_time_remaining * 1000 * 60 - gettime() ) * 0.001;
}

set_min_time_remaining( var_0 )
{
    level.evac_min_time_remaining = var_0;
    common_scripts\utility::_id_382F( "player_enters_fairgrounds" );
    level notify( "new_min_time" );
    level endon( "new_min_time" );
    level endon( "player_enters_fairgrounds" );
    var_1 = get_seconds_until_no_saving();

    if ( var_1 <= 0 )
    {
        common_scripts\utility::_id_3831( "can_save" );
        return;
    }

    wait(var_1);
    common_scripts\utility::_id_3831( "can_save" );
}

price_fights_until_enemies_leave()
{
    for (;;)
    {
        var_0 = getaiarray( "axis" );

        if ( !var_0.size )
            return;

        var_1 = common_scripts\utility::_id_3F33( level._id_6F7C.origin, var_0 );

        if ( distance( var_1.origin, level._id_6F7C.origin ) > 1000 )
            return;

        wait 0.05;
    }
}

should_break_where_is_he()
{
    return common_scripts\utility::_id_382E( "price_picked_up" ) || common_scripts\utility::_id_382E( "seaknight_prepares_to_leave" );
}

set_c4_throw_binding()
{
    var_0 = 0;
    var_1 = getdvar( "gpad_buttonsConfig" );

    if ( isdefined( var_1 ) )
    {
        if ( issubstr( var_1, "_alt" ) )
            var_0 = 1;
    }

    var_2 = getkeybinding( "+toggleads_throw" );

    if ( var_2["count"] )
    {
        maps\_utility::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4_TOGGLE", maps\sniperescape_exchange::should_break_c4_throw );
        return;
    }

    var_2 = getkeybinding( "+speed_throw" );

    if ( var_2["count"] )
    {
        if ( level.xuid || var_0 )
            maps\_utility::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4_SPEED_TRIGGER", maps\sniperescape_exchange::should_break_c4_throw );
        else
            maps\_utility::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4_SPEED", maps\sniperescape_exchange::should_break_c4_throw );

        return;
    }

    var_2 = getkeybinding( "+throw" );

    if ( var_2["count"] )
    {
        maps\_utility::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4", maps\sniperescape_exchange::should_break_c4_throw );
        return;
    }

    maps\_utility::_id_0764( "c4_throw", &"SCRIPT_HINT_THROW_C4_TOGGLE", maps\sniperescape_exchange::should_break_c4_throw );
}

c4_hint()
{
    var_0 = maps\sniperescape_exchange::getplayerc4();

    if ( !var_0 )
        return;

    thread maps\_utility::_id_2B4A( "c4" );

    while ( !maps\sniperescape_exchange::should_break_c4() )
        wait 1;

    wait 1.5;
    level.new_c4count = maps\sniperescape_exchange::getplayerc4();

    if ( level.new_c4count == var_0 && self getcurrentweapon() == "c4" )
        thread maps\_utility::_id_2B4A( "c4_throw" );
}

burnt_blocker()
{
    var_0 = getent( "burnt_retreat_blocker_trigger", "targetname" );
    var_1 = getent( "burnt_retreat_blocker", "targetname" );
    var_1 notsolid();
    var_0 waittill( "trigger" );
    common_scripts\utility::_id_383F( "player_moves_through_burnt_apartment" );
    set_objective_pos_to_extraction_point( maps\sniperescape_wounding::getobj( "wounded" ) );

    if ( 1 )
        return;

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( isalive( level._id_6F7C ) )
            continue;

        break;
    }

    for (;;)
    {
        var_1 solid();
        common_scripts\utility::_id_3857( "price_picked_up" );
        var_1 notsolid();
        common_scripts\utility::_id_384A( "price_picked_up" );
    }
}

house_chase_spawner()
{
    self endon( "death" );

    for (;;)
    {
        if ( distance( level.playercardbackground.origin, self.origin ) < 400 )
            break;

        wait 0.05;
    }

    self.goalradius = 1024;

    for (;;)
    {
        self _meth_81aa( level.playercardbackground.origin );
        wait 0.5;
    }
}

fair_spawner_seeks_player()
{
    self endon( "death" );
    wait 30;
    maps\_utility::_id_27EF( randomintrange( 25, 35 ), maps\_utility::_id_2A51 );
    self.goalradius = 512;

    for (;;)
    {
        self _meth_81aa( level.playercardbackground.origin );
        wait 5;
    }
}

handle_radiation_warning()
{
    for (;;)
    {
        level waittill( "radiation_warning" );
        price_line( "scoutsniper_mcm_youdaft" );
    }
}

sniper_escape_initial_secondary_weapon_loadout()
{
    level.playercardbackground giveweapon( "claymore" );
    level.playercardbackground giveweapon( "c4" );

    if ( level._id_3BFE >= 2 )
    {
        level.playercardbackground setweaponammoclip( "claymore", 10 );
        level.playercardbackground setweaponammoclip( "c4", 6 );
    }
    else
    {
        level.playercardbackground setweaponammoclip( "claymore", 8 );
        level.playercardbackground setweaponammoclip( "c4", 3 );
    }

    level.playercardbackground setactionslot( 4, "weapon", "claymore" );
    level.playercardbackground setactionslot( 2, "weapon", "c4" );
    level.playercardbackground giveweapon( "fraggrenade" );
    level.playercardbackground giveweapon( "flash_grenade" );
    level.playercardbackground enableoffhandweapons();
    level.playercardbackground setviewmodel( "viewhands_marine_sniper" );
}

set_legit_weapons_for_sniper_escape()
{
    level.sniperescape_main_weapon = "m14_scoped_woodland";
    var_0 = [];
    var_0["mp5"] = 1;
    var_0["usp_silencer"] = 1;
    var_0["ak47"] = 1;
    var_0["g3"] = 1;
    var_0["usp"] = 1;
    var_0[level.sniperescape_main_weapon] = 1;
    var_0["dragunov"] = 1;
    var_0["winchester1200"] = 1;
    var_0["beretta"] = 1;
    var_0["rpd"] = 1;
    var_0["rpg"] = 1;
    var_0["m14_scoped_silencer"] = 1;
    var_0["g36c"] = 1;
    var_0["p90_silencer"] = 1;
    level.legit_weapons = var_0;
}

max_ammo_on_legit_sniper_escape_weapon()
{
    var_0 = level.playercardbackground getweaponslistall();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( !isdefined( level.legit_weapons[var_2] ) )
            continue;

        if ( var_2 == "rpg" )
            continue;

        level.playercardbackground givemaxammo( var_2 );
    }
}

force_player_to_use_legit_sniper_escape_weapon()
{
    var_0 = level.playercardbackground getweaponslistprimaries();
    var_1 = [];
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];
        var_1[var_4] = 1;

        if ( isdefined( level.legit_weapons[var_4] ) )
        {
            var_2++;
            continue;
        }

        level.playercardbackground takeweapon( var_4 );
    }

    if ( var_2 == 2 )
        return;
    else if ( var_2 == 1 )
    {
        if ( player_has_legit_sniper_rifle( var_1 ) )
        {
            level.playercardbackground giveweapon( "ak47" );
            level.playercardbackground switchtoweapon( "ak47" );
        }
        else
        {
            level.playercardbackground giveweapon( level.sniperescape_main_weapon );
            level.playercardbackground switchtoweapon( level.sniperescape_main_weapon );
        }
    }
    else if ( var_2 == 0 )
    {
        level.playercardbackground giveweapon( "ak47" );
        level.playercardbackground giveweapon( level.sniperescape_main_weapon );
        level.playercardbackground switchtoweapon( level.sniperescape_main_weapon );
    }
}

player_has_legit_sniper_rifle( var_0 )
{
    return isdefined( var_0[level.sniperescape_main_weapon] ) || isdefined( var_0["dragunov"] ) || isdefined( var_0["m14_scoped_silencer"] );
}
