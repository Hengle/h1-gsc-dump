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

setParent( var_0 )
{
    if ( isdefined( self.parent ) && self.parent == var_0 )
        return;

    if ( isdefined( self.parent ) )
        self.parent removechild( self );

    self.parent = var_0;
    self.parent addchild( self );

    if ( isdefined( self.point ) )
        setpoint( self.point, self.relativePoint, self.xoffset, self.yoffset );
    else
        setpoint( "TOPLEFT" );
}

getParent()
{
    return self.parent;
}

addchild( var_0 )
{
    var_0.index = self.children.size;
    self.children[self.children.size] = var_0;
}

removechild( var_0 )
{
    var_0.parent = undefined;

    if ( self.children[self.children.size - 1] != var_0 )
    {
        self.children[var_0.index] = self.children[self.children.size - 1];
        self.children[var_0.index].index = var_0.index;
    }

    self.children[self.children.size - 1] = undefined;
    var_0.index = undefined;
}

setpoint( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_5 = getParent();

    if ( var_4 )
        self moveovertime( var_4 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self.xoffset = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self.yoffset = var_3;
    self.point = var_0;
    self.alignx = "center";
    self.aligny = "middle";

    if ( issubstr( var_0, "TOP" ) )
        self.aligny = "top";

    if ( issubstr( var_0, "BOTTOM" ) )
        self.aligny = "bottom";

    if ( issubstr( var_0, "LEFT" ) )
        self.alignx = "left";

    if ( issubstr( var_0, "RIGHT" ) )
        self.alignx = "right";

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    self.relativePoint = var_1;
    var_6 = "center_adjustable";
    var_7 = "middle";

    if ( issubstr( var_1, "TOP" ) )
        var_7 = "top_adjustable";

    if ( issubstr( var_1, "BOTTOM" ) )
        var_7 = "bottom_adjustable";

    if ( issubstr( var_1, "LEFT" ) )
        var_6 = "left_adjustable";

    if ( issubstr( var_1, "RIGHT" ) )
        var_6 = "right_adjustable";

    if ( var_5 == level.uiparent )
    {
        self.horzalign = var_6;
        self.vertalign = var_7;
    }
    else
    {
        self.horzalign = var_5.horzalign;
        self.vertalign = var_5.vertalign;
    }

    if ( maps\mp\_utility::strip_suffix( var_6, "_adjustable" ) == var_5.alignx )
    {
        var_8 = 0;
        var_9 = 0;
    }
    else if ( var_6 == "center" || var_5.alignx == "center" )
    {
        var_8 = int( var_5.width / 2 );

        if ( var_6 == "left_adjustable" || var_5.alignx == "right" )
            var_9 = -1;
        else
            var_9 = 1;
    }
    else
    {
        var_8 = var_5.width;

        if ( var_6 == "left_adjustable" )
            var_9 = -1;
        else
            var_9 = 1;
    }

    self.x = var_5.x + var_8 * var_9;

    if ( maps\mp\_utility::strip_suffix( var_7, "_adjustable" ) == var_5.aligny )
    {
        var_10 = 0;
        var_11 = 0;
    }
    else if ( var_7 == "middle" || var_5.aligny == "middle" )
    {
        var_10 = int( var_5.height / 2 );

        if ( var_7 == "top_adjustable" || var_5.aligny == "bottom" )
            var_11 = -1;
        else
            var_11 = 1;
    }
    else
    {
        var_10 = var_5.height;

        if ( var_7 == "top_adjustable" )
            var_11 = -1;
        else
            var_11 = 1;
    }

    self.y = var_5.y + var_10 * var_11;
    self.x += self.xoffset;
    self.y += self.yoffset;

    switch ( self.elemtype )
    {
        case "bar":
            setpointbar( var_0, var_1, var_2, var_3 );
            break;
    }

    updatechildren();
}

setpointbar( var_0, var_1, var_2, var_3 )
{
    self.bar.horzalign = self.horzalign;
    self.bar.vertalign = self.vertalign;
    self.bar.alignx = "left";
    self.bar.aligny = self.aligny;
    self.bar.y = self.y;

    if ( self.alignx == "left" )
        self.bar.x = self.x;
    else if ( self.alignx == "right" )
        self.bar.x = self.x - self.width;
    else
        self.bar.x = self.x - int( self.width / 2 );

    if ( self.aligny == "top" )
        self.bar.y = self.y;
    else if ( self.aligny == "bottom" )
        self.bar.y = self.y;

    updatebar( self.bar.frac );
}

updatebar( var_0, var_1 )
{
    if ( self.elemtype == "bar" )
        updatebarscale( var_0, var_1 );
}

updatebarscale( var_0, var_1 )
{
    var_2 = int( self.width * var_0 + 0.5 );

    if ( !var_2 )
        var_2 = 1;

    self.bar.frac = var_0;
    self.bar setshader( self.bar.shader, var_2, self.height );

    if ( isdefined( var_1 ) && var_2 < self.width )
    {
        if ( var_1 > 0 )
            self.bar scaleovertime( ( 1 - var_0 ) / var_1, self.width, self.height );
        else if ( var_1 < 0 )
            self.bar scaleovertime( var_0 / -1 * var_1, 1, self.height );
    }

    self.bar.rateofchange = var_1;
    self.bar.lastupdatetime = gettime();
}

createfontstring( var_0, var_1 )
{
    var_2 = newclienthudelem( self );
    var_2.elemtype = "font";
    var_2.font = var_0;
    var_2.fontscale = var_1;
    var_2.basefontscale = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2.width = 0;
    var_2.height = int( level._id_397D * var_1 );
    var_2.xoffset = 0;
    var_2.yoffset = 0;
    var_2.children = [];
    var_2 setParent( level.uiparent );
    var_2.hidden = 0;
    return var_2;
}

createserverfontstring( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = newteamhudelem( var_2 );
    else
        var_3 = newhudelem();

    var_3.elemtype = "font";
    var_3.font = var_0;
    var_3.fontscale = var_1;
    var_3.basefontscale = var_1;
    var_3.x = 0;
    var_3.y = 0;
    var_3.width = 0;
    var_3.height = int( level._id_397D * var_1 );
    var_3.xoffset = 0;
    var_3.yoffset = 0;
    var_3.children = [];
    var_3 setParent( level.uiparent );
    var_3.hidden = 0;
    return var_3;
}

createservertimer( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = newteamhudelem( var_2 );
    else
        var_3 = newhudelem();

    var_3.elemtype = "timer";
    var_3.font = var_0;
    var_3.fontscale = var_1;
    var_3.basefontscale = var_1;
    var_3.x = 0;
    var_3.y = 0;
    var_3.width = 0;
    var_3.height = int( level._id_397D * var_1 );
    var_3.xoffset = 0;
    var_3.yoffset = 0;
    var_3.children = [];
    var_3 setParent( level.uiparent );
    var_3.hidden = 0;
    return var_3;
}

createtimer( var_0, var_1 )
{
    var_2 = newclienthudelem( self );
    var_2.elemtype = "timer";
    var_2.font = var_0;
    var_2.fontscale = var_1;
    var_2.basefontscale = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2.width = 0;
    var_2.height = int( level._id_397D * var_1 );
    var_2.xoffset = 0;
    var_2.yoffset = 0;
    var_2.children = [];
    var_2 setParent( level.uiparent );
    var_2.hidden = 0;
    return var_2;
}

createIcon( var_0, var_1, var_2 )
{
    var_3 = newclienthudelem( self );
    var_3.elemtype = "icon";
    var_3.x = 0;
    var_3.y = 0;
    var_3.width = var_1;
    var_3.height = var_2;
    var_3.basewidth = var_3.width;
    var_3.baseheight = var_3.height;
    var_3.xoffset = 0;
    var_3.yoffset = 0;
    var_3.children = [];
    var_3 setParent( level.uiparent );
    var_3.hidden = 0;

    if ( isdefined( var_0 ) )
    {
        var_3 setshader( var_0, var_1, var_2 );
        var_3.shader = var_0;
    }

    return var_3;
}

createServerIcon( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        var_4 = newteamhudelem( var_3 );
    else
        var_4 = newhudelem();

    var_4.elemtype = "icon";
    var_4.x = 0;
    var_4.y = 0;
    var_4.width = var_1;
    var_4.height = var_2;
    var_4.basewidth = var_4.width;
    var_4.baseheight = var_4.height;
    var_4.xoffset = 0;
    var_4.yoffset = 0;
    var_4.children = [];
    var_4 setParent( level.uiparent );
    var_4.hidden = 0;

    if ( isdefined( var_0 ) )
    {
        var_4 setshader( var_0, var_1, var_2 );
        var_4.shader = var_0;
    }

    return var_4;
}

createServerBar( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_4 ) )
        var_6 = newteamhudelem( var_4 );
    else
        var_6 = newhudelem();

    var_6.x = 0;
    var_6.y = 0;
    var_6.frac = 0;
    var_6.color = var_0;
    var_6.sort = -2;
    var_6.shader = "progress_bar_fill";
    var_6 setshader( "progress_bar_fill", var_1, var_2 );
    var_6.hidden = 0;

    if ( isdefined( var_3 ) )
        var_6.flashFarc = var_3;

    if ( isdefined( var_4 ) )
        var_7 = newteamhudelem( var_4 );
    else
        var_7 = newhudelem();

    var_7.elemtype = "bar";
    var_7.x = 0;
    var_7.y = 0;
    var_7.width = var_1;
    var_7.height = var_2;
    var_7.xoffset = 0;
    var_7.yoffset = 0;
    var_7.bar = var_6;
    var_7.children = [];
    var_7.sort = -3;
    var_7.color = ( 0.0, 0.0, 0.0 );
    var_7.alpha = 0.5;
    var_7 setParent( level.uiparent );
    var_7 setshader( "progress_bar_bg", var_1, var_2 );
    var_7.hidden = 0;
    return var_7;
}

