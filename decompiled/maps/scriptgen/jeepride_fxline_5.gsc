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

fxline()
{
    maps\jeepride_code::fx_wait_set( 139850, ( -29830.6, -5535.59, 467.572 ), ( 344.687, 287.327, 105.288 ), "tunnelspark", 139850, ( -29833.4, -5525.16, 467.519 ), ( 37.4427, 294.17, 133.791 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139850, ( -29762.8, -5404.77, 449.107 ), ( 56.9928, 169.298, 108.554 ), "tunnelspark", 139900, ( -29764.6, -5464.9, 453.483 ), ( 17.8173, 282.423, -174.212 ), "tunnelspark_dl" );
    maps\jeepride_code::fx_wait_set( 139900, ( -29797.7, -5419.95, 452.182 ), ( 336.575, 173.057, -176.265 ), "tunnelspark_dl", 139900, ( -29779.2, -5425.4, 448.277 ), ( 355.754, 225.988, 176.02 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139900, ( -29789.4, -5487.22, 453.563 ), ( 356.642, 321.404, 169.52 ), "tunnelspark", 139900, ( -29822.3, -5612.31, 467.702 ), ( 313.513, 210.901, -146.135 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139900, ( -29795.4, -5459.88, 452.441 ), ( 355.662, 116.881, -166.091 ), "tunnelspark", 139900, ( -29792.2, -5435.28, 450.521 ), ( 11.9529, 45.2876, -171.63 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139900, ( -29786.8, -5425.57, 449.085 ), ( 358.588, 106.771, -174.357 ), "tunnelspark", 139900, ( -29787.3, -5509.74, 454.368 ), ( 0.0407404, 110.811, -173.117 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139900, ( -29800.4, -5485.26, 454.005 ), ( 8.41986, 28.5721, 172.896 ), "tunnelspark", 139900, ( -29832.6, -5545.34, 467.549 ), ( 344.678, 287.277, 105.307 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139900, ( -29835.3, -5534.92, 467.494 ), ( 37.4315, 294.137, 133.812 ), "tunnelspark", 139900, ( -29764.7, -5414.58, 449.1 ), ( 57.0133, 169.251, 108.553 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139950, ( -29766.5, -5474.71, 453.479 ), ( 17.8097, 282.383, -174.192 ), "tunnelspark_dl", 139950, ( -29799.5, -5429.73, 452.164 ), ( 336.595, 173.011, -176.264 ), "tunnelspark_dl" );
    maps\jeepride_code::fx_wait_set( 139950, ( -29781.1, -5435.2, 448.265 ), ( 355.766, 225.941, 176.037 ), "tunnelspark", 139950, ( -29791.3, -5497.01, 453.551 ), ( 356.624, 321.358, 169.53 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139950, ( -29824.3, -5622.07, 467.686 ), ( 313.529, 210.842, -146.116 ), "tunnelspark", 139950, ( -29797.3, -5469.67, 452.426 ), ( 355.674, 116.836, -166.108 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139950, ( -29794.1, -5445.07, 450.506 ), ( 11.941, 45.2386, -171.647 ), "tunnelspark", 139950, ( -29788.7, -5435.36, 449.071 ), ( 358.597, 106.726, -174.375 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139950, ( -29789.3, -5519.53, 454.359 ), ( 0.0510198, 110.766, -173.135 ), "tunnelspark", 139950, ( -29802.3, -5495.04, 453.989 ), ( 8.40371, 28.5248, 172.883 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139950, ( -29834.5, -5555.1, 467.526 ), ( 344.669, 287.226, 105.326 ), "tunnelspark", 139950, ( -29837.3, -5544.67, 467.469 ), ( 37.4202, 294.105, 133.834 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 139950, ( -29766.6, -5424.39, 449.093 ), ( 57.0338, 169.205, 108.552 ), "tunnelspark", 140000, ( -29768.4, -5484.52, 453.475 ), ( 17.8022, 282.344, -174.172 ), "tunnelspark_dl" );
    maps\jeepride_code::fx_wait_set( 140000, ( -29801.4, -5439.52, 452.146 ), ( 336.615, 172.965, -176.263 ), "tunnelspark_dl", 140000, ( -29783.0, -5444.99, 448.254 ), ( 355.778, 225.895, 176.054 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 140000, ( -29793.2, -5506.8, 453.54 ), ( 356.606, 321.312, 169.54 ), "tunnelspark", 140000, ( -29826.3, -5631.83, 467.671 ), ( 313.545, 210.782, -146.097 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 140000, ( -29799.2, -5479.45, 452.411 ), ( 355.686, 116.792, -166.124 ), "tunnelspark", 140000, ( -29796.0, -5454.86, 450.491 ), ( 11.9292, 45.1896, -171.664 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 140000, ( -29790.6, -5445.15, 449.057 ), ( 358.605, 106.681, -174.394 ), "tunnelspark", 140000, ( -29791.2, -5529.32, 454.35 ), ( 0.0612597, 110.72, -173.152 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 140000, ( -29804.2, -5504.82, 453.974 ), ( 8.38754, 28.4775, 172.87 ), "tunnelspark", 140000, ( -29836.5, -5564.85, 467.503 ), ( 344.66, 287.176, 105.344 ), "tunnelspark" );
    maps\jeepride_code::fx_wait_set( 140000, ( -29839.3, -5554.42, 467.445 ), ( 37.409, 294.072, 133.855 ), "tunnelspark", 140000, ( -29768.4, -5434.2, 449.087 ), ( 57.0542, 169.159, 108.551 ), "tunnelspark" );
}
