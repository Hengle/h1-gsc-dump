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

minigun_player_anims()
{
    level.minigun_node = getent( "minigun_anim_node", "targetname" );
    maps\_anim::_id_0BC7( self, "use" );

    for (;;)
    {
        self waittill( "turretownerchange" );
        minigun_player_use();
        self waittill( "turretownerchange" );
        minigun_player_drop();
    }
}

minigun_player_use()
{
    level.playercardbackground allowprone( 0 );
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowstand( 0 );
    level.playercardbackground disableweapons();
    level.playercardbackground _meth_84a5();
    level.playercardbackground _meth_84a7( 12.0, 500, 1.0, 1.0 );
    level.eplayerview = maps\_utility::_id_88D1( "minigun_player", level.minigun_node.origin, level.minigun_node.angles );
    level.eplayerview hide();
    level.minigun_node maps\_anim::_id_0BC7( level.eplayerview, "use_minigun" );
    level.playercardbackground _meth_855e( level.eplayerview, "tag_player", 1, 0.7, 0, 0.4, 0, 0, 0, 0, 1 );
    level.minigun_previous_fov = getstarttime();
    level.playercardbackground lerpfov( 55, 0.5 );
    wait 0.3;
    level.eplayerview show();
    maps\_anim::_id_0BC7( self, "use" );
    thread maps\_anim::_id_0C24( self, "use" );
    level.minigun_node maps\_anim::_id_0C24( level.eplayerview, "use_minigun" );
    level.eplayerview hide();
    level.playercardbackground unlink();
    level.minigun_eye_height = level.playercardbackground _meth_82ef();
    level.playercardbackground _meth_84c7( 0 );
    self _meth_856c();
}

minigun_player_drop()
{
    var_0 = self gettagorigin( "tag_flash" );
    var_1 = self gettagangles( "tag_flash" );
    var_2 = anglestoaxis( var_1 );
    var_3 = level.playercardbackground geteye();
    var_4 = level.playercardbackground _meth_82ef();
    var_5 = var_3 - var_0;
    var_6 = ( vectordot( var_5, var_2["forward"] ), vectordot( var_5, var_2["right"] ), vectordot( var_5, var_2["up"] ) );
    var_6 -= ( 0, 0, level.minigun_eye_height );
    level.eplayerview linkto( self, "tag_flash", var_6, ( 0.0, 0.0, 0.0 ) );
    level.playercardbackground playerlinktoabsolute( level.eplayerview, undefined );
    waittillframeend;
    self _meth_856d();
    self waittill( "turret_returned_to_default" );
    level.playercardbackground _meth_84c8();
    maps\_anim::_id_0BC7( self, "drop" );
    thread maps\_anim::_id_0C24( self, "drop" );
    level.eplayerview unlink();
    level.playercardbackground enableweapons();
    var_7 = level.playercardbackground getplayerangles();
    var_8 = anglestoforward( var_7 );
    var_9 = level.playercardbackground.origin + ( 0.0, 0.0, 20.0 );
    var_9 -= var_8 * 20;
    var_10 = var_9 - ( 0.0, 0.0, 100.0 );
    var_11 = playerphysicstrace( var_9, var_10 );
    level.eplayerview moveto( var_11, 0.5, 0.2, 0.2 );
    level.playercardbackground lerpfov( level.minigun_previous_fov, 0.5 );
    level.playercardbackground _meth_84a6();
    wait 0.5;
    level.playercardbackground unlink();
    level.eplayerview delete();
    level.playercardbackground allowprone( 1 );
    level.playercardbackground allowcrouch( 1 );
    level.playercardbackground allowstand( 1 );
}

minigun_think()
{
    common_scripts\utility::_id_383D( "player_on_minigun" );
    self._id_0C72 = "minigun";
    maps\_utility::_id_0D61();
    thread minigun_console_hint();
    thread minigun_player_anims();
    thread minigun_used();

    for (;;)
    {
        for (;;)
        {
            if ( isdefined( self getturretowner() ) )
                break;

            wait 0.05;
        }

        level thread overheat_enable();
        common_scripts\utility::_id_383F( "player_on_minigun" );

        for (;;)
        {
            if ( !isdefined( self getturretowner() ) )
                break;

            wait 0.05;
        }

        common_scripts\utility::_id_3831( "player_on_minigun" );
        level thread overheat_disable();
        self._id_767A stoprumble( "minigun_rumble" );
    }
}

