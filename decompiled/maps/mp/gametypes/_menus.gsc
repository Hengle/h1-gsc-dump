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
    if ( !isdefined( game["gamestarted"] ) )
    {
        game["menu_team"] = "team_marinesopfor";

        if ( level.multiteambased )
            game["menu_team"] = "team_mt_options";

        game["menu_class"] = "class";
        game["menu_class_allies"] = "class_marines";
        game["menu_class_axis"] = "class_opfor";
        game["menu_changeclass_allies"] = "changeclass_marines";
        game["menu_changeclass_axis"] = "changeclass_opfor";

        if ( level.multiteambased )
        {
            for ( var_0 = 0; var_0 < level.teamnamelist.size; var_0++ )
            {
                var_1 = "menu_class_" + level.teamnamelist[var_0];
                var_2 = "menu_changeclass_" + level.teamnamelist[var_0];
                game[var_1] = game["menu_class_allies"];
                game[var_2] = "changeclass_marines";
            }
        }

        game["menu_changeclass"] = "changeclass";

        if ( level.console )
        {
            game["menu_controls"] = "ingame_controls";

            if ( level.splitscreen )
            {
                if ( level.multiteambased )
                {
                    for ( var_0 = 0; var_0 < level.teamnamelist.size; var_0++ )
                    {
                        var_1 = "menu_class_" + level.teamnamelist[var_0];
                        var_2 = "menu_changeclass_" + level.teamnamelist[var_0];
                        game[var_1] += "_splitscreen";
                        game[var_2] += "_splitscreen";
                    }
                }

                game["menu_team"] += "_splitscreen";
                game["menu_class_allies"] += "_splitscreen";
                game["menu_class_axis"] += "_splitscreen";
                game["menu_changeclass_allies"] += "_splitscreen";
                game["menu_changeclass_axis"] += "_splitscreen";
                game["menu_controls"] += "_splitscreen";
                game["menu_changeclass_defaults_splitscreen"] = "changeclass_splitscreen_defaults";
                game["menu_changeclass_custom_splitscreen"] = "changeclass_splitscreen_custom";
            }
        }

        precachestring( &"MP_HOST_ENDED_GAME" );
        precachestring( &"MP_HOST_ENDGAME_RESPONSE" );
    }

    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_A21E();
        var_0 thread watchforopenteamselectmenu();
        var_0 thread _id_A22B();
        var_0 thread _id_A226();
        var_0 thread _id_2149();
        var_0 maps\mp\gametypes\_class::cac_setlastenvironment( getmapcustom( "environment" ) );
    }
}

_id_2149()
{

}

_id_3F31( var_0 )
{
    if ( var_0 <= 100 )
        var_0 = "custom" + var_0;
    else if ( var_0 <= 200 )
    {
        var_0 -= 101;
        var_0 = "class" + var_0;
    }
    else if ( var_0 <= 206 )
    {
        var_0 -= 200;
        var_0 = "axis_recipe" + var_0;
    }
    else
    {
        var_0 -= 206;
        var_0 = "allies_recipe" + var_0;
    }

    return var_0;
}

_id_A21E()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "class_select" )
            continue;

        if ( maps\mp\_utility::_id_5155() && self _meth_842d() && !maps\mp\_utility::_id_4FA6() )
        {
            self setclientomnvar( "ui_options_menu", 0 );
            continue;
        }

        if ( !istestclient( self ) && !isai( self ) )
        {
            if ( "" + var_1 != "callback" )
                self setclientomnvar( "ui_loadout_selected", var_1 );
        }

        if ( isdefined( self._id_A04C ) && self._id_A04C )
            continue;

        if ( !maps\mp\_utility::_id_0AA2() )
            continue;

        self setclientomnvar( "ui_options_menu", 0 );

        if ( "" + var_1 != "callback" )
        {
            if ( isbot( self ) || istestclient( self ) )
            {
                self.pers["class"] = var_1;
                self.class = var_1;
                maps\mp\gametypes\_class::_id_1EE7();
            }
            else
            {
                var_2 = var_1 + 1;
                var_2 = _id_3F31( var_2 );

                if ( !isdefined( self.pers["class"] ) || var_2 == self.pers["class"] )
                    continue;

                self.pers["class"] = var_2;
                self.class = var_2;
                maps\mp\gametypes\_class::_id_1EE7();
                maps\mp\gametypes\_class::cac_setlastclassindex( var_1 + 1 );
                maps\mp\gametypes\_class::cac_setlastgrouplocation( getdvarint( "xblive_privatematch" ) );
                thread _id_5BB2( 0 );
            }

            continue;
        }

        _id_5BB1( "callback" );
    }
}

