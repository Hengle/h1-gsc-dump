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
    level._effect["fog_villassault"] = loadfx( "fx/weather/fog_villassault" );
    level._effect["fog_villassault_thick"] = loadfx( "fx/weather/fog_villassault_thick" );
    level._effect["firelp_med_pm"] = loadfx( "fx/fire/firelp_med_pm" );
    level._effect["fire_med_nosmoke"] = loadfx( "fx/fire/ground_fire_med_nosmoke" );
    level._effect["fire_sm_trail"] = loadfx( "fx/props/barrel_fire" );
    level._effect["headlights"] = loadfx( "fx/misc/lighthaze" );
    level._effect["lighthaze_villassault"] = loadfx( "fx/misc/lighthaze_villassault" );
    level._effect["firelp_small_streak_pm_v"] = loadfx( "vfx/map/village_assault/va_small_streak_pm_v" );
    level._effect["firelp_small_streak_pm_h"] = loadfx( "vfx/map/village_assault/va_small_streak_pm_h" );
    level._effect["firelp_small_streak_pm1_h"] = loadfx( "fx/fire/firelp_small_streak_pm1_h" );
    level._effect["firelp_med_streak_pm_h"] = loadfx( "fx/fire/firelp_med_streak_pm_h" );
    level._effect["firelp_large_pm"] = loadfx( "vfx/map/village_assault/va_firelp_large_pm" );
    level._effect["embers_burst_runner"] = loadfx( "fx/fire/embers_burst_runner" );
    level._effect["emb_burst_a"] = loadfx( "fx/fire/emb_burst_a" );
    level._effect["emb_burst_b"] = loadfx( "fx/fire/emb_burst_b" );
    level._effect["emb_burst_c"] = loadfx( "fx/fire/emb_burst_c" );
    level._effect["fire_fallingdebris"] = loadfx( "fx/fire/fire_fallingdebris" );
    level._effect["fire_fallingdebris_a"] = loadfx( "fx/fire/fire_fallingdebris_a" );
    level._effect["fire_debris_child"] = loadfx( "fx/fire/fire_debris_child" );
    level._effect["fire_debris_child_a"] = loadfx( "fx/fire/fire_debris_child_a" );
    level._effect["leaves_va"] = loadfx( "fx/misc/leaves_va" );
    level._effect["moth_a"] = loadfx( "fx/misc/moth_a" );
    level._effect["moth"] = loadfx( "fx/misc/moth" );
    level._effect["insect_trail_a"] = loadfx( "fx/misc/insect_trail_a" );
    level._effect["insect_trail_b"] = loadfx( "fx/misc/insect_trail_b" );
    level._effect["insect_trail_runner"] = loadfx( "fx/misc/insect_trail_runner" );
    level._effect["village_ash"] = loadfx( "vfx/map/village_assault/va_ash" );
    level._id_3891["mi28"] = loadfx( "fx/misc/flares_cobra" );
    level._effect["ffar_mi28_muzzleflash"] = loadfx( "fx/muzzleflashes/cobra_rocket_flash_wv" );
    level._effect["alasad_flash"] = loadfx( "vfx/map/village_assault/village_assault_flash_bang" );
    level._effect["headshot"] = loadfx( "fx/impacts/flesh_hit_head_fatal_exit" );
    level._effect["va_punch_01"] = loadfx( "vfx/map/village_assault/va_punch_01" );
    level._effect["va_punch_02"] = loadfx( "vfx/map/village_assault/va_punch_02" );
    level._effect["va_punch_03"] = loadfx( "vfx/map/village_assault/va_punch_03" );
    level._effect["va_punch_04"] = loadfx( "vfx/map/village_assault/va_punch_04" );
    level._effect["va_punch_05"] = loadfx( "vfx/map/village_assault/va_punch_05" );
    level._effect["va_pistol_whip"] = loadfx( "vfx/map/village_assault/va_pistol_whip" );
    level._effect["va_headshot"] = loadfx( "vfx/map/village_assault/va_headshot" );
    level._effect["flashlight"] = loadfx( "vfx/map/village_assault/va_flashlight_spotlight" );
    level._effect["va_flashlight_dust_motes"] = loadfx( "vfx/map/village_assault/va_flashlight_dust_motes" );
    level._effect["va_street_lights"] = loadfx( "vfx/map/village_assault/va_street_lights" );
    level._effect["village_assault_lamp_post_lights"] = loadfx( "vfx/map/village_assault/village_assault_lamp_post_lights" );
    level._effect["ripple_flow_distortion_single"] = loadfx( "vfx/water/ripple_flow_distortion_single" );
    level._effect["water_current_turbulence_01"] = loadfx( "vfx/water/water_current_turbulence_01" );
    level._effect["water_splash_base_sm_night"] = loadfx( "vfx/water/water_splash_base_sm_night" );
    level._effect["light_red_tower_blinking_vista_sm"] = loadfx( "vfx/lights/light_red_tower_blinking_vista_sm" );
    level._effect["leaves_night_a"] = loadfx( "fx/misc/leaves_night_a" );
    level._effect["moth_runner_night"] = loadfx( "fx/misc/moth_runner_night" );
    level._effect["electrical_spark_loop_night"] = loadfx( "vfx/sparks/electrical_spark_loop_night" );
    level._effect["sprite_light_fire_flicker_alone"] = loadfx( "fx/fire/sprite_light_fire_flicker_alone" );
    level._effect["village_assault_heli_smolder_night"] = loadfx( "vfx/map/village_assault/village_assault_heli_smolder_night" );
    level._effect["ripple_flow_distortion_single_med_fast"] = loadfx( "vfx/water/ripple_flow_distortion_single_med_fast" );
    level._effect["ripple_flow_distortion_strip_no_geo_fast"] = loadfx( "vfx/water/ripple_flow_distortion_strip_no_geo_fast" );
    level._effect["ripple_flow_distortion_strip_heavy_foam"] = loadfx( "vfx/water/ripple_flow_distortion_strip_heavy_foam" );
    level._effect["fire_wood_beam_flare_ups_med"] = loadfx( "fx/fire/fire_wood_beam_flare_ups_med" );
    level._effect["fire_wood_beam_flare_ups_verticle"] = loadfx( "vfx/map/village_assault/va_flare_ups_verticle" );
    level._effect["village_assault_house_fire"] = loadfx( "vfx/map/village_assault/village_assault_house_fire" );
    level._effect["village_assault_fire_card"] = loadfx( "vfx/map/village_assault/village_assault_fire_card" );
    level._effect["water_drip"] = loadfx( "vfx/water/falling_drip_ceil_village_defend" );
    level._effect["water_trickle"] = loadfx( "vfx/water/falling_pipe_water_trickle_straight_continue" );
    level._effect["splash_up"] = loadfx( "vfx/map/village_assault/va_splash_up" );
    level._effect["village_defend_pond ripples"] = loadfx( "vfx/map/village_defend/village_defend_pond_ripples" );
    level._effect["shower_spray"] = loadfx( "vfx/map/village_assault/va_shower_spray" );
    level._effect["rain_noise"] = loadfx( "fx/weather/rain_noise" );
    level._effect["rain_noise_ud"] = loadfx( "fx/weather/rain_noise_ud" );
    level._effect["va_sign"] = loadfx( "vfx/map/village_assault/va_sign" );
    level._effect["va_water_drops_lens_flare"] = loadfx( "vfx/map/village_assault/va_water_drops_lens_flare" );
    level._effect["village_assault_heli_fire"] = loadfx( "vfx/map/village_assault/village_assault_heli_fire" );
    level._effect["va_house_fire_flare"] = loadfx( "vfx/map/village_assault/va_house_fire_flare" );
    level._effect["village_fog_vista_night"] = loadfx( "vfx/map/village_assault/va_fog_vista_night" );
    level._effect["village_fog_vista_lrg_night"] = loadfx( "vfx/map/village_assault/va_fog_vista_lrg_night" );
    level._effect["village_morning_fog_04_night"] = loadfx( "fx/smoke/village_morning_fog_04_night" );
    level._effect["village_morning_fog_06_night"] = loadfx( "fx/smoke/village_morning_fog_06_night" );
    level._effect["village_fog_vista_near_fade_night"] = loadfx( "vfx/fog/village_fog_vista_near_fade_night" );
    level._effect["village_smolder_night"] = loadfx( "fx/smoke/village_smolder_night" );
    level._effect["village_assault_vista_smoke_stacks"] = loadfx( "vfx/map/village_assault/village_assault_vista_smoke_stacks" );
    level._effect["waterfall_splash_base_sm_night"] = loadfx( "vfx/water/waterfall_splash_base_sm_night" );
    _id_A5A8::swap_deathfx_effect_only( "script_vehicle_bmp_woodland", "fx/explosions/vehicle_explosion_bmp_fire", "tag_deathfx", "fx/fire/h1_fire_tank_wreck_lg_night" );
    _id_A5A8::swap_deathfx_effect_only( "script_vehicle_bmp_woodland", "fx/misc/empty", "tag_cargofire", "fx/explosions/small_vehicle_explosion_village_assault" );
    _id_A5A8::swap_deathfx_effect_only( "script_vehicle_bmp_woodland", "fx/explosions/vehicle_explosion_bmp", "tag_deathfx", "fx/explosions/vehicle_explosion_bmp_va" );
    level.destructible_effect_override["fx/explosions/small_vehicle_explosion"] = "fx/explosions/small_vehicle_explosion_night";
    level.destructible_effect_override["fx/smoke/car_damage_whitesmoke"] = "fx/smoke/car_damage_whitesmoke_night";
    level.destructible_effect_override["fx/smoke/car_damage_blacksmoke"] = "fx/smoke/car_damage_blacksmoke_night";
    level.destructible_effect_override["fx/smoke/car_damage_blacksmoke_fire"] = "fx/smoke/car_damage_blacksmoke_fire_night";
    level.destructible_effect_override["fx/props/car_glass_large"] = "fx/props/car_glass_large_night";
    level.destructible_effect_override["fx/props/car_glass_med"] = "fx/props/car_glass_med_night";
    level.destructible_effect_override["fx/props/car_glass_headlight"] = "fx/props/car_glass_headlight_night";
    level.destructible_effect_override["fx/props/car_glass_brakelight"] = "fx/props/car_glass_brakelight_night";
    animscripts\utility::_id_7F74( "asphalt", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "brick", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "carpet", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "cloth", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "concrete", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "dirt", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "foliage", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "grass", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "mud", loadfx( "fx/impacts/footstep_mud_dark" ) );
    animscripts\utility::_id_7F74( "rock", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "sand", loadfx( "fx/impacts/footstep_dust_dark" ) );
    animscripts\utility::_id_7F74( "water", loadfx( "fx/impacts/footstep_water_dark" ) );
    animscripts\utility::_id_7F74( "wood", loadfx( "fx/impacts/footstep_dust_dark" ) );
    _id_974C();
    globalfx_override();
    maps\createfx\village_assault_fx::main();
    maps\createfx\village_assault_sound::main();
}

