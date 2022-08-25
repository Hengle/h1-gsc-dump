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
    level._effect["at4_flash_airlift"] = loadfx( "fx/muzzleflashes/at4_flash_airlift" );
    level._effect["heli_dust_camera_dirt"] = loadfx( "fx/treadfx/heli_dust_camera_dirt" );
    level._effect["godray_window_small_side_airlift"] = loadfx( "vfx/map/airlift/godray_window_small_side_airlift" );
    level._effect["airlift_sign_explosion"] = loadfx( "vfx/explosion/airlift_sign_explosion" );
    thread bmp_deathfx_override();
    thread mi17_deathfx_override();
    level.plane_bomb_explosion_overrides["plane_bomb_explosion1"] = loadfx( "fx/explosions/explosion_large_airlift" );
    maps\_vehicle::build_deathfx_override( "script_vehicle_t72_tank", "t72", "vehicle_t72_tank", "fx/explosions/grenade_flash", "tag_origin", "h1_exp_armor_vehicle" );
    level.airstrikefx = loadfx( "fx/explosions/clusterbomb" );
    level._effect["airlift_mig_crash_explosion"] = loadfx( "vfx/explosion/airlift_mig_crash_explosion" );
    level._effect["barrel_destruct_airlift"] = loadfx( "vfx/explosion/barrel_destruct_airlift" );
    level._effect["vehicle_mi17_smoke_crashing_runner_airlift"] = loadfx( "vfx/explosion/vehicle_mi17_smoke_crashing_runner_airlift" );
    level._effect["vehicle_mi17_aerial_second_explosion_airlift"] = loadfx( "vfx/explosion/vehicle_mi17_aerial_second_explosion_airlift" );
    level._effect["tanker_fire"] = loadfx( "vfx/fire/airlift_tanker_fire" );
    level._effect["airlift_refinery_lights"] = loadfx( "vfx/map/airlift/airlift_refinery_lights" );
    level._effect["antiair_runner"] = loadfx( "fx/misc/antiair_runner_night" );
    level._effect["floating_room_dust_02"] = loadfx( "fx/misc/floating_room_dust_03_airlift" );
    level._effect["armada_windows_rays"] = loadfx( "vfx/lights/armada_windows_rays" );
    level._effect["airlift_window_vl_xsml_child_big_thick"] = loadfx( "fx/misc/airlift_window_vl_xsml_child_big_thick" );
    level._effect["godray_window_small_airlift"] = loadfx( "vfx/map/airlift/godray_window_small_airlift" );
    level._effect["airlift_lamp_post_lights"] = loadfx( "vfx/map/airlift/airlift_lamp_post_lights" );
    level._effect["large_godray_screen_airlift"] = loadfx( "vfx/lights/airlift/large_godray_screen_airlift" );
    level._effect["cobra_crash_ash_falling"] = loadfx( "vfx/map/airlift/cobra_crash_ash_falling" );
    level._effect["cobra_crash_smoke_dark"] = loadfx( "vfx/map/airlift/cobra_crash_smoke_dark" );
    level._effect["cobra_crash_ground_fog"] = loadfx( "fx/weather/cobra_crash_ground_fog" );
    level._effect["cobra_crash_cloud_bank"] = loadfx( "vfx/map/airlift/cobra_crash_cloud_bank" );
    level._effect["airlift_fire_vista"] = loadfx( "vfx/fire/airlift_fire_vista" );
    level._effect["seaknight_m203_turret_airlift_flash"] = loadfx( "vfx/muzzleflash/seaknight_m203_turret_airlift_flash" );
    level._effect["smoke_window_slow_fb_sm_airlift"] = loadfx( "vfx/smoke/smoke_window_slow_fb_sm_airlift" );
    level._effect["no_fx"] = loadfx( "vfx/unique/no_fx" );
    level._effect["cap_water_leak_hose"] = loadfx( "vfx/map/captured/cap_water_leak_hose" );
    level._effect["water_pipe_leak_interior_loop_airlift"] = loadfx( "vfx/water/water_pipe_leak_interior_loop_airlift" );
    level._effect["cobra_rocket_flash_wv_airlift"] = loadfx( "fx/muzzleflashes/cobra_rocket_flash_wv_airlift" );
    level._effect["crane_ground_shockwave"] = loadfx( "vfx/map/airlift/crane_ground_shockwave" );
    level._effect["mk19_seaknight_overheat_airlift"] = loadfx( "vfx/distortion/mk19_seaknight_overheat_airlift" );
    level._effect["fx_sunflare_airlift"] = loadfx( "vfx/lensflare/fx_sunflare_airlift" );
    level._effect["airlift_refinery_lights_pulsing"] = loadfx( "vfx/map/airlift/airlift_refinery_lights_pulsing" );
    level._effect["airlift_refinery_lights_small"] = loadfx( "vfx/map/airlift/airlift_refinery_lights_small" );
    level._effect["lensflare_floodlight_on_airlift"] = loadfx( "vfx/lights/lensflare_floodlight_on_airlift" );
    level._effect["water_drips_armada_ripples"] = loadfx( "vfx/rain/water_drips_armada_ripples" );
    level._effect["electrical_spark_loop"] = loadfx( "vfx/sparks/electrical_spark_loop" );
    level._effect["airlift_sparks_runner"] = loadfx( "fx/explosions/airlift_sparks_runner" );
    level._effect["ash_falling"] = loadfx( "fx/misc/ash_falling_airlift" );
    level._effect["light_wind_sand_airlift_a"] = loadfx( "vfx/map/airlift/light_wind_sand_airlift_a" );
    level._effect["smk_stacks_lp_lrg_a_nofog_airlift"] = loadfx( "vfx/map/airlift/smk_stacks_lp_lrg_a_nofog_airlift" );
    level._effect["cloud_bank_cloud_filler_light_airlift"] = loadfx( "vfx/map/airlift/cloud_bank_cloud_filler_light_airlift" );
    level._effect["smk_stacks_lp_lrg_a_nofog_z_airlift"] = loadfx( "vfx/map/airlift/smk_stacks_lp_lrg_a_nofog_z_airlift" );
    level._effect["ambient_cloud_fog_area_local_airlift"] = loadfx( "vfx/map/airlift/ambient_cloud_fog_area_local_airlift" );
    level._effect["ambient_cloud_fog_area_local_close_airlift"] = loadfx( "vfx/map/airlift/ambient_cloud_fog_area_local_close_airlift" );
    level._effect["ambient_cloud_fog_area_smktown_airlift"] = loadfx( "vfx/map/airlift/ambient_cloud_fog_area_smktown_airlift" );
    level._effect["fire_palm_large"] = loadfx( "vfx/fire/fire_palm_large_airlift" );
    level._effect["statue_ground_impact"] = loadfx( "fx/explosions/statue_ground_impact" );
    level._effect["statue_pedestal_explosion"] = loadfx( "fx/explosions/statue_pedestal_explosion" );
    level._effect["tread_mud_airlift"] = loadfx( "vfx/treadfx/tread_mud_airlift" );
    level._effect["thin_black_smoke_airlift"] = loadfx( "fx/smoke/thin_black_smoke_airlift" );
    level._effect["thin_black_smoke_emissive_pass_airlift"] = loadfx( "fx/smoke/thin_black_smoke_emissive_pass_airlift" );
    level._effect["statue_ground_shockwave"] = loadfx( "vfx/map/airlift/statue_ground_shockwave" );
    level._effect["dust_explo_wisp_small"] = loadfx( "vfx/dust/dust_explo_wisp_small" );
    level._effect["statue_explosion"] = loadfx( "vfx/map/airlift/statue_explosion" );
    level._effect["statue_impact"] = loadfx( "fx/explosions/statue_ground_impact" );
    level._effect["statue_smoke"] = loadfx( "fx/smoke/thin_light_smoke_S" );
    level._effect["light_godray_dawn_a"] = loadfx( "vfx/lights/light_godray_dawn_a" );
    level._effect["light_godray_dawn_b"] = loadfx( "vfx/lights/light_godray_dawn_b" );
    level._effect["paper_sheet_01_blowing_airlift"] = loadfx( "vfx/wind/paper_sheet_01_blowing_airlift" );
    level._effect["insects_flies_wall"] = loadfx( "vfx/animal/insects_flies_wall" );
    level._effect["paper_sheet_01_blowing"] = loadfx( "vfx/wind/paper_sheet_01_blowing" );
    level._effect["amb_dust_wind_01"] = loadfx( "vfx/dust/amb_dust_wind_01" );
    level._effect["dust_wind_blowing_fast_ledge_airlift"] = loadfx( "vfx/dust/dust_wind_blowing_fast_ledge_airlift" );
    level._effect["battlefield_smoke_m_slow_airlift"] = loadfx( "vfx/smoke/dlc/battlefield_smoke_m_slow_airlift" );
    level._effect["ash_falling_smoketown"] = loadfx( "vfx/ash/ash_falling_smoketown" );
    level._effect["cobra_rescue_light"] = loadfx( "vfx/lights/airlift/cobra_rescue_light" );
    level._effect["00_particle_shadow_static_lrg_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_d_airlift" );
    level._effect["00_particle_shadow_static_med_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_d_airlift" );
    level._effect["00_particle_shadow_static_sm_d"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_d_airlift" );
    level._effect["00_particle_shadow_static_lrg_c"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_c_airlift" );
    level._effect["00_particle_shadow_static_med_c"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_c_airlift" );
    level._effect["00_particle_shadow_static_sm_c"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_c_airlift" );
    level._effect["00_particle_shadow_static_lrg_b"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_b_airlift" );
    level._effect["00_particle_shadow_static_med_b"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_b_airlift" );
    level._effect["00_particle_shadow_static_sm_b"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_b_airlift" );
    level._effect["00_particle_shadow_animated_lrg_c"] = loadfx( "vfx/cloud/00_particle_shadow_animated_lrg_c_airlift" );
    level._effect["00_particle_shadow_static_lrg_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_lrg_e_airlift" );
    level._effect["00_particle_shadow_static_med_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_med_e_airlift" );
    level._effect["00_particle_shadow_static_sm_e"] = loadfx( "vfx/cloud/00_particle_shadow_static_sm_e_airlift" );
    level._effect["battlefield_smokebank_S"] = loadfx( "fx/smoke/battlefield_smokebank_bog_a" );
    level._effect["thin_black_smoke_M"] = loadfx( "fx/smoke/thin_black_smoke_M" );
    level._effect["thin_black_smoke_L"] = loadfx( "fx/smoke/thin_black_smoke_L" );
    level._effect["thin_light_smoke_S"] = loadfx( "fx/smoke/thin_light_smoke_S" );
    level._effect["thin_light_smoke_M"] = loadfx( "fx/smoke/thin_light_smoke_M" );
    level._effect["thin_light_smoke_L"] = loadfx( "fx/smoke/thin_light_smoke_L" );
    level._effect["heli_aerial_explosion"] = loadfx( "fx/explosions/aerial_explosion" );
    level._effect["heli_aerial_explosion_large"] = loadfx( "fx/explosions/aerial_explosion_large_airlift" );
    level._effect["tanker_explosion_airlift"] = loadfx( "fx/explosions/tanker_explosion_airlift" );
    level._effect["dual_propane_tank_explosion_airlift"] = loadfx( "vfx/map/airlift/dual_propane_tank_explosion_airlift" );
    level._effect["propane_tank_explosion_airlift"] = loadfx( "vfx/map/airlift/propane_tank_explosion_airlift" );
    level._effect["fire_dumpster"] = loadfx( "vfx/fire/dumpster_fire_mwr_airlift" );
    level._effect["tire_fire_med"] = loadfx( "fx/fire/tire_fire_med" );
    level._effect["firelp_large_pm"] = loadfx( "fx/fire/firelp_large_pm" );
    level._effect["firelp_barrel_pm_no_light"] = loadfx( "fx/fire/firelp_barrel_pm_no_light" );
    level._effect["firelp_small_dl_a"] = loadfx( "fx/fire/firelp_small_dl_a" );
    level._effect["firelp_small_dl_b"] = loadfx( "fx/fire/firelp_small_dl_b" );
    level._effect["firelp_small_dl_c"] = loadfx( "fx/fire/firelp_small_dl_c" );
    level._effect["firelp_small_dl_d"] = loadfx( "fx/fire/firelp_small_dl_d" );
    level._effect["firelp_vhc_lrg_pm_farview"] = loadfx( "fx/fire/firelp_vhc_lrg_pm_farview" );
    level._effect["oil_field_fire"] = loadfx( "fx/fire/oil_field_fire" );
    level._effect["airlift_crash_fire"] = loadfx( "vfx/fire/airlift_crash_fire" );
    level._effect["airlift_fire_staged"] = loadfx( "vfx/fire/airlift_fire_staged" );
    level._effect["airlift_fire_hold_1"] = loadfx( "vfx/fire/airlift_fire_hold_1" );
    level._effect["airlift_fire_hold_2"] = loadfx( "vfx/fire/airlift_fire_hold_2" );
    level._effect["airlift_fire_hold_3"] = loadfx( "vfx/fire/airlift_fire_hold_3" );
    level._effect["fire_building_airlift"] = loadfx( "vfx/fire/fire_building_airlift" );
    level._effect["fire_crawl_airlift"] = loadfx( "vfx/fire/fire_crawl_airlift" );
    level._effect["small_wide_fire_airlift"] = loadfx( "vfx/fire/small_wide_fire_airlift" );
    level._effect["fire_small_airlift"] = loadfx( "vfx/fire/fire_small_airlift" );
    level._effect["vehicle_explosion_bmp_airlift"] = loadfx( "fx/explosions/vehicle_explosion_bmp_airlift" );
    level._effect["fire_tank_wreck_lg_airlift"] = loadfx( "fx/fire/fire_tank_wreck_lg_airlift" );
    level._effect["dust_wind_slow"] = loadfx( "fx/dust/dust_wind_slow_yel_loop" );
    level._effect["smoke_oilfire_01"] = loadfx( "fx/smoke/tunnel_smoke_bog_a" );
    level._effect["smoke_oilfire_02"] = loadfx( "fx/smoke/tunnel_smoke_bog_a" );
    level._effect["dust_falling_ceiling_light_runner"] = loadfx( "vfx/dust/dust_falling_ceiling_light_runner" );
    level._effect["ambient_particles"] = loadfx( "vfx/dust/ambient_particles_airlift" );
    level._effect["ambient_foliage_runner_airlift"] = loadfx( "vfx/map/airlift/ambient_foliage_runner_airlift" );
    level._effect["ambient_foliage_a"] = loadfx( "vfx/wind/ambient_foliage_a" );
    level._effect["dust_ambient_street_blowing_airlift"] = loadfx( "vfx/map/airlift/dust_ambient_street_blowing_airlift" );
    level._effect["scaffold_ground_shockwave_large"] = loadfx( "vfx/map/airlift/scaffold_ground_shockwave_large" );
    level._effect["scaffold_ground_shockwave_small"] = loadfx( "vfx/map/airlift/scaffold_ground_shockwave_small" );
    level._effect["gas_station_explosion"] = loadfx( "vfx/explosion/gaz_station_explosion_airlift" );
    level._effect["green_car_explosion"] = loadfx( "fx/explosions/small_vehicle_explosion_airlift" );
    level._effect["green_car_explosion2"] = loadfx( "fx/explosions/small_vehicle_explosion_airlift" );
    level._effect["after_tanker_explosion_ambient"] = loadfx( "vfx/map/airlift/after_tanker_explosion_ambient" );
    level._effect["cobra_crash_01"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
    level._effect["cobra_crash_03"] = loadfx( "fx/explosions/large_vehicle_explosion" );
    level._effect["cobra_crash_end"] = loadfx( "fx/explosions/large_vehicle_explosion" );
    level._effect["cobra_crash_path_explosion_01"] = loadfx( "fx/explosions/cobra_crash_residual_explosion" );
    level._effect["cobra_crash_path_explosion_02"] = loadfx( "fx/explosions/clusterbomb" );
    level._effect["cobra_crash_path_explosion_03"] = loadfx( "fx/explosions/clusterbomb_exp" );
    level._effect["cobra_crash_path_explosion_04"] = loadfx( "fx/explosions/exp_pack_hallway" );
    level._effect["cobra_crash_path_explosion_05"] = loadfx( "fx/explosions/fuel_med_explosion" );
    level._effect["cobra_crash_path_explosion_06"] = loadfx( "fx/explosions/concussion_grenade" );
    level._effect["nuke_explosion"] = loadfx( "fx/explosions/nuke_explosion" );
    level._effect["nuke_flash"] = loadfx( "fx/explosions/nuke_flash" );
    level._effect["nuke_dirt_shockwave"] = loadfx( "fx/explosions/nuke_dirt_shockwave" );
    level._effect["nuke_smoke_fill"] = loadfx( "fx/explosions/nuke_smoke_fill" );
    level._effect["foliage_tree_dust_nuke"] = loadfx( "vfx/foliage/foliage_tree_dust_nuke" );
    level._effect["foliage_tree_dust_nuke_2"] = loadfx( "vfx/foliage/foliage_tree_dust_nuke_2" );
    level._effect["nuke_building_smoke_impact"] = loadfx( "vfx/smoke/nuke_building_smoke_impact" );
    level._effect["nuke_initial_shockwave"] = loadfx( "fx/explosions/nuke_initial_shockwave" );
    level._effect["airlift_nuke_dirt_helico"] = loadfx( "vfx/map/airlift/airlift_nuke_dirt_helico" );
    level._effect["building_collapse_nuke"] = loadfx( "fx/dust/building_collapse_nuke" );
    level._effect["nuked_chopper_smoke_trail"] = loadfx( "fx/fire/fire_smoke_trail_L" );
    level._effect["nuked_chopper_explosion"] = loadfx( "fx/explosions/aerial_explosion" );
    level._effect["turret_overheat_haze"] = loadfx( "fx/distortion/abrams_exhaust" );
    level._effect["turret_overheat_smoke"] = loadfx( "vfx/smoke/m19_overheat" );
    level._effect["smoke_green_signal"] = loadfx( "fx/smoke/signal_smoke_green" );
    level._effect["heat_shimmer_door"] = loadfx( "fx/distortion/abrams_exhaust" );
    level._effect["headshot"] = loadfx( "fx/impacts/flesh_hit_head_fatal_exit" );
    level._effect["heli_dust_default"] = loadfx( "fx/treadfx/heli_dust_airlift" );
    level._effect["palace_at4"] = loadfx( "fx/explosions/wall_explosion_pm_b_airlift" );
    level._vehicle_effect["tankcrush"]["window_med"] = loadfx( "fx/props/car_glass_med_tankcrush_no_exp" );
    level._vehicle_effect["tankcrush"]["window_large"] = loadfx( "vfx/unique/no_fx" );
    level._effect["mortar"]["dirt_large"] = loadfx( "fx/explosions/artilleryExp_dirt_brown_2" );
    level._effect["mortar"]["dirt"] = loadfx( "fx/explosions/grenadeExp_dirt" );
    level._effect["mortar"]["mud"] = loadfx( "fx/explosions/grenadeExp_mud" );
    level._effect["mortar"]["water"] = loadfx( "fx/explosions/grenadeExp_water" );
    level._effect["mortar"]["concrete"] = loadfx( "fx/explosions/grenadeExp_concrete" );
    level._effect["smoke_geotrail_javelin_airlift"] = loadfx( "fx/smoke/smoke_geotrail_javelin_airlift" );
    level._effect["smoke_trail_l_airlift"] = loadfx( "fx/fire/smoke_trail_l_airlift" );
    level._effect["fire_trail_l_airlift"] = loadfx( "fx/fire/fire_trail_l_airlift" );
    level._effect["cobra_crash_rocket_impact"] = loadfx( "fx/explosions/cobra_crash_rocket_impact" );
    level._effect["cobra_fire_exhaust"] = loadfx( "fx/fire/cobra_fire_exhaust" );
    level._effect["cobra_fire_burst_exhaust"] = loadfx( "fx/fire/cobra_fire_burst_exhaust" );
    level._effect["helicopter_rotor_damaged_fire_airlift"] = loadfx( "vfx/fire/helicopter_rotor_damaged_fire_airlift" );
    level._effect["cobra_crash_site_explosion"] = loadfx( "vfx/map/airlift/cobra_crash_site_explosion" );
    level._effect["cobra_hitting_first_roof"] = loadfx( "vfx/map/airlift/cobra_hitting_first_roof" );
    level._id_78BA["exploder"]["100"] = "explo_rock";
    level._id_78BA["exploder"]["150"] = "building_explosion2";
    level._id_78BA["exploder"]["151"] = "building_explosion2";
    level._id_78BA["exploder"]["152"] = "building_explosion2";
    level._id_78BA["exploder"]["153"] = "building_explosion2";
    level._id_78BA["exploder"]["154"] = "building_explosion2";
    level._id_78BA["exploder"]["155"] = "building_explosion2";
    level._id_78BA["exploder"]["156"] = "building_explosion2";
    level._id_78BA["exploder"]["157"] = "building_explosion2";
    level._id_78BA["exploder"]["158"] = "building_explosion2";
    level._id_78BA["exploder"]["159"] = "building_explosion2";
    level._id_78BA["exploder"]["160"] = "building_explosion2";
    level._id_78BA["exploder"]["161"] = "building_explosion2";
    level._id_78BA["exploder"]["162"] = "building_explosion2";
    level._id_78BA["exploder"]["163"] = "building_explosion2";
    level._id_78BA["exploder"]["164"] = "building_explosion2";
    level._id_78BA["exploder"]["165"] = "building_explosion2";
    level._id_78BA["exploder"]["166"] = "building_explosion2";
    level._id_78BA["exploder"]["167"] = "building_explosion2";
    level._id_78BA["exploder"]["500"] = "building_explosion3";
    level._id_78BA["exploder"]["600"] = "ffar_impact_armor_vehicle";
    level._id_78BA["exploder"]["700"] = "building_explosion2";
    level._id_78BA["exploder"]["800"] = "scn_airlift_cobra_exp4";
    level._id_78BA["exploder"]["1000"] = "car_explode";
    level._id_78BA["statue_fall"] = "ceiling_collapse";
    level._id_78BA["statue_impact"] = "ceiling_collapse";
    level._id_78BA["mortar"]["incomming"] = "fast_artillery_round";
    level._id_78BA["mortar"]["dirt_large"] = "airstrike_explosion";
    level._id_78BA["mortar"]["dirt"] = "mortar_explosion_dirt";
    level._id_78BA["mortar"]["mud"] = "mortar_explosion_water";
    level._id_78BA["mortar"]["water"] = "mortar_explosion_water";
    level._id_78BA["mortar"]["concrete"] = "mortar_explosion_dirt";
    _id_974C();
    globalfx_override();
    destructiblefx_overide();
    maps\createfx\airlift_fx::main();
    maps\createfx\airlift_sound::main();
    var_0 = getentarray( "oil_well_on_fire", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] spawnoilwellsonfire();
}

_id_974C()
{
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "brick", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "bark", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "carpet", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "cloth", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "concrete", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "dirt", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "flesh", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "foliage", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "glass", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "grass", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "gravel", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "ice", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "metal", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "mud", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "paper", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "plaster", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "rock", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "sand", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "snow", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "water", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "wood", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "asphalt", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "ceramic", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "plastic", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "rubber", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "cushion", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "fruit", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "painted metal", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "default", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_ch46e_airlift", "none", "fx/treadfx/heli_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "asphalt", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "brick", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "bark", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "carpet", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "cloth", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "concrete", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "dirt", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "flesh", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "foliage", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "glass", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "grass", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "gravel", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "ice", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "metal", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "mud", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "paper", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "plaster", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "rock", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "sand", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "snow", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "water", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "wood", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "ceramic", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "plastic", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "rubber", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "cushion", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "fruit", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "painted metal", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "default", "fx/treadfx/tread_dust_airlift" );
    maps\_treadfx::_id_8350( "script_vehicle_m1a1_abrams", "none", "fx/treadfx/tread_dust_airlift" );
}

globalfx_override()
{
    maps\_global_fx::override_global_fx( "barrel_fireFX_origin", "fx/fire/firelp_barrel_pm_no_light", undefined, "fire_barrel_small" );
    maps\_global_fx::override_global_fx( "me_dumpster_fire_FX_origin", "vfx/unique/no_fx", undefined, undefined, "fire_dumpster_medium" );
}

spawnoilwellsonfire()
{
    var_0 = self.origin + ( 0.0, 0.0, 1350.0 );
    playfx( common_scripts\utility::_id_3FA8( "oil_field_fire" ), var_0, anglestoup( self.angles ), anglestoforward( self.angles ) );
}

bmp_deathfx_override()
{
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_bmp_woodland_low", "fx/explosions/vehicle_explosion_bmp_fire", "tag_deathfx", "fx/fire/fire_tank_wreck_lg_airlift" );
}

mi17_deathfx_override()
{
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_mi17_woodland_fly_cheap", "vfx/explosion/vehicle_mi17_aerial_second_explosion", "tag_deathfx", "vfx/explosion/vehicle_mi17_aerial_second_explosion_airlift" );
    maps\_vehicle::swap_deathfx_effect_only( "script_vehicle_mi17_woodland_fly_cheap", "vfx/explosion/vehicle_mi17_smoke_crashing_runner", "tag_deathfx", "vfx/explosion/vehicle_mi17_smoke_crashing_runner_airlift" );
}

destructiblefx_overide()
{
    level.destructible_effect_override["fx/explosions/tanker_explosion"] = "fx/explosions/tanker_explosion_airlift";
}