minigun_const()
{
    level.turret_heat_status = 1;
    level.turret_heat_max = 114;
    level.turret_cooldownrate = 15;
    level.overheat_hud_height_max = 110;
    var_0 = getent( "minigun", "targetname" );
    var_0 _meth_8569( 150 );
    var_0 _meth_815c( 0 );
    var_0 _meth_856b( 1 );
}

minigun_rumble()
{
    var_0 = 0;
    var_1 = 750;
    var_2 = var_1 - var_0;
    self._id_767A = spawn( "script_origin", self.origin );

    for (;;)
    {
        wait 0.05;

        if ( self._id_5D5C <= 0 || !common_scripts\utility::_id_382E( "player_on_minigun" ) )
            continue;

        self._id_767A.origin = level.playercardbackground geteye() + ( 0, 0, var_1 - var_2 * self._id_5D5C );
        self._id_767A playrumbleonentity( "minigun_rumble" );
    }
}

minigun_console_hint()
{
    var_0 = getent( "minigun", "targetname" );

    while ( !common_scripts\utility::_id_382E( "minigun_lesson_learned" ) )
    {
        wait 0.05;
        var_1 = var_0 getturretowner();

        if ( isdefined( var_1 ) && level.playercardbackground != var_1 || !isdefined( var_1 ) )
            continue;

        if ( isdefined( level.minigun_console_hint_displayed ) )
            continue;

        if ( level.playercardbackground common_scripts\utility::_id_5064() )
            level.playercardbackground thread maps\_utility::_id_2B4A( "minigun_spin_left_trigger" );
        else
            level.playercardbackground thread maps\_utility::_id_2B4A( "minigun_spin_keyboard" );

        level.minigun_console_hint_displayed = 1;
    }
}

