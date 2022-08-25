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
    level.uselegacyspawning = issupportedmap() && issupportedmode() && getdvarint( "legacySpawningEnabled", 0 );
}

issupportedmap()
{
    switch ( level.script )
    {
        case "mp_bog_summer":
        case "mp_cargoship":
        case "mp_bog":
        case "mp_countdown":
            return 1;
        default:
            return 0;
    }
}

issupportedmode()
{
    switch ( level.gametype )
    {
        case "war":
        case "conf":
        case "dom":
            return 1;
        default:
            return 0;
    }
}

uselegacyspawning()
{
    return level.uselegacyspawning;
}

getspawnpoint_final( var_0, var_1 )
{
    var_2 = undefined;

    if ( !isdefined( var_0 ) || var_0.size == 0 )
        return undefined;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
        var_2 = getbestweightedspawnpoint( var_0 );
    else
    {
        for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        {
            if ( isdefined( self._id_55DD ) && self._id_55DD == var_0[var_3] )
                continue;

            if ( positionwouldtelefrag( var_0[var_3].origin ) )
                continue;

            var_2 = var_0[var_3];
            break;
        }

        if ( !isdefined( var_2 ) )
        {
            if ( isdefined( self._id_55DD ) && !positionwouldtelefrag( self._id_55DD.origin ) )
            {
                for ( var_3 = 0; var_3 < var_0.size; var_3++ )
                {
                    if ( var_0[var_3] == self._id_55DD )
                    {
                        var_2 = var_0[var_3];
                        break;
                    }
                }
            }
        }
    }

    if ( !isdefined( var_2 ) )
    {
        if ( var_1 )
            var_2 = var_0[randomint( var_0.size )];
        else
            var_2 = var_0[0];
    }

    return var_2;
}

getbestweightedspawnpoint( var_0 )
{
    var_1 = 3;

    for ( var_2 = 0; var_2 <= var_1; var_2++ )
    {
        var_3 = [];
        var_4 = undefined;
        var_5 = undefined;

        for ( var_6 = 0; var_6 < var_0.size; var_6++ )
        {
            if ( !isdefined( var_4 ) || var_0[var_6].weight > var_4 )
            {
                if ( positionwouldtelefrag( var_0[var_6].origin ) )
                    continue;

                var_3 = [];
                var_3[0] = var_0[var_6];
                var_4 = var_0[var_6].weight;
                continue;
            }

            if ( var_0[var_6].weight == var_4 )
            {
                if ( positionwouldtelefrag( var_0[var_6].origin ) )
                    continue;

                var_3[var_3.size] = var_0[var_6];
            }
        }

        if ( var_3.size == 0 )
            return undefined;

        var_5 = var_3[randomint( var_3.size )];

        if ( var_2 == var_1 )
            return var_5;

        if ( isdefined( var_5.lastsighttracetime ) && var_5.lastsighttracetime == gettime() )
            return var_5;

        if ( !lastminutesighttraces( var_5 ) )
            return var_5;

        var_7 = getlospenalty();
        var_5.weight -= var_7;
        var_5.lastsighttracetime = gettime();
    }
}

_id_40D8( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = randomint( var_0.size );
        var_3 = var_0[var_1];
        var_0[var_1] = var_0[var_2];
        var_0[var_2] = var_3;
    }

    return getspawnpoint_final( var_0, 0 );
}

getallotherplayers()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( !isdefined( level.players[var_1] ) )
            continue;

        var_2 = level.players[var_1];

        if ( var_2.sessionstate != "playing" || var_2 == self )
            continue;

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

getallalliedandenemyplayers( var_0 )
{
    if ( level.teambased )
    {
        if ( self.pers["team"] == "allies" )
        {
            var_0.allies = level.aliveplayers["allies"];
            var_0._id_31CA = level.aliveplayers["axis"];
        }
        else
        {
            var_0.allies = level.aliveplayers["axis"];
            var_0._id_31CA = level.aliveplayers["allies"];
        }
    }
    else
    {
        var_0.allies = [];
        var_0._id_31CA = level.activeplayers;
    }
}

initweights( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1].weight = 0;
}

_id_40D7( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    if ( getdvarint( "scr_spawnsimple" ) > 0 )
        return _id_40D8( var_0 );

    spawnlogic_begin();
    initweights( var_0 );
    var_2 = spawnstruct();
    getallalliedandenemyplayers( var_2 );
    var_3 = var_2.allies.size + var_2._id_31CA.size;
    var_4 = 2;
    var_5 = self.pers["team"];
    var_6 = maps\mp\_utility::getotherteam( var_5 );

    for ( var_7 = 0; var_7 < var_0.size; var_7++ )
    {
        var_8 = var_0[var_7];

        if ( var_8.numplayersatlastupdate > 0 )
        {
            var_9 = var_8.distsum[var_5];
            var_10 = var_8.distsum[var_6];
            var_8.weight = ( var_10 - var_4 * var_9 ) / var_8.numplayersatlastupdate;
            continue;
        }

        var_8.weight = 0;
    }

    if ( isdefined( var_1 ) )
    {
        for ( var_7 = 0; var_7 < var_1.size; var_7++ )
            var_1[var_7].weight += 25000;
    }

    avoidsamespawn( var_0 );
    avoidspawnreuse( var_0, 1 );
    avoidweapondamage( var_0 );
    avoidvisibleenemies( var_0, 1 );
    var_11 = getspawnpoint_final( var_0 );
    return var_11;
}