_id_A226()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "end_game" )
            continue;

        level thread maps\mp\gametypes\_gamelogic::_id_39BC();
    }
}

teamchangeisfactionchange()
{
    return self.sessionstate == "playing" && level.gametype == "dm";
}

watchforopenteamselectmenu()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0 );

        if ( var_0 != "open_team_select_menu" )
            continue;

        var_1 = maps\mp\gametypes\_tweakables::_id_4142( "game", "spectatetype" );

        if ( var_1 > 0 )
            maps\mp\_utility::streamnextspectatorweaponsifnecessary( 0 );
    }
}

_id_A22B()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "team_select" )
            continue;

        if ( maps\mp\_utility::_id_59E3() && !getdvarint( "force_ranking" ) && !self _meth_8586() )
            continue;

        if ( var_1 != 3 && !teamchangeisfactionchange() && maps\mp\_utility::_id_0AA2() )
            thread _id_851C();

        if ( var_1 == 3 )
        {
            self setclientomnvar( "ui_options_menu", 0 );
            self setclientomnvar( "ui_spectator_selected", 1 );
            self setclientomnvar( "ui_loadout_selected", -1 );
            self._id_8A4B = 1;

            if ( maps\mp\_utility::_id_5155() )
            {
                self _meth_84fd( 1 );
                self setclientomnvar( "ui_use_mlg_hud", 1 );
                thread maps\mp\gametypes\_spectating::_id_8019();
            }

            if ( teamchangeisfactionchange() && isdefined( self.addtoteam ) )
                self.addtoteam = undefined;
        }
        else
        {
            self setclientomnvar( "ui_spectator_selected", -1 );
            self._id_8A4B = 0;

            if ( maps\mp\_utility::_id_5155() )
            {
                self _meth_84fd( 0 );
                self setclientomnvar( "ui_use_mlg_hud", 0 );
            }

            if ( teamchangeisfactionchange() || !maps\mp\_utility::_id_0AA2() )
                thread maps\mp\gametypes\_playerlogic::_id_803C( -1 );
        }

        if ( var_1 == 0 )
            var_1 = "axis";
        else if ( var_1 == 1 )
            var_1 = "allies";
        else if ( var_1 == 2 )
            var_1 = "random";
        else
            var_1 = "spectator";

        if ( isdefined( self.pers["team"] ) && var_1 == self.pers["team"] )
        {
            if ( teamchangeisfactionchange() && isdefined( self.addtoteam ) )
                self.addtoteam = undefined;

            self notify( "selected_same_team" );
            continue;
        }

        if ( getdvarint( "scr_lua_splashes" ) )
            self _meth_8561( &"clear_notification_queue", 0 );

        self setclientomnvar( "ui_loadout_selected", -1 );

        if ( var_1 == "axis" )
        {
            thread _id_8027( "axis" );
            continue;
        }

        if ( var_1 == "allies" )
        {
            thread _id_8027( "allies" );
            continue;
        }

        if ( var_1 == "random" )
        {
            self thread [[ level._id_112A ]]();
            continue;
        }

        if ( var_1 == "spectator" )
            thread _id_801A();
    }
}

_id_851C()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    common_scripts\utility::_id_A069( "joined_team", "selected_same_team" );

    if ( maps\mp\_utility::ishodgepodgeph() && !maps\mp\_utility::_id_0AA2() )
        return;

    self setclientomnvar( "ui_options_menu", 2 );
}

_id_112A()
{
    if ( maps\mp\_utility::iscoop() )
    {
        thread _id_8027( "allies" );
        self.sessionteam = "allies";
    }
    else if ( self _meth_842d() && !maps\mp\_utility::_id_4FA6() )
        thread _id_801A();
    else
    {
        var_0 = isdefined( self.team ) && self.team == "axis";
        var_1 = isdefined( self.team ) && self.team == "allies";

        if ( level._id_91ED["axis"] < level._id_91ED["allies"] && !var_0 )
        {
            thread _id_8027( "axis" );
            return;
        }

        if ( level._id_91ED["allies"] < level._id_91ED["axis"] && !var_1 )
        {
            thread _id_8027( "allies" );
            return;
        }

        if ( level._id_91ED["allies"] == level._id_91ED["axis"] )
        {
            if ( !var_0 && !var_1 )
            {
                var_2 = getteamscore( "allies" );
                var_3 = getteamscore( "axis" );

                if ( var_2 > var_3 && !var_0 )
                    thread _id_8027( "axis" );
                else if ( var_3 > var_2 && !var_1 )
                    thread _id_8027( "allies" );
                else
                    thread _id_8027( common_scripts\utility::_id_710E( [ "allies", "axis" ] ) );
            }
        }
    }
}

