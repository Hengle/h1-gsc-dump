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
    self.animtree = "";
    self.additionalassets = "";
    self.team = "allies";
    self.type = "human";
    self._id_8F7D = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "usp";
    self._id_855D = "usp";

    if ( isai( self ) )
    {
        self _meth_8170( 256.0, 0.0 );
        self _meth_8171( 768.0, 1024.0 );
    }

    self.weapon = "m16_basic";

    switch ( codescripts\character::_id_3E43( 12 ) )
    {
        case 0:
            character\character_sp_sas_woodland_colon_a::main();
            break;
        case 1:
            character\character_sp_sas_woodland_colon_b::main();
            break;
        case 2:
            character\character_sp_sas_woodland_colon_c::main();
            break;
        case 3:
            character\character_sp_sas_woodland_colon_d::main();
            break;
        case 4:
            character\character_sp_sas_woodland_colon_e::main();
            break;
        case 5:
            character\character_sp_sas_woodland_colon_f::main();
            break;
        case 6:
            character\character_sp_sas_woodland_golden_a::main();
            break;
        case 7:
            character\character_sp_sas_woodland_golden_b::main();
            break;
        case 8:
            character\character_sp_sas_woodland_golden_c::main();
            break;
        case 9:
            character\character_sp_sas_woodland_golden_d::main();
            break;
        case 10:
            character\character_sp_sas_woodland_golden_e::main();
            break;
        case 11:
            character\character_sp_sas_woodland_golden_f::main();
            break;
    }
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\character_sp_sas_woodland_colon_a::precache();
    character\character_sp_sas_woodland_colon_b::precache();
    character\character_sp_sas_woodland_colon_c::precache();
    character\character_sp_sas_woodland_colon_d::precache();
    character\character_sp_sas_woodland_colon_e::precache();
    character\character_sp_sas_woodland_colon_f::precache();
    character\character_sp_sas_woodland_golden_a::precache();
    character\character_sp_sas_woodland_golden_b::precache();
    character\character_sp_sas_woodland_golden_c::precache();
    character\character_sp_sas_woodland_golden_d::precache();
    character\character_sp_sas_woodland_golden_e::precache();
    character\character_sp_sas_woodland_golden_f::precache();
    precacheitem( "m16_basic" );
    precacheitem( "usp" );
    precacheitem( "usp" );
    precacheitem( "fraggrenade" );
}
