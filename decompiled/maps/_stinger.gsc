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
    precacherumble( "stinger_lock_rumble" );

    foreach ( var_1 in level.players )
        var_1 clearirtarget();

    foreach ( var_1 in level.players )
    {
        var_1 thread stingerfirednotify();
        var_1 thread stingertoggleloop();
    }
}

clearirtarget()
{
    if ( !isdefined( self.stinger ) )
        self.stinger = spawnstruct();

    self.stinger.stingerlockstarttime = 0;
    self.stinger.stingerlockstarted = 0;
    self.stinger.stingerlockfinalized = 0;
    self.stinger.stingertarget = undefined;
    self notify( "stinger_irt_cleartarget" );
    self notify( "stop_lockon_sound" );
    self notify( "stop_locked_sound" );
    self.stinger.stingerlocksound = undefined;
    self stoprumble( "stinger_lock_rumble" );
    self weaponlockfree();
    self setentertime( 0 );
    self setmlgspectator( 0 );
    self stoplocalsound( "stinger_clu_lock" );
    self stoplocalsound( "stinger_clu_aquiring_lock" );
}

stingerfirednotify()
{
    for (;;)
    {
        self waittill( "weapon_fired" );
        var_0 = self getcurrentweapon();

        if ( var_0 != "stinger" )
            continue;

        self notify( "stinger_fired" );
    }
}

stingertoggleloop()
{
    self endon( "death" );

    for (;;)
    {
        while ( !playerstingerads() )
            wait 0.05;

        thread stingerirtloop();

        while ( playerstingerads() )
            wait 0.05;

        self notify( "stinger_IRT_off" );
        clearirtarget();
    }
}

stingerirtloop()
{
    self endon( "death" );
    self endon( "stinger_IRT_off" );
    var_0 = 2000;

    for (;;)
    {
        wait 0.05;

        if ( self.stinger.stingerlockfinalized )
        {
            if ( !isstillvalidtarget( self.stinger.stingertarget ) )
            {
                clearirtarget();
                continue;
            }

            thread looplocallocksound( "stinger_clu_lock", 0.75 );
            settargettooclose( self.stinger.stingertarget );
            setnoclearance();
            continue;
        }

        if ( self.stinger.stingerlockstarted )
        {
            if ( !isstillvalidtarget( self.stinger.stingertarget ) )
            {
                clearirtarget();
                continue;
            }

            var_1 = gettime() - self.stinger.stingerlockstarttime;

            if ( var_1 < var_0 )
                continue;

            self notify( "stop_lockon_sound" );
            self.stinger.stingerlockfinalized = 1;
            self weaponlockfinalize( self.stinger.stingertarget );
            settargettooclose( self.stinger.stingertarget );
            setnoclearance();
            continue;
        }

        var_2 = getbeststingertarget();

        if ( !isdefined( var_2 ) )
            continue;

        self.stinger.stingertarget = var_2;
        self.stinger.stingerlockstarttime = gettime();
        self.stinger.stingerlockstarted = 1;
        thread looplocalseeksound( "stinger_clu_aquiring_lock", 0.6 );
    }
}

getbeststingertarget()
{
    var_0 = target_getarray();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( insidestingerreticlenolock( var_0[var_2] ) )
            var_1[var_1.size] = var_0[var_2];
    }

    if ( var_1.size == 0 )
        return undefined;

    var_3 = var_1[0];

    if ( var_1.size > 1 )
    {

    }

    return var_3;
}

insidestingerreticlenolock( var_0 )
{
    return target_isincircle( var_0, self, 65, 60 );
}

insidestingerreticlelocked( var_0 )
{
    return target_isincircle( var_0, self, 65, 75 );
}

isstillvalidtarget( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !target_istarget( var_0 ) )
        return 0;

    if ( !insidestingerreticlelocked( var_0 ) )
        return 0;

    return 1;
}

playerstingerads()
{
    var_0 = self getcurrentweapon();

    if ( var_0 != "stinger" )
        return 0;

    if ( self playerads() == 1.0 )
        return 1;

    return 0;
}

setnoclearance()
{
    var_0 = 60;
    var_1 = 10;
    var_2 = 400;
    var_3 = ( 0.0, 1.0, 0.0 );
    var_4 = ( 1.0, 0.0, 0.0 );
    var_5 = [];
    var_5[0] = ( 0.0, 0.0, 80.0 );
    var_5[1] = ( -40.0, 0.0, 120.0 );
    var_5[2] = ( 40.0, 0.0, 120.0 );
    var_5[3] = ( -40.0, 0.0, 40.0 );
    var_5[4] = ( 40.0, 0.0, 40.0 );

    if ( getdvar( "missileDebugDraw" ) == "1" )
        var_6 = 1;
    else
        var_6 = 0;

    var_7 = self getplayerangles();
    var_8 = anglestoforward( var_7 );
    var_9 = anglestoright( var_7 );
    var_10 = anglestoup( var_7 );
    var_11 = self.origin + ( 0, 0, var_0 ) + var_9 * var_1;
    var_12 = 0;

    for ( var_13 = 0; var_13 < var_5.size; var_13++ )
    {
        var_14 = var_11 + var_8 * var_2 + var_10 * var_5[var_13][2] + var_9 * var_5[var_13][0];
        var_15 = bullettrace( var_11, var_14, 0, undefined );

        if ( var_15["fraction"] < 1 )
        {
            var_12 = 1;

            if ( var_6 )
            {

            }
            else
                break;
        }
        else if ( var_6 )
        {

        }
    }

    self setmlgspectator( var_12 );
}

settargettooclose( var_0 )
{
    var_1 = 1000;

    if ( !isdefined( var_0 ) )
        return 0;

    var_2 = distance2d( self.origin, var_0.origin );

    if ( var_2 < var_1 )
    {
        self.stinger.targettoclose = 1;
        self setentertime( 1 );
    }
    else
    {
        self.stinger.targettoclose = 0;
        self setentertime( 0 );
    }
}

looplocalseeksound( var_0, var_1 )
{
    self endon( "stop_lockon_sound" );
    self endon( "death" );

    for (;;)
    {
        self playlocalsound( var_0 );
        self playrumbleonentity( "stinger_lock_rumble" );
        wait(var_1);
    }
}

looplocallocksound( var_0, var_1 )
{
    self endon( "stop_locked_sound" );
    self endon( "death" );

    if ( isdefined( self.stinger.stingerlocksound ) )
        return;

    self.stinger.stingerlocksound = 1;

    for (;;)
    {
        self playlocalsound( var_0 );
        self playrumbleonentity( "stinger_lock_rumble" );
        wait(var_1 / 3);
        self playrumbleonentity( "stinger_lock_rumble" );
        wait(var_1 / 3);
        self playrumbleonentity( "stinger_lock_rumble" );
        wait(var_1 / 3);
        self stoprumble( "stinger_lock_rumble" );
    }

    self.stinger.stingerlocksound = undefined;
}