createBar( var_0, var_1, var_2, var_3 )
{
    var_4 = newclienthudelem( self );
    var_4.x = 0;
    var_4.y = 0;
    var_4.frac = 0;
    var_4.color = var_0;
    var_4.sort = -2;
    var_4.shader = "progress_bar_fill";
    var_4 setshader( "progress_bar_fill", var_1, var_2 );
    var_4.hidden = 0;

    if ( isdefined( var_3 ) )
        var_4.flashFarc = var_3;

    var_5 = newclienthudelem( self );
    var_5.elemtype = "bar";
    var_5.width = var_1;
    var_5.height = var_2;
    var_5.xoffset = 0;
    var_5.yoffset = 0;
    var_5.bar = var_4;
    var_5.children = [];
    var_5.sort = -3;
    var_5.color = ( 0.0, 0.0, 0.0 );
    var_5.alpha = 0.5;
    var_5 setParent( level.uiparent );
    var_5 setshader( "progress_bar_bg", var_1 + 4, var_2 + 4 );
    var_5.hidden = 0;
    return var_5;
}

getCurrentFraction()
{
    var_0 = self.bar.frac;

    if ( isdefined( self.bar.rateofchange ) )
    {
        var_0 += ( gettime() - self.bar.lastupdatetime ) * self.bar.rateofchange / 1000;

        if ( var_0 > 1 )
            var_0 = 1;

        if ( var_0 < 0 )
            var_0 = 0;
    }

    return var_0;
}