_id_8027( var_0 )
{
    self endon( "disconnect" );

    if ( !isai( self ) && level.teambased && !maps\mp\gametypes\_teams::_id_3FDD( var_0 ) )
        return;

    var_1 = level.ingraceperiod && !self._id_4729;

    if ( teamchangeisfactionchange() )
    {
        if ( var_1 )
        {
            addtoteam( var_0, 0, 1 );
            maps\mp\gametypes\_class::cac_setlastteam( var_0 );
        }
        else
            self.addtoteam = var_0;

        thread _id_5BB2( 1 );
    }
    else
    {
        if ( var_1 )
            self._id_4745 = 0;

        if ( self.sessionstate == "playing" )
        {
            self.switching_teams = 1;
            self.joining_team = var_0;
            self.leaving_team = self.pers["team"];
        }

        addtoteam( var_0 );
        maps\mp\gametypes\_class::cac_setlastteam( var_0 );

        if ( self.sessionstate == "playing" )
            self suicide();

        _id_A018();
        _id_31BF();
    }

    if ( self.sessionstate == "spectator" )
    {
        if ( game["state"] == "postgame" )
            return;

        if ( game["state"] == "playing" && !maps\mp\_utility::_id_5129() )
        {
            if ( isdefined( self._id_A04E ) && self._id_A04E )
                return;

            maps\mp\gametypes\_playerlogic::_id_8998();
        }

        thread maps\mp\gametypes\_spectating::_id_8019();
    }
}

_id_801A()
{
    if ( isdefined( self.pers["team"] ) && self.pers["team"] == "spectator" )
        return;

    if ( isalive( self ) )
    {
        self.switching_teams = 1;
        self.joining_team = "spectator";
        self.leaving_team = self.pers["team"];
        self suicide();
    }

    self notify( "becameSpectator" );
    addtoteam( "spectator" );
    self.pers["class"] = undefined;
    self.class = undefined;
    thread maps\mp\gametypes\_playerlogic::_id_8A0E();
}

_id_A018()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_A04C = 1;

    if ( maps\mp\_utility::_id_0AA2() )
    {
        for (;;)
        {
            self waittill( "luinotifyserver", var_0, var_1 );

            if ( var_0 == "class_select" )
                break;
        }

        if ( "" + var_1 != "callback" )
        {
            if ( isbot( self ) || istestclient( self ) )
            {
                self.pers["class"] = var_1;
                self.class = var_1;
                maps\mp\gametypes\_class::_id_1EE7();
            }
            else
            {
                var_1 += 1;
                self.pers["class"] = _id_3F31( var_1 );
                self.class = _id_3F31( var_1 );
                maps\mp\gametypes\_class::_id_1EE7();
                maps\mp\gametypes\_class::cac_setlastclassindex( var_1 );
                maps\mp\gametypes\_class::cac_setlastgrouplocation( getdvarint( "xblive_privatematch" ) );
            }

            self notify( "notWaitingToSelectClass" );
            self._id_A04C = 0;
            return;
        }

        self notify( "notWaitingToSelectClass" );
        self._id_A04C = 0;
        _id_5BB1( "callback" );
        return;
    }
    else
    {
        if ( !isai( self ) && maps\mp\_utility::_id_8510() && ( self _meth_8443( "ui_options_menu" ) == 0 || maps\mp\_utility::ishodgepodgeph() ) )
        {
            thread maps\mp\gametypes\_playerlogic::_id_803C( 3 );

            for (;;)
            {
                self waittill( "luinotifyserver", var_0, var_1 );

                if ( var_0 == "class_select" )
                    break;
            }
        }

        self notify( "notWaitingToSelectClass" );
        self._id_A04C = 0;
        _id_1968();
    }
}