getspawnpoint_dm( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    spawnlogic_begin();
    initweights( var_0 );
    var_1 = getallotherplayers();
    var_2 = 1600;
    var_3 = 1200;

    if ( var_1.size > 0 )
    {
        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            var_5 = 0;
            var_6 = 0;

            for ( var_7 = 0; var_7 < var_1.size; var_7++ )
            {
                var_8 = distance( var_0[var_4].origin, var_1[var_7].origin );

                if ( var_8 < var_3 )
                    var_6 += ( var_3 - var_8 ) / var_3;

                var_9 = abs( var_8 - var_2 );
                var_5 += var_9;
            }

            var_10 = var_5 / var_1.size;
            var_11 = ( var_2 - var_10 ) / var_2;
            var_0[var_4].weight = var_11 - var_6 * 2 + randomfloat( 0.2 );
        }
    }

    avoidsamespawn( var_0 );
    avoidspawnreuse( var_0, 0 );
    avoidweapondamage( var_0 );
    avoidvisibleenemies( var_0, 0 );
    return getspawnpoint_final( var_0 );
}

spawnlogic_begin()
{

}

ispointvulnerable( var_0 )
{
    var_1 = self.origin + level.claymoremodelcenteroffset;
    var_2 = var_0 + ( 0.0, 0.0, 32.0 );
    var_3 = distancesquared( var_1, var_2 );
    var_4 = anglestoforward( self.angles );

    if ( var_3 < level.claymoredetectionradius * level.claymoredetectionradius )
    {
        var_5 = vectornormalize( var_2 - var_1 );
        var_6 = acos( vectordot( var_5, var_4 ) );

        if ( var_6 < level.claymoredetectionconeangle )
            return 1;
    }

    return 0;
}

avoidweapondamage( var_0 )
{
    if ( getdvar( "scr_spawnpointnewlogic" ) == "0" )
        return;

    var_1 = 100000;

    if ( getdvar( "scr_spawnpointweaponpenalty" ) != "" && getdvar( "scr_spawnpointweaponpenalty" ) != "0" )
        var_1 = getdvarfloat( "scr_spawnpointweaponpenalty" );

    var_2 = 62500;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        for ( var_4 = 0; var_4 < level._id_4407.size; var_4++ )
        {
            if ( !isdefined( level._id_4407[var_4] ) )
                continue;

            if ( distancesquared( var_0[var_3].origin, level._id_4407[var_4].origin ) < var_2 )
                var_0[var_3].weight -= var_1;
        }

        if ( !isdefined( level.artillerydangercenters ) )
            continue;

        var_5 = maps\mp\gametypes\_hardpoints::_id_3EE6( var_0[var_3].origin );

        if ( var_5 > 0 )
        {
            var_6 = var_5 * var_1;
            var_0[var_3].weight -= var_6;
        }
    }
}

spawnperframeupdate()
{
    var_0 = 0;
    var_1 = undefined;
    var_2 = 0;
    var_3 = 0;
    var_4 = 1;

    for (;;)
    {
        if ( var_4 )
        {
            wait 0.05;
            var_2 = 0;
            var_3 = 0;
        }

        if ( !isdefined( level._id_8A01 ) )
            return;

        var_0 = ( var_0 + 1 ) % level._id_8A01.size;
        var_5 = level._id_8A01[var_0];

        if ( level.teambased )
        {
            var_5.sights["axis"] = 0;
            var_5.sights["allies"] = 0;
            var_5._id_606E["axis"] = [];
            var_5._id_606E["allies"] = [];
        }
        else
        {
            var_5.sights = 0;
            var_5._id_606E["all"] = [];
        }

        var_6 = var_5.forward;
        var_5.distsum["all"] = 0;
        var_5.distsum["allies"] = 0;
        var_5.distsum["axis"] = 0;
        var_5.numplayersatlastupdate = 0;
        var_7 = 0;

        for ( var_8 = 0; var_8 < level.players.size; var_8++ )
        {
            var_9 = level.players[var_8];

            if ( var_9.sessionstate != "playing" )
                continue;

            var_7++;
            var_10 = var_9.origin - var_5.origin;
            var_11 = length( var_10 );
            var_12 = "all";

            if ( level.teambased )
                var_12 = var_9.pers["team"];

            if ( var_11 < 1024 )
                var_5._id_606E[var_12][var_5._id_606E[var_12].size] = var_9;

            var_5.distsum[var_12] += var_11;
            var_5.numplayersatlastupdate++;
            var_13 = anglestoforward( var_9.angles );

            if ( vectordot( var_6, var_10 ) < 0 && vectordot( var_13, var_10 ) > 0 )
                continue;

            var_2++;
            var_14 = legacybullettracepassed( var_9.origin + ( 0.0, 0.0, 50.0 ), var_5._id_856B, var_5 );
            var_5.lastsighttracetime = gettime();

            if ( var_14 )
            {
                if ( level.teambased )
                {
                    var_5.sights[var_9.pers["team"]]++;
                    continue;
                }

                var_5.sights++;
            }
        }

        var_3++;
        var_15 = var_3 == level._id_8A01.size;
        var_16 = var_2 + var_7 > getdvarint( "legacySpawningMaxTraces", 18 );
        var_4 = var_15 || var_16;
    }
}