minigun_used()
{
    common_scripts\utility::_id_384A( "player_on_minigun" );

    if ( level.console )
        var_0 = 6;
    else
        var_0 = 10;

    var_1 = 4;
    var_2 = 7;
    var_3 = 0.02;
    var_4 = 0.02;
    var_5 = 0.35;
    var_6 = 0;
    var_7 = 1 / var_0 * 20;
    var_8 = 1 / var_1 * 20;
    level.isradarblocked = 0;
    var_9 = 0;
    self._id_5D5C = 0;
    var_10 = 0;
    var_11 = 1;
    var_12 = 0;
    var_13 = 0;
    var_14 = undefined;
    var_15 = 0;
    var_16 = 0;
    var_17 = undefined;
    var_18 = 0;
    level.frames = 0;
    level.normframes = 0;
    var_19 = 0;
    thread minigun_rumble();

    for (;;)
    {
        level.normframes++;

        if ( common_scripts\utility::_id_382E( "player_on_minigun" ) )
        {
            if ( !level.isradarblocked )
            {
                if ( level.playercardbackground common_scripts\utility::_id_5064() )
                {
                    if ( level.playercardbackground adsbuttonpressed() )
                    {
                        level.isradarblocked = 1;
                        thread minigun_sound_spinup();
                    }
                }
                else if ( level.playercardbackground attackbuttonpressed() )
                {
                    level.isradarblocked = 1;
                    thread minigun_sound_spinup();
                }
            }
            else if ( level.playercardbackground common_scripts\utility::_id_5064() )
            {
                if ( !level.playercardbackground adsbuttonpressed() )
                {
                    level.isradarblocked = 0;
                    thread minigun_sound_spindown();
                }
                else if ( !level.playercardbackground adsbuttonpressed() && level.playercardbackground attackbuttonpressed() && var_15 )
                {
                    level.isradarblocked = 0;
                    thread minigun_sound_spindown();
                }
            }
            else if ( !level.playercardbackground attackbuttonpressed() )
            {
                level.isradarblocked = 0;
                thread minigun_sound_spindown();
            }
            else if ( level.playercardbackground attackbuttonpressed() && var_15 )
            {
                level.isradarblocked = 0;
                thread minigun_sound_spindown();
            }

            if ( level.playercardbackground common_scripts\utility::_id_5064() )
            {
                if ( level.playercardbackground adsbuttonpressed() )
                {
                    var_6 += 0.05;

                    if ( var_6 >= 2.75 )
                        common_scripts\utility::_id_383F( "minigun_lesson_learned" );
                }
                else
                    var_6 = 0;
            }

            if ( !var_13 )
            {
                if ( level.playercardbackground attackbuttonpressed() && !var_15 && var_12 )
                {
                    var_13 = 1;
                    var_17 = gettime();

                    if ( !level.playercardbackground common_scripts\utility::_id_5064() )
                        common_scripts\utility::_id_383F( "minigun_lesson_learned" );
                }
                else if ( level.playercardbackground attackbuttonpressed() && var_15 )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }
            }
            else
            {
                if ( !level.playercardbackground attackbuttonpressed() )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }

                if ( level.playercardbackground attackbuttonpressed() && !var_12 )
                {
                    var_13 = 0;
                    var_17 = undefined;
                }
            }
        }
        else
        {
            if ( var_13 || level.isradarblocked == 1 )
                thread minigun_sound_spindown();

            var_13 = 0;
            level.isradarblocked = 0;
        }

        if ( var_15 )
        {
            if ( !( var_10 >= var_11 ) )
            {
                var_15 = 0;
                var_17 = undefined;
                self turretfireenable();
            }
        }

        if ( level.isradarblocked )
        {
            var_9 += var_3;
            self._id_5D5C = var_9;
        }
        else
        {
            var_9 -= var_4;
            self._id_5D5C = var_9;
        }

        if ( var_9 > var_11 )
        {
            var_9 = var_11;
            self._id_5D5C = var_9;
        }

        if ( var_9 < 0 )
        {
            var_9 = 0;
            self._id_5D5C = var_9;
            self notify( "done" );
        }

        if ( var_9 == var_11 )
        {
            var_12 = 1;
            var_14 = gettime();
            self turretfireenable();
        }
        else
        {
            var_12 = 0;
            self turretfiredisable();
        }

        if ( var_13 && !var_15 )
        {
            level.frames++;
            var_10 += var_7;
        }

        if ( gettime() > var_16 && !var_13 )
            var_10 -= var_8;

        if ( var_10 > var_11 )
            var_10 = var_11;

        if ( var_10 < 0 )
            var_10 = 0;

        level._id_4795 = var_10;
        level.turret_heat_status = int( var_10 * 114 );

        if ( isdefined( level.overheat_status2 ) )
            thread overheat_hud_update();

        if ( var_10 >= var_11 && var_10 <= var_11 && ( var_18 < var_11 || var_18 > var_11 ) )
        {
            var_15 = 1;
            var_16 = gettime() + var_2 * 1000;
            var_19 = 0;
            thread overheat_overheated();
        }

        var_18 = var_10;

        if ( var_15 )
        {
            self turretfiredisable();
            var_13 = 0;

            if ( gettime() > var_19 )
            {
                playfxontag( common_scripts\utility::_id_3FA8( "turret_overheat_smoke" ), self, "tag_flash" );
                var_19 = gettime() + var_5 * 1000;
            }
        }

        self _meth_814d( maps\_utility::_id_3EF5( "spin" ), 1, 0.2, var_9 );
        wait 0.05;
    }
}