_id_1398( var_0 )
{
    var_1 = self.pers["team"];

    if ( maps\mp\_utility::_id_0AA2() )
    {
        thread maps\mp\gametypes\_playerlogic::_id_803C( 2 );

        if ( !self _meth_842d() || maps\mp\_utility::_id_4FA6() )
            _id_A018();

        _id_31BF();

        if ( self.sessionstate == "spectator" )
        {
            if ( game["state"] == "postgame" )
                return;

            if ( game["state"] == "playing" && !maps\mp\_utility::_id_5129() )
            {
                if ( isdefined( self._id_A04E ) && self._id_A04E )
                    return;

                thread maps\mp\gametypes\_playerlogic::_id_8998();
            }

            thread maps\mp\gametypes\_spectating::_id_8019();
        }

        self.connecttime = gettime();
    }
    else
    {
        thread _id_1968();

        if ( self.sessionstate == "spectator" && maps\mp\_utility::ishodgepodgeph() )
        {
            if ( game["state"] == "postgame" )
                return;

            if ( game["state"] == "playing" && !maps\mp\_utility::_id_5129() )
            {
                if ( isdefined( self._id_A04E ) && self._id_A04E )
                    return;

                thread maps\mp\gametypes\_playerlogic::_id_8998();
            }

            thread maps\mp\gametypes\_spectating::_id_8019();
        }
    }
}

_id_1968()
{
    maps\mp\gametypes\_class::_id_1EE7();
    self._id_7C68 = 1;
    self.class = "class0";

    if ( isdefined( level._id_1969 ) )
        self [[ level._id_1969 ]]();
}

_id_13A1()
{
    thread maps\mp\gametypes\_playerlogic::_id_803C( 1 );
}

_id_851D()
{
    var_0 = self.pers["team"];
    self openpopupmenu( game["menu_class_" + var_0] );
}

_id_5BB5()
{
    if ( isdefined( self.pers["team"] ) && self.pers["team"] == "spectator" )
        return;

    if ( isalive( self ) )
    {
        self.switching_teams = 1;
        self.joining_team = "spectator";
        self.leaving_team = self.pers["team"];
        self suicide();
    }

    addtoteam( "spectator" );
    self.pers["class"] = undefined;
    self.class = undefined;
    maps\mp\gametypes\_class::_id_1EE7();
    thread maps\mp\gametypes\_playerlogic::_id_8A0E();
}

_id_A233( var_0 )
{
    if ( !self._id_4729 )
    {
        self endon( "death" );
        self endon( "disconnect" );
        self endon( "streamClassComplete" );
        level endon( "game_ended" );
        self waittill( "hasDoneCombat" );
        self notify( "endStreamClass" );

        if ( var_0 )
            self clientiprintlnbold( game["strings"]["change_team_cancel"] );
        else
            self clientiprintlnbold( game["strings"]["change_class_cancel"] );

        wait 2.0;

        if ( var_0 )
            self clientiprintlnbold( game["strings"]["change_team"] );
        else
            self clientiprintlnbold( game["strings"]["change_class"] );
    }
}

_id_5BB2( var_0 )
{
    if ( level.ingraceperiod && !self._id_4729 )
    {
        thread maps\mp\gametypes\_playerlogic::streamclass( 1 );

        if ( self._id_1E41 )
        {
            self endon( "death" );
            self endon( "disconnect" );
            level endon( "game_ended" );
            self endon( "endStreamClass" );
            thread _id_A233( var_0 );

            if ( var_0 )
                self clientiprintlnbold( game["strings"]["change_team_wait"] );
            else
                self clientiprintlnbold( game["strings"]["change_class_wait"] );

            self waittill( "streamClassComplete" );
            self clientiprintlnbold( "" );
            self _meth_852b( 0 );
        }

        maps\mp\gametypes\_class::setclass( self.pers["class"] );
        self.tag_stowed_back = undefined;
        self.tag_stowed_hip = undefined;
        maps\mp\gametypes\_class::_id_41F1( self.pers["team"], self.pers["class"] );

        if ( !isdefined( self.spawnplayergivingloadout ) )
        {
            maps\mp\gametypes\_class::applyloadout();
            maps\mp\gametypes\_hardpoints::giveownedhardpointitem();
        }

        if ( maps\mp\_utility::_hasperk( "specialty_moreminimap" ) )
            setomnvar( "ui_minimap_extend_grace_period", 1 );
        else
            setomnvar( "ui_minimap_extend_grace_period", 0 );

        self setclientomnvar( "ui_class_changed_grace_period", 1 );
    }
    else
    {
        maps\mp\gametypes\_playerlogic::streamclass();

        if ( var_0 )
            self clientiprintlnbold( game["strings"]["change_team"] );
        else
            self clientiprintlnbold( game["strings"]["change_class"] );
    }
}