legacybullettracepassed( var_0, var_1, var_2 )
{
    var_3 = getdvarfloat( "legacySpawningSightFrac", 1.0 );

    if ( var_3 >= 1.0 )
        return bullettracepassed( var_0, var_1, 0, undefined );
    else
        return spawnsighttrace( var_2, var_0, var_1, var_2.index ) >= var_3;
}

getlospenalty()
{
    if ( getdvar( "scr_spawnpointlospenalty" ) != "" && getdvar( "scr_spawnpointlospenalty" ) != "0" )
        return getdvarfloat( "scr_spawnpointlospenalty" );

    return 100000;
}

lastminutesighttraces( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = maps\mp\_utility::getotherteam( self.pers["team"] );

    if ( !isdefined( var_0._id_606E ) )
        return 0;

    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    for ( var_6 = 0; var_6 < var_0._id_606E[var_1].size; var_6++ )
    {
        var_7 = var_0._id_606E[var_1][var_6];

        if ( !isdefined( var_7 ) )
            continue;

        if ( var_7.sessionstate != "playing" )
            continue;

        if ( var_7 == self )
            continue;

        var_8 = distancesquared( var_0.origin, var_7.origin );

        if ( !isdefined( var_2 ) || var_8 < var_3 )
        {
            var_4 = var_2;
            var_5 = var_3;
            var_2 = var_7;
            var_3 = var_8;
            continue;
        }

        if ( !isdefined( var_4 ) || var_8 < var_5 )
        {
            var_4 = var_7;
            var_5 = var_8;
        }
    }

    if ( isdefined( var_2 ) )
    {
        if ( legacybullettracepassed( var_2.origin + ( 0.0, 0.0, 50.0 ), var_0._id_856B, var_0 ) )
            return 1;
    }

    if ( isdefined( var_4 ) )
    {
        if ( legacybullettracepassed( var_4.origin + ( 0.0, 0.0, 50.0 ), var_0._id_856B, var_0 ) )
            return 1;
    }

    return 0;
}

avoidvisibleenemies( var_0, var_1 )
{
    if ( getdvar( "scr_spawnpointnewlogic" ) == "0" )
        return;

    var_2 = getlospenalty();
    var_3 = "axis";

    if ( self.pers["team"] == "axis" )
        var_3 = "allies";

    if ( var_1 || maps\mp\_utility::ishodgepodgemm() )
    {
        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            if ( !isdefined( var_0[var_4].sights ) )
                continue;

            var_5 = var_2 * var_0[var_4].sights[var_3];
            var_0[var_4].weight -= var_5;
        }
    }
    else
    {
        for ( var_4 = 0; var_4 < var_0.size; var_4++ )
        {
            if ( !isdefined( var_0[var_4].sights ) )
                continue;

            var_5 = var_2 * var_0[var_4].sights;
            var_0[var_4].weight -= var_5;
        }
    }
}

avoidspawnreuse( var_0, var_1 )
{
    if ( getdvar( "scr_spawnpointnewlogic" ) == "0" )
        return;

    var_2 = gettime();
    var_3 = 10000;
    var_4 = 640000;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        if ( !isdefined( var_0[var_5].lastspawnedplayer ) || !isdefined( var_0[var_5]._id_55DF ) || !isalive( var_0[var_5].lastspawnedplayer ) )
            continue;

        if ( var_0[var_5].lastspawnedplayer == self )
            continue;

        if ( var_1 && var_0[var_5].lastspawnedplayer.pers["team"] == self.pers["team"] )
            continue;

        var_6 = var_2 - var_0[var_5]._id_55DF;

        if ( var_6 < var_3 )
        {
            var_7 = distancesquared( var_0[var_5].lastspawnedplayer.origin, var_0[var_5].origin );

            if ( var_7 < var_4 )
            {
                var_8 = 1000 * ( 1 - var_7 / var_4 ) * ( 1 - var_6 / var_3 );
                var_0[var_5].weight -= var_8;
            }
            else
                var_0[var_5].lastspawnedplayer = undefined;

            continue;
        }

        var_0[var_5].lastspawnedplayer = undefined;
    }
}

avoidsamespawn( var_0 )
{
    if ( getdvar( "scr_spawnpointnewlogic" ) == "0" )
        return;

    if ( !isdefined( self._id_55DD ) )
        return;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] == self._id_55DD )
        {
            var_0[var_1].weight -= 50000;
            break;
        }
    }
}