createPrimaryProgressBar( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( self issplitscreenplayerprimary() )
        var_1 += 20;

    var_2 = createBar( ( 1.0, 1.0, 1.0 ), level.primaryprogressbarwidth, level.primaryprogressbarheight );
    var_2 setpoint( "CENTER", undefined, level.primaryprogressbarx + var_0, level.primaryprogressbary + var_1 );
    return var_2;
}

createPrimaryProgressBarText( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( self issplitscreenplayerprimary() )
        var_1 += 20;

    var_2 = createfontstring( "hudbig", level.primaryprogressbarfontsize );
    var_2 setpoint( "CENTER", undefined, level.primaryprogressbartextx + var_0, level.primaryProgressBarTextY + var_1 );
    var_2.sort = -1;
    return var_2;
}

createTeamProgressBar( var_0 )
{
    var_1 = createServerBar( ( 1.0, 0.0, 0.0 ), level.teamprogressbarwidth, level.teamprogressbarheight, undefined, var_0 );
    var_1 setpoint( "TOP", undefined, 0, level.teamprogressbary );
    return var_1;
}

createTeamProgressBarText( var_0 )
{
    var_1 = createserverfontstring( "default", level.teamprogressbarfontsize, var_0 );
    var_1 setpoint( "TOP", undefined, 0, level.teamprogressbartexty );
    return var_1;
}

setFlashFrac( var_0 )
{
    self.bar.flashFarc = var_0;
}

hideElem()
{
    if ( self.hidden )
        return;

    self.hidden = 1;

    if ( self.alpha != 0 )
        self.alpha = 0;

    if ( self.elemtype == "bar" || self.elemtype == "bar_shader" )
    {
        self.bar.hidden = 1;

        if ( self.bar.alpha != 0 )
            self.bar.alpha = 0;
    }
}