_id_5BB1( var_0 )
{
    var_1 = self.pers["team"];
    var_2 = maps\mp\gametypes\_class::_id_3F31( var_0 );
    var_3 = maps\mp\gametypes\_class::_id_4166( var_0 );

    if ( var_2 == "restricted" )
    {
        _id_1398();
        return;
    }

    if ( isdefined( self.pers["class"] ) && self.pers["class"] == var_2 && ( isdefined( self.pers["primary"] ) && self.pers["primary"] == var_3 ) )
        return;

    if ( maps\mp\_utility::ishodgepodgeph() && game["roundsPlayed"] > 0 )
        return;

    if ( self.sessionstate == "playing" )
    {
        if ( isdefined( self.pers["lastClass"] ) && isdefined( self.pers["class"] ) )
        {
            self.pers["lastClass"] = self.pers["class"];
            self.lastclass = self.pers["lastClass"];
        }

        self.pers["class"] = var_2;
        self.class = var_2;
        maps\mp\gametypes\_class::_id_1EE7();
        self.pers["primary"] = var_3;

        if ( game["state"] == "postgame" )
            return;

        thread _id_5BB2( 0 );
    }
    else
    {
        if ( isdefined( self.pers["lastClass"] ) && isdefined( self.pers["class"] ) )
        {
            self.pers["lastClass"] = self.pers["class"];
            self.lastclass = self.pers["lastClass"];
        }

        self.pers["class"] = var_2;
        self.class = var_2;
        maps\mp\gametypes\_class::_id_1EE7();
        self.pers["primary"] = var_3;

        if ( game["state"] == "postgame" )
            return;

        if ( game["state"] == "playing" && !maps\mp\_utility::_id_5129() )
            thread maps\mp\gametypes\_playerlogic::_id_8998();
    }

    thread maps\mp\gametypes\_spectating::_id_8019();
}

getuiteamindex( var_0 )
{
    if ( var_0 == "allies" )
        return 2;
    else if ( var_0 == "axis" )
        return 1;
}

addtoteam( var_0, var_1, var_2 )
{
    if ( isdefined( self.team ) )
    {
        maps\mp\gametypes\_playerlogic::_id_73AF();

        if ( isdefined( var_2 ) && var_2 )
            maps\mp\gametypes\_playerlogic::_id_275E( self.team );
    }

    self.pers["team"] = var_0;
    self.team = var_0;

    if ( var_0 == "allies" )
    {
        self.lastgameteamchosen = "allies";
        self setclientomnvar( "ui_team_selected", getuiteamindex( "allies" ) );
    }
    else if ( var_0 == "axis" )
    {
        self.lastgameteamchosen = "axis";
        self setclientomnvar( "ui_team_selected", getuiteamindex( "axis" ) );
    }

    if ( !getdvarint( "party_playersCoop", 0 ) && ( !maps\mp\_utility::_id_59E3() || isbot( self ) || istestclient( self ) || !maps\mp\_utility::_id_0AB0() || getdvarint( "force_ranking" ) ) )
    {
        if ( level.teambased )
            self.sessionteam = var_0;
        else if ( var_0 == "spectator" )
            self.sessionteam = "spectator";
        else
            self.sessionteam = "none";
    }

    if ( game["state"] != "postgame" )
    {
        maps\mp\gametypes\_playerlogic::_id_0852();

        if ( isdefined( var_2 ) && var_2 )
            maps\mp\gametypes\_playerlogic::_id_4C3C( self.team );
    }

    maps\mp\_utility::_id_9B42();

    if ( isdefined( var_1 ) && var_1 )
        waitframe;

    maps\mp\_utility::_id_9B33();

    if ( var_0 == "spectator" )
    {
        self notify( "joined_spectators" );
        level notify( "joined_team", self );
    }
    else
    {
        self notify( "joined_team" );
        level notify( "joined_team", self );
    }
}

_id_31BF()
{
    self._id_A04D = 0;
    self notify( "end_respawn" );
}
