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
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    maps\_vehicle::build_template( "truck", var_0, var_1, var_2 );
    maps\_vehicle::build_localinit( ::_id_4D10 );
    maps\_vehicle::build_deathmodel( "vehicle_pickup_roobars", "vehicle_pickup_technical_destroyed" );
    maps\_vehicle::build_deathmodel( "vehicle_pickup_4door", "vehicle_pickup_technical_destroyed" );
    maps\_vehicle::build_deathmodel( "vehicle_opfor_truck", "vehicle_pickup_technical_destroyed" );
    maps\_vehicle::build_deathmodel( "vehicle_pickup_technical", "vehicle_pickup_technical_destroyed" );
    maps\_vehicle::build_deathfx( "fx/explosions/small_vehicle_explosion", undefined, "car_explode", undefined, undefined, undefined, 0 );
    maps\_vehicle::build_deathfx( "fx/fire/firelp_small_pm_a", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 0 );
    maps\_vehicle::build_deathfx( "fx/fire/firelp_med_pm", "tag_fx_cab", "smallfire", undefined, undefined, 1, 0 );
    maps\_vehicle::build_deathfx( "fx/fire/firelp_small_pm_a", "tag_engine_left", "smallfire", undefined, undefined, 1, 0 );
    maps\_vehicle::build_drive( %technical_driving_idle_forward, %technical_driving_idle_backward, 10 );
    maps\_vehicle::build_treadfx();
    maps\_vehicle::build_life( 999, 500, 1500 );
    maps\_vehicle::build_team( "allies" );
    maps\_vehicle::build_aianims( ::_id_7F23, ::_id_7EFA );
    maps\_vehicle::build_unload_groups( ::_id_9A3D );
    maps\_vehicle::build_light( var_2, "headlight_truck_left", "tag_headlight_left", "fx/misc/car_headlight_truck_L", "headlights" );
    maps\_vehicle::build_light( var_2, "headlight_truck_right", "tag_headlight_right", "fx/misc/car_headlight_truck_R", "headlights" );
    maps\_vehicle::build_light( var_2, "parkinglight_truck_left_f", "tag_parkinglight_left_f", "fx/misc/car_parkinglight_truck_LF", "headlights" );
    maps\_vehicle::build_light( var_2, "parkinglight_truck_right_f", "tag_parkinglight_right_f", "fx/misc/car_parkinglight_truck_RF", "headlights" );
    maps\_vehicle::build_light( var_2, "taillight_truck_right", "tag_taillight_right", "fx/misc/car_taillight_truck_R", "headlights" );
    maps\_vehicle::build_light( var_2, "taillight_truck_left", "tag_taillight_left", "fx/misc/car_taillight_truck_L", "headlights" );
    maps\_vehicle::build_light( var_2, "brakelight_truck_right", "tag_taillight_right", "fx/misc/car_brakelight_truck_R", "brakelights" );
    maps\_vehicle::build_light( var_2, "brakelight_truck_left", "tag_taillight_left", "fx/misc/car_brakelight_truck_L", "brakelights" );
}

_id_4D10()
{

}

_id_7EFA( var_0 )
{
    var_0[0]._id_9CD5 = %door_pickup_driver_climb_out;
    var_0[1]._id_9CD5 = %door_pickup_passenger_climb_out;
    var_0[2]._id_9CD5 = %door_pickup_passenger_rr_climb_out;
    var_0[3]._id_9CD5 = %door_pickup_passenger_rl_climb_out;
    var_0[0]._id_9CD6 = 0;
    var_0[1]._id_9CD6 = 0;
    var_0[2]._id_9CD6 = 0;
    var_0[3]._id_9CD6 = 0;
    var_0[0]._id_9CD0 = %door_pickup_driver_climb_in;
    var_0[1]._id_9CD0 = %door_pickup_passenger_climb_in;
    return var_0;
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 4; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_passenger";
    var_0[2]._id_85AE = "tag_guy1";
    var_0[3]._id_85AE = "tag_guy0";
    var_0[0]._id_4B63 = %technical_driver_idle;
    var_0[1]._id_4B63 = %technical_passenger_idle;
    var_0[2]._id_4B63 = %pickup_passenger_rr_idle;
    var_0[3]._id_4B63 = %pickup_passenger_rl_idle;
    var_0[0]._id_4068 = %pickup_driver_climb_out;
    var_0[1]._id_4068 = %pickup_passenger_climb_out;
    var_0[2]._id_4068 = %pickup_passenger_rr_climb_out;
    var_0[3]._id_4068 = %pickup_passenger_rl_climb_out;
    var_0[0]._id_3FD2 = %pickup_driver_climb_in;
    var_0[1]._id_3FD2 = %pickup_passenger_climb_in;
    return var_0;
}

_id_9A3D()
{
    var_0 = [];
    var_0["passengers"] = [];
    var_0["all"] = [];
    var_1 = "passengers";
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_0[var_1][var_0[var_1].size] = 3;
    var_1 = "all";
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_0[var_1][var_0[var_1].size] = 3;
    var_0["default"] = var_0["all"];
    return var_0;
}