minigun_sound_spinup()
{
    level notify( "stopMinigunSound" );
    level endon( "stopMinigunSound" );

    if ( self._id_5D5C < 0.25 )
    {
        self playsound( "minigun_gatling_spinup1" );
        wait 0.6;
        self playsound( "minigun_gatling_spinup2" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup3" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self._id_5D5C < 0.5 )
    {
        self playsound( "minigun_gatling_spinup2" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup3" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self._id_5D5C < 0.75 )
    {
        self playsound( "minigun_gatling_spinup3" );
        wait 0.5;
        self playsound( "minigun_gatling_spinup4" );
        wait 0.5;
    }
    else if ( self._id_5D5C < 1 )
    {
        self playsound( "minigun_gatling_spinup4" );
        wait 0.5;
    }

    thread minigun_sound_spinloop();
}

minigun_sound_spinloop()
{
    level notify( "stopMinigunSound" );
    level common_scripts\utility::play_loopsound_in_space_with_end( "minigun_gatling_spin", self.origin, "stopMinigunSound" );
}

minigun_sound_spindown()
{
    level notify( "stopMinigunSound" );
    level endon( "stopMinigunSound" );

    if ( self._id_5D5C > 0.75 )
    {
        self stopsounds();
        self playsound( "minigun_gatling_spindown4" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown3" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown2" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown1" );
        wait 0.65;
    }
    else if ( self._id_5D5C > 0.5 )
    {
        self playsound( "minigun_gatling_spindown3" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown2" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown1" );
        wait 0.65;
    }
    else if ( self._id_5D5C > 0.25 )
    {
        self playsound( "minigun_gatling_spindown2" );
        wait 0.5;
        self playsound( "minigun_gatling_spindown1" );
        wait 0.65;
    }
    else
    {
        self playsound( "minigun_gatling_spindown1" );
        wait 0.65;
    }
}

overheat_enable()
{
    level thread overheat_hud();
    common_scripts\utility::_id_3831( "disable_overheat" );
}

overheat_disable()
{
    common_scripts\utility::_id_383F( "disable_overheat" );
    level._id_781D = undefined;
    waitframe;

    if ( isdefined( level.overheat_bg ) )
        level.overheat_bg destroy();

    if ( isdefined( level.overheat_bg_distort ) )
        level.overheat_bg_distort destroy();

    if ( isdefined( level.overheat_icon ) )
        level.overheat_icon destroy();

    if ( isdefined( level.overheat_status ) )
        level.overheat_status destroy();

    if ( isdefined( level.overheat_status2 ) )
        level.overheat_status2 destroy();

    if ( isdefined( level.overheat_flashing ) )
        level.overheat_flashing destroy();
}

overheat_hud()
{
    level endon( "disable_overheat" );

    if ( !isdefined( level.overheat_bg ) )
    {
        level.overheat_bg = newhudelem();
        level.overheat_bg.alignx = "right";
        level.overheat_bg.aligny = "bottom";
        level.overheat_bg.hostquits = "right";
        level.overheat_bg.visionsetnight = "bottom";
        level.overheat_bg.xpmaxmultipliertimeplayed = -29;
        level.overheat_bg._id_0538 = -146;
        level.overheat_bg.alpha = 0.3;
        level.overheat_bg setshader( "h1_hud_temperature_border", 14, 114 );
        level.overheat_bg.space = 5;
    }

    if ( !isdefined( level.overheat_bg_distort ) )
    {
        level.overheat_bg_distort = newhudelem();
        level.overheat_bg_distort.alignx = "right";
        level.overheat_bg_distort.aligny = "bottom";
        level.overheat_bg_distort.hostquits = "right";
        level.overheat_bg_distort.visionsetnight = "bottom";
        level.overheat_bg_distort.xpmaxmultipliertimeplayed = -29;
        level.overheat_bg_distort._id_0538 = -146;
        level.overheat_bg_distort.alpha = 0.9;
        level.overheat_bg_distort setshader( "h1_hud_temperature_blur", 14, 114 );
        level.overheat_bg_distort.space = 4;
    }

    if ( !isdefined( level.overheat_icon ) )
    {
        level.overheat_icon = newhudelem();
        level.overheat_icon.alignx = "right";
        level.overheat_icon.aligny = "bottom";
        level.overheat_icon.hostquits = "right";
        level.overheat_icon.visionsetnight = "bottom";
        level.overheat_icon.xpmaxmultipliertimeplayed = -26;
        level.overheat_icon._id_0538 = -126;
        level.overheat_icon setshader( "h1_hud_temperature_icon", 28, 28 );
        level.overheat_icon.space = 6;
    }

    var_0 = -31;
    var_1 = -149.5;

    if ( !isdefined( level.overheat_status ) )
    {
        level.overheat_status = newhudelem();
        level.overheat_status.alignx = "right";
        level.overheat_status.aligny = "bottom";
        level.overheat_status.hostquits = "right";
        level.overheat_status.visionsetnight = "bottom";
        level.overheat_status.xpmaxmultipliertimeplayed = var_0;
        level.overheat_status._id_0538 = var_1;
        level.overheat_status setshader( "white", 10, 0 );
        level.overheat_status.color = ( 1.0, 0.9, 0.0 );
        level.overheat_status.alpha = 0;
        level.overheat_status.space = 1;
    }

    if ( !isdefined( level.overheat_status2 ) )
    {
        level.overheat_status2 = newhudelem();
        level.overheat_status2.alignx = "right";
        level.overheat_status2.aligny = "bottom";
        level.overheat_status2.hostquits = "right";
        level.overheat_status2.visionsetnight = "bottom";
        level.overheat_status2.xpmaxmultipliertimeplayed = var_0;
        level.overheat_status2._id_0538 = var_1;
        level.overheat_status2 setshader( "white", 10, 0 );
        level.overheat_status2.color = ( 1.0, 0.9, 0.0 );
        level.overheat_status2.alpha = 0;
        level.overheat_status2.space = 2;
    }

    if ( !isdefined( level.overheat_flashing ) )
    {
        level.overheat_flashing = newhudelem();
        level.overheat_flashing.alignx = "right";
        level.overheat_flashing.aligny = "bottom";
        level.overheat_flashing.hostquits = "right";
        level.overheat_flashing.visionsetnight = "bottom";
        level.overheat_flashing.xpmaxmultipliertimeplayed = var_0;
        level.overheat_flashing._id_0538 = var_1;
        level.overheat_flashing setshader( "white", 10, level.overheat_hud_height_max );
        level.overheat_flashing.color = ( 0.8, 0.16, 0.0 );
        level.overheat_flashing.alpha = 0;
        level.overheat_flashing.space = 3;
    }
}

overheat_overheated()
{
    level endon( "disable_overheat" );

    if ( !common_scripts\utility::_id_382E( "disable_overheat" ) )
    {
        level._id_781D = 0;
        level.playercardbackground thread maps\_utility::_id_69C4( "h1_wep_m134_overheat" );
        level.overheat_flashing.alpha = 1;
        level.overheat_status.alpha = 0;
        level.overheat_status2.alpha = 0;
        level notify( "stop_overheat_drain" );
        level.turret_heat_status = level.turret_heat_max;
        thread overheat_hud_update();

        for ( var_0 = 0; var_0 < 4; var_0++ )
        {
            level.overheat_flashing fadeovertime( 0.5 );
            level.overheat_flashing.alpha = 0.5;
            wait 0.5;
            level.overheat_flashing fadeovertime( 0.5 );
            level.overheat_flashing.alpha = 1.0;
        }

        level.overheat_flashing fadeovertime( 0.5 );
        level.overheat_flashing.alpha = 0.0;
        level.overheat_status.alpha = 1;
        wait 0.5;
        thread overheat_hud_drain();
        wait 2;
        level._id_781D = undefined;
    }
}

overheat_hud_update()
{
    level endon( "disable_overheat" );
    level notify( "stop_overheat_drain" );

    if ( level.turret_heat_status > 1 )
        level.overheat_status.alpha = 1;
    else
    {
        level.overheat_status.alpha = 0;
        level.overheat_status fadeovertime( 0.25 );
    }

    if ( isdefined( level.overheat_status2 ) && level.turret_heat_status > 1 )
    {
        var_0 = int( level.turret_heat_status * level.overheat_hud_height_max / level.turret_heat_max );
        level.overheat_status2.alpha = 1;
        level.overheat_status2 setshader( "white", 10, int( var_0 ) );
        level.overheat_status scaleovertime( 0.05, 10, int( var_0 ) );
    }
    else
    {
        level.overheat_status2.alpha = 0;
        level.overheat_status2 fadeovertime( 0.25 );
    }

    overheat_setcolor( level.turret_heat_status );
    wait 0.05;

    if ( isdefined( level.overheat_status2 ) )
        level.overheat_status2.alpha = 0;

    if ( isdefined( level.overheat_status ) && level.turret_heat_status < level.turret_heat_max )
        thread overheat_hud_drain();
}

overheat_setcolor( var_0, var_1 )
{
    level endon( "disable_overheat" );
    var_2 = [];
    var_2[0] = 1.0;
    var_2[1] = 0.9;
    var_2[2] = 0.0;
    var_3 = [];
    var_3[0] = 1.0;
    var_3[1] = 0.5;
    var_3[2] = 0.0;
    var_4 = [];
    var_4[0] = 0.9;
    var_4[1] = 0.16;
    var_4[2] = 0.0;
    var_5 = [];
    var_5[0] = var_2[0];
    var_5[1] = var_2[1];
    var_5[2] = var_2[2];
    var_6 = 0;
    var_7 = level.turret_heat_max / 2;
    var_8 = level.turret_heat_max;
    var_9 = undefined;
    var_10 = undefined;
    var_11 = undefined;

    if ( var_0 > var_6 && var_0 <= var_7 )
    {
        var_9 = int( var_0 * 100 / var_7 );

        for ( var_12 = 0; var_12 < var_5.size; var_12++ )
        {
            var_10 = var_3[var_12] - var_2[var_12];
            var_11 = var_10 / 100;
            var_5[var_12] = var_2[var_12] + var_11 * var_9;
        }
    }
    else if ( var_0 > var_7 && var_0 <= var_8 )
    {
        var_9 = int( ( var_0 - var_7 ) * 100 / ( var_8 - var_7 ) );

        for ( var_12 = 0; var_12 < var_5.size; var_12++ )
        {
            var_10 = var_4[var_12] - var_3[var_12];
            var_11 = var_10 / 100;
            var_5[var_12] = var_3[var_12] + var_11 * var_9;
        }
    }

    if ( isdefined( var_1 ) )
        level.overheat_status fadeovertime( var_1 );

    if ( isdefined( level.overheat_status.color ) )
        level.overheat_status.color = ( var_5[0], var_5[1], var_5[2] );

    if ( isdefined( level.overheat_status2.color ) )
        level.overheat_status2.color = ( var_5[0], var_5[1], var_5[2] );
}

overheat_hud_drain()
{
    level endon( "disable_overheat" );
    level endon( "stop_overheat_drain" );
    var_0 = 1.0;

    for (;;)
    {
        if ( level.turret_heat_status > 1 )
            level.overheat_status.alpha = 1;

        var_1 = ( level.turret_heat_status - level.turret_cooldownrate ) * level.overheat_hud_height_max / level.turret_heat_max;
        thread overheat_status_rampdown( var_1, var_0 );

        if ( var_1 < 1 )
            var_1 = 1;

        overheat_setcolor( level.turret_heat_status, var_0 );
        wait(var_0);

        if ( isdefined( level.overheat_status ) && level.turret_heat_status <= 1 )
            level.overheat_status.alpha = 0;

        if ( isdefined( level.overheat_status2 ) && level.turret_heat_status <= 1 )
            level.overheat_status2.alpha = 0;
    }
}

overheat_status_rampdown( var_0, var_1 )
{
    level endon( "disable_overheat" );
    level endon( "stop_overheat_drain" );
    var_2 = 20 * var_1;
    var_3 = level.turret_heat_status - var_0;
    var_4 = var_3 / var_2;

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        level.turret_heat_status -= var_4;

        if ( level.turret_heat_status < 1 )
        {
            level.turret_heat_status = 1;
            return;
        }

        wait 0.05;
    }
}

seaknight()
{
    level.seaknight1 = maps\_vehicle::_id_8979( "rescue_chopper" );
    level.seaknight1 setmodel( "vehicle_ch46e_opened_door_interior_a" );
    var_0 = spawn( "script_model", level.seaknight1 gettagorigin( "body_animate_jnt" ) );
    var_0 setmodel( "vehicle_ch46e_opened_door_interior_b" );
    var_0.angles = level.seaknight1.angles;
    var_0 linkto( level.seaknight1, "body_animate_jnt" );
    var_1 = spawn( "script_model", level.seaknight1 gettagorigin( "body_animate_jnt" ) );
    var_1 setmodel( "vehicle_ch46e_wires" );
    var_1.angles = level.seaknight1.angles;
    var_1 linkto( level.seaknight1, "body_animate_jnt" );
    maps\_wibble::wibble_add_heli_to_track( level.seaknight1 );
    wait 0.05;
    var_2 = [];

    for ( var_3 = 0; var_3 < level.seaknight1._id_750A.size; var_3++ )
    {
        if ( level.seaknight1._id_750A[var_3].classname != "actor_ally_pilot_zach_woodland" )
            var_2[var_2.size] = level.seaknight1._id_750A[var_3];

        if ( level.seaknight1._id_750A[var_3].classname == "actor_ally_hero_mark_woodland" )
        {
            level.griggs = level.seaknight1._id_750A[var_3];
            level.griggs._id_0C72 = "griggs";
        }

        level.seaknight1._id_750A[var_3] common_scripts\utility::_id_4853( "seaknight_show_names" );
    }

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        var_2[var_3] thread seaknightriders_standinplace();

    common_scripts\utility::_id_383F( "no_more_grenades" );
    var_4 = getaiarray( "axis" );

    for ( var_3 = 0; var_3 < var_4.size; var_3++ )
        var_4[var_3].grenadeammo = 0;

    common_scripts\utility::_id_384A( "open_bay_doors" );
    wait 11;
    var_5 = missile_createrepulsorent( level.seaknight1, 5000, 1500 );
    level.seaknight1._id_2D30 = 1;
    level.seaknight1 sethoverparams( 0, 0, 0 );
    level.seaknight1 _meth_814d( maps\_utility::_id_3EF7( "ch46_doors_open" ), 1 );
    level.seaknight1 playsound( "seaknight_door_open" );
    level._id_9C82["script_vehicle_ch46e"][1]._id_9CD5 = undefined;
    level._id_9C82["script_vehicle_ch46e"][2]._id_4068 = level._id_78AC["generic"]["ch46_unload_2"];
    level._id_9C82["script_vehicle_ch46e"][3]._id_4068 = level._id_78AC["generic"]["ch46_unload_3"];
    level.seaknight1 notify( "unload" );
    wait 0.5;
    level notify( "seaknight_show_names" );
    wait 4.0;
    level.playersafetyblocker delete();
    common_scripts\utility::_id_383F( "seaknight_can_be_boarded" );
    thread seaknight_griggs_speech();
    var_6 = 0;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_6++;
        var_2[var_3] thread vehicle_seaknight_idle_and_load_think( var_6 );
        var_2[var_3] thread seaknight_riders_erase();
    }

    thread seaknight_departure_sequence();
    common_scripts\utility::_id_384A( "player_made_it" );

    if ( isalive( level.playercardbackground ) )
    {
        level.playercardbackground enableinvulnerability();
        level.playercardbackground.attackeraccuracy = 0;
        maps\_utility::enable_scuff_footsteps_sound( 0 );
    }

    createthreatbiasgroup( "sas_evac_guy" );
    wait 0.25;
    var_7 = getent( "redshirt1", "targetname" );
    var_7 thread seaknight_sas_load();
    level.sasseaknightboarded++;
    var_8 = getent( "redshirt2", "targetname" );
    var_8 thread seaknight_sas_load();
    level.sasseaknightboarded++;
    level.sasgunner thread seaknight_sas_load();
    level.sasseaknightboarded++;
    level._id_6F7C thread seaknight_sas_load();
    level.sasseaknightboarded++;

    while ( level.sasseaknightboarded > 0 )
        wait 0.1;

    common_scripts\utility::_id_383F( "all_real_friendlies_on_board" );
    common_scripts\utility::_id_383F( "seaknight_guards_boarding" );
    level.playercardbackground maps\_utility::_id_69C4( "scn_vd_seaknight_leaving" );
}

seaknight_departure_sequence()
{
    common_scripts\utility::_id_384A( "seaknight_guards_boarding" );
    wait 10;

    if ( !common_scripts\utility::_id_382E( "player_made_it" ) )
        wait 2;

    common_scripts\utility::_id_383F( "all_fake_friendlies_aboard" );

    if ( !common_scripts\utility::_id_382E( "player_made_it" ) )
        wait 5;

    if ( common_scripts\utility::_id_382E( "player_made_it" ) )
    {
        common_scripts\utility::_id_384A( "all_real_friendlies_on_board" );
        level.playercardbackground playsound( "villagedef_grg_wereallaboard" );
        wait 1;
    }
    else
    {
        common_scripts\utility::_id_383F( "seaknight_unboardable" );
        level.seaknight1 setcontents( 0 );
    }

    common_scripts\utility::_id_383F( "outtahere" );
    wait 1.5;
    thread maps\village_defend::countdown_speech( "outtahere" );
}

seaknight_sas_load()
{
    self endon( "death" );
    maps\_utility::_id_3100( "interval_trigger_seaknight" );
    self setthreatbiasgroup( "sas_evac_guy" );
    setignoremegroup( "axis", "sas_evac_guy" );
    self.goalradius = 60;
    self._id_2AF3 = 1;
    self.index = 1;
    self.ignoreforfixednodesafecheck = 1;
    wait(randomfloatrange( 1.5, 3.2 ));
    var_0 = getnode( "seaknight_fakeramp_startpoint", "targetname" );
    self _meth_81a9( var_0 );
    self waittill( "goal" );
    self.noncombat = 1;

    if ( isdefined( var_0.rank ) )
        self.goalradius = var_0.rank;

    var_1 = getnode( "seaknight_fakeramp_end", "targetname" );
    self _meth_81a9( var_1 );
    self waittill( "goal" );
    level.sasseaknightboarded--;

    if ( isdefined( self._id_58D7 ) )
        maps\_utility::_id_8EA4();

    self delete();
}

seaknight_griggs_speech()
{
    common_scripts\utility::_id_384A( "seaknight_can_be_boarded" );

    if ( !common_scripts\utility::_id_382E( "lz_reached" ) )
        common_scripts\utility::_id_384A( "lz_reached" );
    else
        wait 5.5;

    level.griggs maps\_anim::_id_0C21( level.griggs, "needaride" );
    wait 0.45;
    level.griggs maps\_anim::_id_0C21( level.griggs, "getonboard" );
    wait 2;
    level.griggs maps\_anim::_id_0C21( level.griggs, "griggsletsgo" );
}

vehicle_seaknight_idle_and_load_think( var_0 )
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "seaknight_guards_boarding" );
    var_1 = "ch46_load_" + var_0;
    level.seaknight1 maps\_anim::_id_0BC9( self, var_1, "tag_detach" );
    var_2 = getent( "seaknight_guards_loading_org_" + var_0, "targetname" );
    self _meth_81aa( var_2.origin );
    self.goalradius = 4;

    if ( !common_scripts\utility::_id_382E( "player_made_it" ) )
    {
        self waittill( "goal" );
        self linkto( level.seaknight1, "tag_detach" );
    }

    common_scripts\utility::_id_384A( "player_made_it" );
    wait 1;

    if ( isdefined( self._id_58D7 ) )
        maps\_utility::_id_8EA4();

    self delete();
}

seaknight_riders_erase()
{
    if ( isdefined( self._id_0C72 ) && self._id_0C72 == "griggs" )
        return;

    self endon( "death" );
    common_scripts\utility::_id_384A( "player_made_it" );
    wait 1;
    common_scripts\utility::_id_384A( "all_fake_friendlies_aboard" );

    if ( isdefined( self._id_58D7 ) )
        maps\_utility::_id_8EA4();

    self delete();
}

_id_2856()
{
    self delete();
}

seaknightriders_standinplace()
{
    if ( !isai( self ) )
        return;

    self _meth_81ce( "crouch" );
    thread maps\village_defend::hero();
    self waittill( "jumpedout" );
    self _meth_81ce( "crouch" );
    waitframe;
    self _meth_81ce( "crouch" );
    self.goalradius = 4;
    self _meth_81a7( 1 );
    self.radarshowenemydirection = 0;
    self _meth_81aa( self.origin );
    self.grenadeawareness = 0;
    self.grenadeammo = 0;
    self.index = 1;
}

friendly_pushplayer( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = getaiarray( "allies" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == "on" )
        {
            var_1[var_2] _meth_81a7( 1 );
            var_1[var_2].dontavoidplayer = 1;
            var_1[var_2].radarshowenemydirection = 0;
            continue;
        }

        var_1[var_2] _meth_81a7( 0 );
        var_1[var_2].dontavoidplayer = 0;
        var_1[var_2].radarshowenemydirection = 1;
    }
}

can_display_pvt_parity_name()
{
    var_0 = 400;

    if ( distancesquared( level.playercardbackground.origin, self.origin ) > var_0 * var_0 )
        return 0;

    var_1 = level.playercardbackground geteye() + 2000 * anglestoforward( level.playercardbackground getplayerangles() );
    var_2 = bullettrace( level.playercardbackground geteye(), var_1, 0, level.playercardbackground );

    if ( isdefined( var_2["surfacetype"] ) && issubstr( var_2["surfacetype"], "water" ) )
    {
        var_3 = var_2["position"] + 2 * vectornormalize( anglestoforward( level.playercardbackground getplayerangles() ) );
        var_2 = bullettrace( var_3, var_1, 0, level.playercardbackground );
    }

    return isdefined( var_2["entity"] ) && var_2["entity"] == self;
}