showElem()
{
    if ( !self.hidden )
        return;

    self.hidden = 0;

    if ( self.elemtype == "bar" || self.elemtype == "bar_shader" )
    {
        if ( self.alpha != 0.5 )
            self.alpha = 0.5;

        self.bar.hidden = 0;

        if ( self.bar.alpha != 1 )
            self.bar.alpha = 1;
    }
    else if ( self.alpha != 1 )
        self.alpha = 1;
}

flashThread()
{
    self endon( "death" );

    if ( !self.hidden )
        self.alpha = 1;

    for (;;)
    {
        if ( self.frac >= self.flashFarc )
        {
            if ( !self.hidden )
            {
                self fadeovertime( 0.3 );
                self.alpha = 0.2;
                wait 0.35;
                self fadeovertime( 0.3 );
                self.alpha = 1;
            }

            wait 0.7;
            continue;
        }

        if ( !self.hidden && self.alpha != 1 )
            self.alpha = 1;

        wait 0.05;
    }
}

destroyElem()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < self.children.size; var_1++ )
    {
        if ( isdefined( self.children[var_1] ) )
            var_0[var_0.size] = self.children[var_1];
    }

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] setParent( getParent() );

    if ( self.elemtype == "bar" || self.elemtype == "bar_shader" )
        self.bar destroy();

    self destroy();
}

setIconShader( var_0 )
{
    self setshader( var_0, self.width, self.height );
    self.shader = var_0;
}

getIconShader( var_0 )
{
    return self.shader;
}

setIconSize( var_0, var_1 )
{
    self setshader( self.shader, var_0, var_1 );
}

setWidth( var_0 )
{
    self.width = var_0;
}

setHeight( var_0 )
{
    self.height = var_0;
}

setSize( var_0, var_1 )
{
    self.width = var_0;
    self.height = var_1;
}

updatechildren()
{
    for ( var_0 = 0; var_0 < self.children.size; var_0++ )
    {
        var_1 = self.children[var_0];
        var_1 setpoint( var_1.point, var_1.relativePoint, var_1.xoffset, var_1.yoffset );
    }
}

transitionReset()
{
    self.x = self.xoffset;
    self.y = self.yoffset;

    if ( self.elemtype == "font" )
    {
        self.fontscale = self.basefontscale;
        self.label = &"";
    }
    else if ( self.elemtype == "icon" )
        self setshader( self.shader, self.width, self.height );

    self.alpha = 0;
}

transitionZoomIn( var_0 )
{
    switch ( self.elemtype )
    {
        case "timer":
        case "font":
            self.fontscale = 6.3;
            self changefontscaleovertime( var_0 );
            self.fontscale = self.basefontscale;
            break;
        case "icon":
            self setshader( self.shader, self.width * 6, self.height * 6 );
            self scaleovertime( var_0, self.width, self.height );
            break;
    }
}

transitionPulseFXIn( var_0, var_1 )
{
    var_2 = int( var_0 ) * 1000;
    var_3 = int( var_1 ) * 1000;

    switch ( self.elemtype )
    {
        case "timer":
        case "font":
            self setpulsefx( var_2 + 250, var_3 + var_2, var_2 + 250 );
            break;
        default:
            break;
    }
}

transitionSlideIn( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "left";

    switch ( var_1 )
    {
        case "left":
            self.x += 1000;
            break;
        case "right":
            self.x -= 1000;
            break;
        case "up":
            self.y -= 1000;
            break;
        case "down":
            self.y += 1000;
            break;
    }

    self moveovertime( var_0 );
    self.x = self.xoffset;
    self.y = self.yoffset;
}

transitionSlideOut( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "left";

    var_2 = self.xoffset;
    var_3 = self.yoffset;

    switch ( var_1 )
    {
        case "left":
            var_2 += 1000;
            break;
        case "right":
            var_2 -= 1000;
            break;
        case "up":
            var_3 -= 1000;
            break;
        case "down":
            var_3 += 1000;
            break;
    }

    self.alpha = 1;
    self moveovertime( var_0 );
    self.x = var_2;
    self.y = var_3;
}

transitionZoomOut( var_0 )
{
    switch ( self.elemtype )
    {
        case "timer":
        case "font":
            self changefontscaleovertime( var_0 );
            self.fontscale = 6.3;
        case "icon":
            self scaleovertime( var_0, self.width * 6, self.height * 6 );
            break;
    }
}

transitionFadeIn( var_0 )
{
    self fadeovertime( var_0 );

    if ( isdefined( self.maxAlpha ) )
        self.alpha = self.maxAlpha;
    else
        self.alpha = 1;
}

transitionFadeOut( var_0 )
{
    self fadeovertime( 0.15 );
    self.alpha = 0;
}

