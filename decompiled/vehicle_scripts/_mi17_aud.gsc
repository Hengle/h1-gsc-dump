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

_id_86FA()
{
    soundscripts\_snd::_id_870C( "snd_register_vehicle", "mi17", ::_id_870E );
}

_id_876D()
{
    if ( isdefined( self._id_86FE ) )
    {
        wait 1.0;
        _id_8777( 1.0 );
    }

    var_0 = spawnstruct();
    var_0._id_6F21 = "mi17";
    soundscripts\_snd::_id_870C( "snd_start_vehicle", var_0 );
}

_id_8777( var_0 )
{
    if ( isdefined( self._id_86FE ) )
    {
        soundscripts\_snd::_id_870C( "snd_stop_vehicle", var_0 );
        self notify( "snd_stop_vehicle" );
    }
}

_id_870E()
{
    soundscripts\_audio_vehicle_manager::avm_begin_preset_def( "mi17" );
    soundscripts\_audio_vehicle_manager::avm_begin_loop_data();
    soundscripts\_audio_vehicle_manager::avm_begin_loop_def( "mi17_dist_towards_lp" );
    soundscripts\_audio_vehicle_manager::avm_begin_param_map( "speed" );
    soundscripts\_audio_vehicle_manager::avm_add_param_map_env( "volume", "mi17_dist_towards_vel2vol" );
    soundscripts\_audio_vehicle_manager::avm_add_param_map_env( "pitch", "mi17_dist_towards_vel2pch" );
    soundscripts\_audio_vehicle_manager::avm_end_param_map();
    soundscripts\_audio_vehicle_manager::avm_begin_param_map( "doppler", 0.65, 0.3 );
    soundscripts\_audio_vehicle_manager::avm_add_param_map_env( "pitch", "mi17_doppler2pch" );
    soundscripts\_audio_vehicle_manager::avm_end_param_map();
    soundscripts\_audio_vehicle_manager::avm_end_loop_def();
    soundscripts\_audio_vehicle_manager::avm_begin_loop_def( "mi17_close_towards_lp" );
    soundscripts\_audio_vehicle_manager::avm_begin_param_map( "speed" );
    soundscripts\_audio_vehicle_manager::avm_add_param_map_env( "volume", "mi17_close_towards_vel2vol" );
    soundscripts\_audio_vehicle_manager::avm_end_param_map();
    soundscripts\_audio_vehicle_manager::avm_begin_param_map( "doppler", 0.65, 0.3 );
    soundscripts\_audio_vehicle_manager::avm_add_param_map_env( "pitch", "mi17_doppler2pch" );
    soundscripts\_audio_vehicle_manager::avm_end_param_map();
    soundscripts\_audio_vehicle_manager::avm_end_loop_def();
    soundscripts\_audio_vehicle_manager::avm_end_loop_data();
    soundscripts\_audio_vehicle_manager::avm_begin_oneshot_data( 0.5 );
    soundscripts\_audio_vehicle_manager::avm_begin_oneshot_def( "mi17_by_windup", "mi17_windup_duck" );
    soundscripts\_audio_vehicle_manager::avm_begin_param_map( "speed" );
    soundscripts\_audio_vehicle_manager::avm_add_param_map_env( "volume", "mi17_by_windup_vel2vol" );
    soundscripts\_audio_vehicle_manager::avm_end_param_map();
    soundscripts\_audio_vehicle_manager::avm_end_oneshot_def();
    soundscripts\_audio_vehicle_manager::avm_begin_oneshot_def( "mi17_by_out", "mi17_flyby_duck_envelope" );
    soundscripts\_audio_vehicle_manager::avm_begin_param_map( "speed" );
    soundscripts\_audio_vehicle_manager::avm_add_param_map_env( "volume", "mi17_flyby_vel2vol" );
    soundscripts\_audio_vehicle_manager::avm_end_param_map();
    soundscripts\_audio_vehicle_manager::avm_end_oneshot_def();
    soundscripts\_audio_vehicle_manager::avm_end_oneshot_data();
    soundscripts\_audio_vehicle_manager::avm_begin_behavior_data();
    soundscripts\_audio_vehicle_manager::avm_begin_behavior_def( "to_state_hover", ::_id_5BF9, [ "speed", "distance2d" ] );
    soundscripts\_audio_vehicle_manager::avm_add_loops( "ALL" );
    soundscripts\_audio_vehicle_manager::avm_end_behavior_def();
    soundscripts\_audio_vehicle_manager::avm_begin_behavior_def( "to_state_fly", ::_id_5BF7, [ "speed", "distance2d" ] );
    soundscripts\_audio_vehicle_manager::avm_add_loops( "ALL" );
    soundscripts\_audio_vehicle_manager::avm_end_behavior_def();
    soundscripts\_audio_vehicle_manager::avm_begin_behavior_def( "to_state_fly_from_hover", ::_id_5BF7, [ "speed", "distance2d" ] );
    soundscripts\_audio_vehicle_manager::avm_add_loops( "ALL" );
    soundscripts\_audio_vehicle_manager::avm_add_oneshots( "mi17_by_windup" );
    soundscripts\_audio_vehicle_manager::avm_end_behavior_def();
    soundscripts\_audio_vehicle_manager::avm_begin_behavior_def( "to_state_distant", ::mi17_condition_callback_to_distant, [ "distance2d" ] );
    soundscripts\_audio_vehicle_manager::avm_add_loops( "mi17_dist_towards_lp" );
    soundscripts\_audio_vehicle_manager::avm_end_behavior_def();
    soundscripts\_audio_vehicle_manager::avm_begin_behavior_def( "to_state_flyby", ::_id_5BF8, [ "speed", "distance2d" ] );
    soundscripts\_audio_vehicle_manager::avm_add_loops( "ALL" );
    soundscripts\_audio_vehicle_manager::avm_add_oneshots( "mi17_by_out" );
    soundscripts\_audio_vehicle_manager::avm_end_behavior_def();
    soundscripts\_audio_vehicle_manager::avm_end_behavior_data();
    soundscripts\_audio_vehicle_manager::avm_begin_state_data( 0.25, 0.5 );
    soundscripts\_audio_vehicle_manager::avm_begin_state_group( "engine_oneshots", "state_fly", "to_state_fly", 50, 1.0 );
    soundscripts\_audio_vehicle_manager::avm_begin_state_def( "state_hover" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_fly", "to_state_fly_from_hover" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::avm_end_state_def();
    soundscripts\_audio_vehicle_manager::avm_begin_state_def( "state_distant" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_hover", "to_state_hover" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_fly", "to_state_fly" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::avm_end_state_def();
    soundscripts\_audio_vehicle_manager::avm_begin_state_def( "state_fly" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_hover", "to_state_hover" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_flyby", "to_state_flyby" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::avm_end_state_def();
    soundscripts\_audio_vehicle_manager::avm_begin_state_def( "state_flyby", 7.0 );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_hover", "to_state_hover" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_fly", "to_state_fly" );
    soundscripts\_audio_vehicle_manager::avm_add_state_transition( "state_distant", "to_state_distant" );
    soundscripts\_audio_vehicle_manager::avm_end_state_def();
    soundscripts\_audio_vehicle_manager::avm_end_state_group();
    soundscripts\_audio_vehicle_manager::avm_end_state_data();
    soundscripts\_audio_vehicle_manager::avm_add_envelope( "mi17_dist_towards_vel2vol", [ [ 0, 1.0 ], [ 10, 1.0 ], [ 150.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::avm_add_envelope( "mi17_close_towards_vel2vol", [ [ 0, 1.0 ], [ 20, 1.0 ], [ 150.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::avm_add_envelope( "mi17_dist_towards_vel2pch", [ [ 0, 0.9 ], [ 10, 1.0 ], [ 20, 1.05 ] ] );
    soundscripts\_audio_vehicle_manager::avm_add_envelope( "mi17_windup_duck", [ [ 0.0, 1.0 ], [ 0.25, 1.0 ], [ 0.3, 0.7 ], [ 0.7, 1.0 ], [ 1.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::avm_add_envelope( "mi17_by_windup_vel2vol", [ [ 0.0, 0.0 ], [ 3.0, 0.3 ], [ 5.0, 0.7 ], [ 8.0, 0.8 ], [ 150.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::avm_add_envelope( "mi17_flyby_duck_envelope", [ [ 0.0, 1.0 ], [ 0.15, 1.0 ], [ 0.3, 0.5 ], [ 0.5, 0.55 ], [ 0.6, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::avm_add_envelope( "mi17_flyby_vel2vol", [ [ 0.0, 0.0 ], [ 16.08, 0.0 ], [ 20.1, 0.5 ], [ 40.2, 0.8 ], [ 150.0, 1.0 ] ] );
    soundscripts\_audio_vehicle_manager::avm_add_envelope( "mi17_doppler2pch", [ [ 0.0, 0.0 ], [ 2.0, 2.0 ] ] );
    soundscripts\_audio_vehicle_manager::avm_end_preset_def();
}

_id_5BF9( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = soundscripts\_audio_vehicle_manager::_id_2B71( var_3 );

    if ( var_2 < 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

_id_5BF7( var_0, var_1 )
{
    var_2 = var_0["speed"];
    var_3 = var_0["distance2d"];
    var_4 = soundscripts\_audio_vehicle_manager::_id_2B71( var_3 );

    if ( var_2 >= 1.1 && var_4 < 3000 )
        return 1;

    return 0;
}

_id_5BF8( var_0, var_1 )
{
    var_2 = 0;
    var_3 = var_0["distance2d"];
    var_4 = soundscripts\_audio_vehicle_manager::_id_2B71( var_3 );
    var_5 = var_0["speed"];

    if ( !isdefined( var_1._id_391D ) )
    {
        var_1._id_391D = spawnstruct();
        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = 0;
    }
    else
    {
        var_6 = var_3 - var_1._id_391D._id_6F39;

        if ( var_6 < 0 && var_4 < 2500 && var_5 >= 20.1 )
            var_2 = 1;

        var_1._id_391D._id_6F39 = var_3;
        var_1._id_391D._id_6F3C = var_6;
    }

    return var_2;
}

mi17_condition_callback_to_distant( var_0, var_1 )
{
    var_2 = var_0["distance2d"];
    var_3 = soundscripts\_audio_vehicle_manager::_id_2B71( var_2 );

    if ( var_3 >= 3000 )
        return 1;

    return 0;
}
