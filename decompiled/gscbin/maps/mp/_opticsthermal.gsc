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

_id_6542()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    if ( isagent( self ) )
        return;

    var_0 = 0.65;
    self._id_6543 = 0;
    self._id_6578 = 0;
    self.has_opticsthermal = 0;

    for (;;)
    {
        var_1 = !self.has_opticsthermal;
        var_1 |= ( self.has_opticsthermal && self playerads() < var_0 );
        var_1 |= self isusingturret();
        var_1 |= self._id_6578;

        if ( var_1 )
            _id_6541( self );
        else
            _id_6540( self, 0.05 );

        wait 0.05;
    }
}

_id_6540( var_0, var_1 )
{
    if ( var_0._id_6543 )
        return;

    var_0 _meth_84a5( 3 );
    var_0 _meth_84a7( 70, 0, 40, 80 );
    var_0._id_6543 = 1;
}

_id_6541( var_0 )
{
    if ( !var_0._id_6543 )
        return;

    var_0 _meth_84a6();
    var_0._id_6543 = 0;
}
