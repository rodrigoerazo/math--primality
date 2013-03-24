#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Math::Primality qw/ is_strong_pseudoprime /;
use Math::GMPz;

my $z = Math::GMPz->new(3);
ok(is_strong_pseudoprime($z), 'is_strong_pseudoprime groks Math::GMPz objects');

### test _check_two_and_even ###
ok (Math::Primality::_check_two_and_even(Math::GMPz->new(2)) == 1, '_check_two_and_even(2) should return 1');
ok (Math::Primality::_check_two_and_even(Math::GMPz->new(20)) == 0, '_check_two_and_even(20) should return 0');
ok (Math::Primality::_check_two_and_even(Math::GMPz->new(1)) == 0, '_check_two_and_even(1) should return 0');
### test is_strong_pseudoprime ###
ok(!is_strong_pseudoprime(-1),'-1 is not a spsp' );
ok(!is_strong_pseudoprime(0),'0 is not a spsp' );
ok(!is_strong_pseudoprime(1),'1 is not a spsp' );
ok( is_strong_pseudoprime(2,3),'2 is a spsp(3)' );
ok( is_strong_pseudoprime(3),'3 is a spsp'  );
ok(!is_strong_pseudoprime(4),'4 is not a spsp' );
ok( is_strong_pseudoprime( 1093**2 ), '1093**2 is a spsp');
ok(!is_strong_pseudoprime(1000), '1000 is not a spsp');

is( is_strong_pseudoprime( 3, 3), 1, "spsp( 3, 3)");
is( is_strong_pseudoprime( 11, 11), 1, "spsp( 11, 11)");
is( is_strong_pseudoprime( 89, 5785), 1, "spsp( 89, 5785)");
is( is_strong_pseudoprime(257, 6168), 1, "spsp(257, 6168)");
is( is_strong_pseudoprime(367, 367), 1, "spsp(367, 367)");
is( is_strong_pseudoprime(367, 1101), 1, "spsp(367, 1101)");
is( is_strong_pseudoprime(49001, 921211727), 0, "spsp(49001, 921211727)");
is( is_strong_pseudoprime( 331, 921211727), 1, "spsp( 331, 921211727)");
is( is_strong_pseudoprime(49117, 921211727), 1, "spsp(49117, 921211727)");

while(<DATA>) {
    chomp;
    ok( is_strong_pseudoprime( $_ ), "$_ is a spsp");
}

done_testing;

__DATA__
2047
3277
4033
4681
8321
15841
29341
42799
49141
52633
65281
74665
80581
85489
88357
90751
104653
130561
196093
220729
233017
252601
253241
256999
271951
280601
314821
357761
390937
458989
476971
486737
489997
514447
580337
635401
647089
741751
800605
818201
838861
873181
877099
916327
976873
983401
1004653
1016801
1023121
1082401
1145257
1194649
1207361
1251949
1252697
1302451
1325843
1357441
1373653
1397419
1441091
1493857
1507963
1509709
1530787
1678541
1730977
1811573
1876393
1907851
1909001
1969417
1987021
2004403
2081713
2181961
2205967
2264369
2269093
2284453
2304167
2387797
2419385
2510569
2746477
2748023
2757241
2811271
2909197
2953711
2976487
3090091
3116107
3125281
3375041
3400013
3429037
3539101
3567481
3581761
3605429
3898129
4181921
4188889
4335241
4360621
4469471
4502485
4513841
4682833
4835209
4863127
5016191
5044033
5049001
5173169
5173601
5256091
5310721
5444489
5489641
5590621
5599765
5672041
5681809
5919187
6140161
6226193
6233977
6334351
6368689
6386993
6787327
6836233
6952037
7177105
7306261
7306561
7462001
7674967
7759937
7820201
7883731
8036033
8095447
8384513
8388607
8534233
8725753
8727391
9006401
9056501
9069229
9073513
9371251
9564169
9567673
9588151
9729301
9774181
9863461
9995671
10323769
10386241
10425511
10610063
10655905
10712857
10763653
10974881
11081459
11335501
11473885
11541307
11585293
11777599
12263131
12327121
13057787
13216141
13338371
13421773
13446253
13500313
13635289
13694761
13747361
14179537
14324473
14709241
14794081
14865121
15101893
15139199
15188557
15220951
15247621
15479777
15510041
15603391
15698431
15802681
15976747
15978007
16070429
16132321
16324001
16360381
16705021
16773121
16822081
16853077
16879501
17116837
17134043
17208601
17327773
17375249
17509501
17585969
18073817
18366937
18443701
18454921
18535177
18653353
18740971
19328653
19404139
19471033
19607561
20261251
20417311
20647621
21303343
21306157
21359521
21400481
21417991
21623659
22075579
22087477
22564081
22591301
22669501
22849481
22953673
23464033
23577497
23734901
23828017
23872213
23963869
24214051
25080101
25326001
25629913
26254801
26377921
26758057
26821601
26840269
26877421
27108397
27118601
27219697
27271151
27279409
27331921
27380831
27392041
27509653
27664033
27798461
27808463
27966709
28325881
28527049
28572961
29111881
29214541
29581501
29878381
30022129
30185569
30219757
30295141
30388753
30418957
30576151
30662497
30740417
30881551
30894307
31166803
31436123
33627301
33704101
34003061
34856167
35576599
35703361
35820937
35851037
36307981
36338653
36765901
36861901
36919681
37109467
37439201
37769887
38010307
38046817
38118763
38210323
38342071
38624041
39465091
39655153
40629601
40782589
40827473
40987201
41121433
41604109
41642681
41662297
41840809
42485119
42623017
42984589
43363601
43397551
43661257
44314129
44963029
45100177
45414433
45485881
45769645
45819541
46325029
46517857
46679761
47220367
47349373
47759041
47903701
47918581
48191653
48269761
48316969
48369727
48448661
48551161
49303801
49411801
50155733
51129781
51302353
51340807
51500521
52072021
52119289
52204237
53399449
53656021
53675623
53695721
53711113
54029741
54449431
54468001
55109401
55318957
55729957
56420033
57561085
58422409
58449847
58509977
59631211
59840537
59913157
60155201
60352921
60547831
60566431
60581401
60696661
60738257
61201009
61219789
61377109
61755751
61832377
63001801
63065281
63167743
63318169
63346999
63388033
64605041
65254393
65301013
65359477
66096253
66977281
67194401
67642513
68102641
68154001
68165761
68512867
69030901
69128641
69176647
69228967
69231061
69485281
69885649
70030501
70149631
70593931
70728121
71572957
71734417
72498253
72543547
73562833
73645001
74329399
74411131
74927161
75140137
75565873
76725091
76745101
77533123
77576401
77812153
77817979
78939089
79398901
79417801
79786523
80375707
80556337
80687881
81433591
81445585
82273201
82506439
82870517
83204801
84421081
84487457
84998503
85519337
86027329
86067241
86530621
86999837
87499651
87694261
88368853
89308771
90626185
91433281
91659283
93431521
93541537
94316401
94502701
95451361
95452781
96618397
96904081
96925921
97496449
97796953
97863529
97924217
99036001
99115297
99486889
99789673
100463443
100618933
100943201
101270251
101276579
101649241
102004421
102678031
102690677
104078857
104852881
104857391