globalfx_override()
{
    _id_A538::override_global_fx( "ch_street_light_01_on", "vfx/map/village_assault/village_assault_lamp_post_lights", undefined, "village_assault_lamp_post_lights" );
    _id_A538::override_global_fx( "me_streetlight_01_FX_origin", "vfx/map/village_assault/village_assault_street_lights", undefined, "village_assault_street_lights" );
}

_id_974C()
{
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "brick", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "bark", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "carpet", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "cloth", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "concrete", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "dirt", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "flesh", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "foliage", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "glass", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "grass", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "gravel", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "ice", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "mud", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "paper", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "plaster", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "road", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "rock", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "sand", "fx/treadfx/tread_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "snow", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "water", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "wood", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "asphalt", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "ceramic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "plastic", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "rubber", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "cushion", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "fruit", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "painted metal", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "default", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_bmp_woodland", "none", "fx/treadfx/tread_road_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "brick", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "bark", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "carpet", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "cloth", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "concrete", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "dirt", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "flesh", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "foliage", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "glass", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "grass", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "gravel", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "ice", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "metal", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "mud", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "paper", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "plaster", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "rock", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "sand", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "snow", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "wood", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "asphalt", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "ceramic", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "plastic", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "rubber", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "cushion", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "fruit", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "painted metal", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "default", "fx/treadfx/heli_dust_hunted" );
    _id_A59D::_id_8350( "script_vehicle_mi28_flying", "none", "fx/treadfx/heli_dust_hunted" );
}