_id_51D6( var_0 )
{
    if ( issubstr( var_0, "ch_limited" ) )
        return 1;

    return 0;
}

_id_5206( var_0 )
{
    if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_kills" ) )
        return 1;

    if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_hipfirekills" ) )
        return 1;

    if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_headShots" ) )
        return 1;

    return 0;
}

getDailyRef( var_0 )
{
    if ( _id_5206( var_0 ) )
        return _id_6FFE( var_0 );
    else if ( maps\mp\_utility::_id_51BA( var_0, "ch_daily_" ) )
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeProgress", "ch_daily" );
    else
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeProgress", var_0 );
}

_id_1C4D( var_0 )
{
    if ( _id_5206( var_0 ) )
        return _id_6FFF( var_0 );
    else if ( maps\mp\_utility::_id_51BA( var_0, "ch_daily_" ) )
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeState", "ch_daily" );
    else
        return self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeState", var_0 );
}

_id_1C53( var_0, var_1 )
{
    if ( _id_5206( var_0 ) )
        return;

    var_2 = var_1;

    if ( maps\mp\_utility::_id_51BA( var_0, "ch_daily_" ) )
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeProgress", "ch_daily", var_2 );
    else
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeProgress", var_0, var_2 );
}

_id_1C54( var_0, var_1 )
{
    if ( _id_5206( var_0 ) )
        return;

    if ( maps\mp\_utility::_id_51BA( var_0, "ch_daily_" ) )
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeState", "ch_daily", var_1 );
    else
        self setcommonplayerdata( common_scripts\utility::getstatsgroup_ranked(), "challengeState", var_0, var_1 );
}

_id_1C4E( var_0, var_1 )
{
    var_2 = tablelookup( "mp/allChallengesTable.csv", 0, var_0, 10 + ( var_1 - 1 ) * 2 );

    if ( isdefined( var_2 ) && var_2 != "" )
        return int( var_2 );

    return 0;
}

_id_2B5E( var_0, var_1, var_2, var_3 )
{
    var_4 = createfontstring( "hudbig", var_2 );
    var_4 setpoint( "CENTER", "CENTER", 0, var_1 );
    var_4.sort = 1001;
    var_4.color = ( 1.0, 1.0, 1.0 );
    var_4.foreground = 0;
    var_4.hidewheninmenu = 1;
    var_4 settext( var_0 );
    common_scripts\utility::_id_A069( var_3, "joined_team", "death" );

    if ( isdefined( var_4 ) )
        var_4 destroyElem();
}

_id_6FFE( var_0 )
{
    if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_hipfirekills" ) )
        return _id_93F6( var_0, "hipfirekills" );
    else if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_kills" ) )
        return _id_93F6( var_0, "kills" );
    else if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_headShots" ) )
        return _id_93F6( var_0, "headShots" );
}

_id_6FFF( var_0 )
{
    var_1 = _id_6FFE( var_0 );
    var_2 = 1;

    for ( var_3 = _id_1C4E( var_0, var_2 ); var_3 > 0 && var_1 >= var_3; var_3 = _id_1C4E( var_0, var_2 ) )
        var_2++;

    return var_2;
}

_id_93F6( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = 0;
    var_4 = strtok( var_0, "_" );

    for ( var_5 = 0; var_5 < var_4.size - 1; var_5++ )
    {
        if ( var_4[var_5] == var_1 )
        {
            var_2 = var_4[var_5 + 1];
            break;
        }
    }

    if ( isdefined( var_2 ) )
    {
        for ( var_6 = tablelookuprownum( "mp/statstable.csv", 59, var_2 ); var_6 >= 0; var_6 = tablelookuprownum( "mp/statstable.csv", 59, var_2, var_6 - 1 ) )
        {
            var_7 = tablelookupbyrow( "mp/statstable.csv", var_6, 4 );
            var_3 += self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "weaponStats", var_7, var_1 );
        }

        if ( var_1 == "kills" && isdefined( self._id_94FA ) )
            var_3 += self._id_94FA;

        if ( var_1 == "hipfirekills" && isdefined( self._id_94F8 ) )
            var_3 += self._id_94F8;

        if ( var_1 == "headShots" && isdefined( self._id_94F7 ) )
            var_3 += self._id_94F7;

        var_8 = self getrankedplayerdata( common_scripts\utility::getstatsgroup_ranked(), "attachUnlock_" + var_1, var_2 );

        if ( var_8 > var_3 )
            var_8 = 0;

        return var_3 - var_8;
    }
}
