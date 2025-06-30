/*

huge thanks to:
yuh for heavily inspiring  the macro + some functions
------------------------------------------------------------
credit to invalid for namek macro

Contributions:
base code: faxi
configs: keirahela

*/

#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\OCR-main\Lib\OCR.ahk
#Include %A_ScriptDir%\Lib\WebhookOptions.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk
#Include %A_ScriptDir%\Lib\boneco.ahk

global MacroStartTime := A_TickCount

SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
UnitExistence := "|<>*91$66.btzzzzzzyDzXlzzzzzzyDzXlzzzzzzyDzXlzzzyzzyDbXlUS0UM3UC1XlUA0UE30A1XlW4EXl34AMXlX0sbXXC80XVX4MbXX6A1U3UA0bk30ARk7UC0bk3UA1sDUz8bw3kC1zzbyszzzzzzzzbw1zzzzzzzzby3zzzzzzzzzzjzzzzzzU"
UnitExistence2 := "|<>*135$41.zzbxzzzzy7lzzzzyD3zzzzwADzzzzw0zzzzzw3zzzzzw7zzzzzsDzzzzzUDzzzzy4DzzzzsQDzzzzVwTzz3zbwzzztzzzzzzvzzzzzzvzzzzzzrzzzzzzjzzzzzzTzzzzzyzzzzzxxzzzzztvzzzzzlrzzzzzbjzzzzzTTzzzzzyzzzzzy"
MaxUpgrade := "|<>*134$53.0000000007U3k00000TUDk00001XUsk000033XVU0000636300800A3M6TzwS0M3UDrjRa0k70S0AS61U40s0EMAD001U0k0Ty41331k1zwA6673k7zsQAAS7UTzkwsMQC0TzVzkk0M0Tz3zVk0kETy7z3k1VkzwTz7kX7nzzzzzzzzzzzzzzzzzzw"
MaxUpgrade2 := "|<>*146$47.D07U0001z0Tk000371lU00067z3zzzzw7w7zzzzs7kDzzzzk7UTzSzzUC0w0MwD081k0UkS00301U1w82663U3sMAAC7UDkssMwD0zVvkksQ0z3zVU0k0y7z3U1UUwDy7U33VszyDX6Dbzzzzzzzzzzzzzzzy"
MaxUpgrade3 := "|<>*91$49.Dk7s00004M3600006633000031X1U0001UP0nzr3kkD0PzynAM3UD06D3A0U70331a00301U1X20VVUs1lVUklsS1kkssMwD0kMSQAC70AA/u603036413U1UUn20Vs0ksNX0My4NqMTUDnzzlwU"
VoteStart := "|<>*95$38.ryzzzzlz7zlzwDVzwTzXszz7zsSC30Q7770E40klU410C8sklVXUACAM0w7X360T1s1kEbsz0Q40zDsTVUM"
LobbyText := "|<>*134$56.0000000000k00U10000T00y1w000Cs0RkvU003606AAM000lU1X36000AMzMwlswS36zyDwTzjslw7WD4ST6AS0M1k33lX7060A0MMPlkkVX366DwQS8sFkk3z772C4QC1zlkkV327UTw40M0k1wDz1UC0Q0z3zsQ7WD4TkzzzzzzzzwTzzzzzzzy7zzzzzzzzXzzzzzzzzszs"
AreasText := "|<>*108$36.zs007zyzztzzwTzzzzwTzTzzsA4613tA421/k4M0F3k4M4FXXUQ603bmy713zzzzzzU"
MatchmakeUI := "|<>*129$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzz0zzzzzzzw7zzzw1zzzzzzzkDzzzs3zzzzzzzUTzzzs7zzzzzzz0zzzzkTzzzzzzy1zzzzzzzzzzzzw3zzzzzzzzzzzzs7zzzzzzzzzzzzkDy0Tw7UsDzzzzUTk0Ds7007zzzz0z00DUA007zzzy1w00D0M007zzzw3k00S0k00Dzzzs7U00Q1U00DzzzkC0S0s3060TzzzUQ1y0k60y0zzzz0s7w1UA1y1zzzy1kDs30M3w3zzzw3UTk60k7s7zy7k70TUA1UDkDzs70C0Q0s30TUTzk00S001k60z0zzU01w007UA1y1zz007w00D0M3w3zz00Dw00y0k7s7zz01zw03y1kDkDzzU7zy0Tw7UzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
CaptchaExistence := "|<>*100$131.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzs3zzzzzzzzzzzkDzzzzzzz01zzzzzzy7zzzUTzzzzzzs00zzzzzzs7zzz0zzzzzzzU01zzzzzzkDzzy1zzzzzzy003zzzzzzUTzzw3zzzzzzs007zzzzzz0zzzs7zzzzzzk7wTzzzzzy1zyTkDzzzzzz0Tzz0UsEDk0DU7UEDz0Uzy1zzw01U0DU0S0300Dw01zw3zzk0300C00s0600Dk03zsDzz00600C01U0A00T007zkTzw00A00A0200M00Q00DzUzzs30M3US1w1lk70s30Tz0zzkD0kDUw3s7zUT1kD0zy1zzUz1UT1s7kTz0y3Uz1zw1zz1w30y3kDUzy1w31w3zw1zC1s61s7UT0zw3s61s7zs0sA00A00D0y0Es7kA00Dzs00A00M00y0C00kDUQ00Tzs00M00k01y0A01UT0s00zzs00s01U07w0Q030y3s01zzs03s0300zw1w0C1w7s03zzw0TwCC1rzy3y1y7wDwCDzzzzzzzw3zzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Matchmaking := "|<>*93$73.zzzzzzzzzzzzzzlzzzsszzzzk08zzzwATzzzs04Tzzy6Dzzzw03zzzz3zzzzy7zzzzzVzzzzz3zX4DwElW7w8U7lU3s0Mk1w0E1sk0w0AM0Q080wM0A06A06040SAC6736737W7z6D37VX3VXl3zX7VVklXkkkVzlXkk0MlsM0EzslsQ0AMwC08zwMwC06AS7U4TyATDlb6DbxXzzzzzzzzzzzlzzzzzzzzzzs0zzzzzzzzzzw0zzzzzzzzzzy0zzzzzzzzzzzty"
AutoAbility := "|<>*83$21.zzzzzzzwD4S0kXl28wS03Xk0QSH7nWMy0n7sCQzzzzU"
ClaimText := "|<>*127$71.00000000000000A7s01y000007zTs07w00000Tzlk0AQ00003k7VU0MM0000D03300kk0000Q0667zXzsw01k0AAzzzzzy031ysTrjTSyS0C7zky0AA0EQ0QCTVs0MM00Q0ss73U0kk00M1lkC711VVUUk3VnwC73333VU73zsQS666737y3tksQAAAC7zy01Uk0MMMQDzy030k0kkksTzy061U1VVVkzzz0y3kX77XXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
LoadingScreen := "|<>*87$90.U07zzzzzzzzzzzz000Tzzzzzzzzzzz0007zzzzzzzzzzz0001zzzzzzzzzzz0000zzzzzzzzzzz0000Tzzzzzzzzzz0000Dzzzzzzzzzz00007zzzzzzzzzz00003zzzzzzzzzz0Ds01zzzzzzzzzz0Dy01zzzzzzzzzz0DzU0y0zw1y0s1z0Dzk0w0zw0w0k0T0Dzs0w0Tw0w000D0Dzs0Q0Tw0w00070Dzw0Q0Tw0w00030Dzw0Q0Tw0w00030Dzw0Q0Tw0w00010Dzw0Q0Tw0w00010Dzw0Q0Tw0w03000Dzw0Q0Tw0w0Dk00Dzw0Q0Tw0w0Ts00Dzs0Q0Tw0w0Ts00Dzs0w0Tw0w0Tw00Dzk0w0Tw0w0Tw00DzU0w0Ts0w0Tw00Dz01w0Ds0w0Tw00Dw01y07k0w0Tw000003y0000w0Tw000007y0000w0Tw00000Dz0000w0Tw00000Dz0000w0Tw00000zzU000w0Tw00001zzk000w0Tw00003zzs040w0Tw0000Dzzw0A0y0zw0U01zzzzUy1z1zy1U"
ReplayText := "|<>*101$71.Tk0000Dk0001zs0000FU00000Q0001V000000A00032000000M00064000000Py7zA8TzwD3kw7NbMFnD8m4Vk3U3ka08P0D30703VM0ES0Q406033U0ksE08QA46711kkU0k0MQAC73U10100ksMMC7U60107UkksQB08D23j01Uk0P0kK40C070k0m10Y40A0O1U1a63AQ0sFa3kXAAyDjzky7xzwEkkA7tV01U0VVU000320000220000640000AA0000AM0000AE0000DU0000TU0000600000C1"
DeathText := "|<>*100$22.zzzzUzUw3w3l7l6ASAMtstXbXaASAQFgFkAEDUlUzzzzU"
Text := "|<>*30$71.0000007zzzzy000000Dzzzzw000000Tzzzzs000000zzzzzk000001zzzzzU000003zzzzz0000007zzzzy000000Dzzzzw000000Tzzzzs000000zzzzzk000001zzzzzU000003zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
legend_buton := "|<>*108$40.Q00001vs00007tVU1U0naTzzzjCPXVXHktg44063bW222FCS080N4s4A49a3kEMEKQDzz9zzzbzwDzMw00zk00000y0008"
cancel_boton := "|<>*138$82.zzwDzzzzzzzszzzz0DzzzzzzzXzzzs0TzzzzzzyDzzz01zzzzzzzszzzsDjzzzzrz7XzzzVzw0k3w3k6DzzyDzU307U60Mzzzszw0A0A0kEXzzzXzkkkkkz72DzzyDz7X7X7w08zzzsTwQASATk1XzzzkMk0lskX3y7zzz01037X040MDzzy060ASC0M1Uzzzy1y8lsy7k73zU"
rainvilager_verificaçao := "|<>*51$33.U0000Q00003U0000Q00003U0000Q00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A"

; history mode
PlanetGreenie := "|<>*90$137.zzwTzzzzzzzzzzzzzzzyDzzw0szzzzzzDzs3zzzzzzwTzzs0lzzzzzyDz03zzzzzzszzzk1XzzzzzwTy0DzzzzzzzzzzXV7zzzzXszsSTnszXvzzszz7WD0A0w10Dlzs30Q1U770TyC4Q0M1k20TXUk40k30CA0Tw0Ms0k1V21y61UMEV20AMEzs0lllXX66DyC37lV64QMlVzk3XXX760QTwT6D060Msl07zXz766CATszsSAT7wTllX7zz7y60AQM1kTs0My0M1XX60TyDw60Mss3Uzs0ly0s376C0zwTwS8lls7lzs7Xy1s6CAS1y |<>*93$99.wDDzzzzzszzzzzbzz0Fzzzz7w3zzzzszzs0Dzzzsz0Tzzzzzzz61kMD23tz1VkkQkzskA20k0CAE840143z010E4N3lU+A6086Ts28mAU8yC1k00N03z7l4FYT7skCD7X87zsz42AkATU1s40N43zbskNb1Xy3DUkHAkTU"
WalledCity := "|<>*90$137.zzzzzsnzzz7zzwTzzzzzzzzwyTDzlXzzyDz0stzzzzzzzzksQDzX7zzwTw0Flzzzzzzzzlkszz6Dzzszk0zXzzzzzzzzXVlzyATXzlz3nz7rrzzzzzz2130AMw1k3yDy8073zzzzzz42A0Mlk307wTwE2CDzzzzzy00M0lXV20DkzskA8Tzzzzzw30llX764QTlzllwEzzzzzzw63XX6C0MszXzXXs3zzzzzzsA766AQTlVz3n77s7zzzzzzswS0A881U3z02C3kTzzzzzzlsy0MEM3U7z0AQ7kzzzzzzzbty8sks7WDz0syDXzzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzznzzzzzzU | <>*102$102.xxxzy8zzznztwTzzzlswTy8zzzVz0QMzzzkssTy8zzzVy0AszzzskMzy8zzzVw0DszzzskMsa8z1w1wTwU9szsEEk68w0s1sTw00szw01U68w0k1sTw08kzw21X68wMlVsTwMsFzw23768s0lVwTwMw1zy73X68w1lVwDQMy3zy73U60A9k3y0AMC3zz77k64A0s3z0AMD7zzDbsb6D1wHzUQwD7zzzzzzzzzzzzzzzyDzzzzzzzzzzzzzzzyDzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzyTzU"
SnowyTown := "|<>*89$137.z0zzzzzzzzz00Tzzzzzzzzzw0zzzzzzzzy00zzzzzzzzzzs1zzzzzzzzzsTzzzzzzzzzzlzzzsyzvjjzlz7rzTzzzzzzVz0D0FlUC7zXs2CAE3zzzzz0S0Q0V24QTz7U48EU7zzzzz0Q0M0W4MMzyD04EX07zzzzzUMsll00sXzwSC806CDzzzzzsllXX01k7zswQM0AQTzzzzllXX7607kDzlssk0sszzzzzU3760C4DkzzXk1kVllzzzzz0CCC0wMzVzz7k7X7XXzzzzzUwQS3wtz7zyDkTbD77zzzzzzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzbzzzzzzzzzzzzzk |<>*99$102.z1zzzzzzzk0Tzzzzzy0zzzzzzzk0Tzzzzzy9zzzzzzzz7zzzzzzyTmD1nAnbz7UtaN7zy3k60WA3Xz70F683zz0k60m0l7z70N0M3zzknYQE0k7z6C80NnzywnUQE1sDz6C80tlzw8nW0s1wDz70Q0tnzy0na0slwDz70QMtnzz1nb1wnwTz7UyNtnzzzzzzzzwTzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzszzzzzzzzzU"
SandVillage := "|<>*90$137.zzzzzzzlzzzlXDzzzzzzzzzy1zzzzzXyTtX6Dzzzzzzzzzs1zzzzz7sTV6ATzzzzzzzzzk3zzzzyDsz7wMzzzzzzzzzzXzzzzzwTkwDslzvzrszzzzz3z0A0w0zlsslXk3U70Tzzzy0w0M1k1zVVlX7060A0zzzzy0s0k1U3zX7X6C0A0MEzzzzz0llXX77z2D6AQMMklVzzzzzlXX76CDz0yAMssll07zzzzXX66CAMTy1wMllVV37zzzzz060AQM0zy7skUU3060Tzzzy0S0Mss1zwDlV1U70C0zzzzz1y8nlsXzwzXX3WDYS1zzzzzzzzzzzzzzzzzzzxkzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzzkzzzzzzU |<>*102$102.zzzzzzbzznAzzzzzzz1zzzzbty3Azzzzzzy0zzzzblw3Azzzzzzy9zzzzbswTAzzzzzzyTsaFw7swHAwHWQ7zy3k60k7wMnAs30M3zz0k60k7wMnAs30MXzzkX6QX7y1nAlWAEXzywX6QXby1nAlWAE3zw8k6Qk7z3n4830Mzzy0k6Qk7z3n4830M3zz1saQs7zbnaAHkQ7zzzzzzzzzzzzzzgTzzzzzzzzzzzzzzz0TzzzzzzzzzzzzzzzUzzzU"
NavyBay := "|<>*93$137.yDXzzzzzzU7zzzzzzzzzzzzwD7zzzzzz07zzzzzzzzzzzzsSDzzzzzy07zzzzzzzzzzzzkQTzrvjjwQDzvvzzzzzzzzzUMs1DUSDssQ03Vzzzzzzzzz0FU0C4QTl1k177zzzzzzzzy8X04QMMzW3U26DzzzzzzzzwE6CAEsXz73768zzzzzzzzzskAQM3k7yD6CA1zzzzzzzzzlkMks7kDwSAMQ3zzzzzzzzzXkk1kTkzs0M0wDzzzzzzzzz7lk3kzVzk1s1sTzzzzzzzzyTXl7nz7zU7sXlzzzzzzzzzzzzzzzwDzzzzz3zzzzzzzzzzzzzzzszzzzzyDzzzzzzzzzzzzzzzlzzzzzwTzzzzzzzzzzzzzzzbzzzzztzzzzzzzzzk |<>*108$102.yTnzzzzzzz0DzzzzzwDVzzzzzzz03zzzzzwDVzzzzzzz03zzzzzw7Vzzzzzzz01zzzzzw3Vxrjvrtz7Vyvrvzw1Vk27l3kz7Vs13kzw1VU27V3kz61k13kzwEV033VVVz61U1VVzwM13333kVz61VVkVzwM173V3k3z7lXVk3zwQ173k7s3z7lXVs3zwS103k7s7z01U1s7zwT103sDw7z01U1w7zwTVU3sTyDz03k1yDzwTXsXwTwDz07wFwDzzzzzzzzwDzzzzzwDzzzzzzzzsTzzzzzsTzzzzzzzzsTzzzzzsTzzzzzzzzszzzzzzszzzzzzzzzzzzzzzzxzzU"
FiendCity := "|<>*89$137.zzwTzzzz7zzwTzzzzzzzzzzw08zzzzyDz0stzzzzzzzzzzs0FzzzzwTw0Flzzzzzzzzzzk0zzzzzszk0zXzzzzzzzzzzXzzlzzzlz3nz7rrzzzzzzzz7yC0k3k3yDy8073zzzzzzzy0QM1U707wTwE2CDzzzzzzzw0skV060DkzskAATzzzzzzzs1lX2CAQTlzllwFzzzzzzzzlzX0AQMszXzXXs3zzzzzzzzXz6DsslVz3n77s7zzzzzzzz7yA0llU3z02C3sTzzzzzzzyDwQ1XXU7z0AQ7kzzzzzzzzwTsw377WDz0syDXzzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzznzzzzzzzzU |<>*104$102.zzwTzzzztzzzXzzzzw0ATzzzzkzw3Xzzzzw04Tzzzzkzk1XXzzzw04zzzzzkzU1bXzzzw0Tzzzzzkz0lzXzzzwTwS1l7w0z3zX0Hszw0wQ0k1s0z7zW01szw0wM0k1k0y7zW0Ekzw0QMskUkUy7zXVklzw0wE0lklkz7zXXs1zwTwM0lklkz3zXXw3zwTwMzlkkUz1lXVw3zwTwM0lkk0zU1XUS3zwTwQ0lks0zk1XkS7zwTwS1ltw9zw3Xsy7zzzzzzzzzzzzzzzyDzzzzzzzzzzzzzzzwDzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzwTzU"
SpiritWorld := "|<>*89$137.zzzzlzszzzzzzzzszszzzzzy1zzXzlnzntwzzzlzlzzzzzs1zz7zXXz3VkzzzXzXzzzzzk3zzzzz7z73Xzzz7z7zzzzzXzzzzbyDyC77XzaDyDzzzzz3y0sk4E3w84A1k4S0Tzzzzy0w0lU8U7wE8k3U8s0zzzzzy0s0X0lUTs01U30lk1zzzzzz0ll6DXXzkA376DXXXzzzzzzlXWAT77zkMCCAT777zzzzzXX24MyCDzUkQQMyCADzzzzz060MlwQ7z3ls0lwA0Tzzzzy0Q0lXssDz7Xs3XsA0zzzzzz1sbX7lwTyTbsD7swFzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzyDzzzzzzzzzzzzzzzzzzzU  |<>*103$102.z1zyTwzzbbbzztzXzy0zyTwtz77XzzszXzy0zzzzsz337zzszXzyBzzzjkzX37bzNzXzyDkCM4UDW361k9s3zy1k6M4UDk0A0k9k3zz0l2Mwkzk0AMltl3zzsFWNwszkM8sntXXzyQFWNwszsMMsntlXzw0E6NwsTsMQ0nsE3zy0k6NwsTswQ1nsM3zz1kSNwwTwwz3nwQ3zzznzzzzzzzzzzzzzzzznzzzzzzzzzzzzzzzznzzzzzzzzzzzzzzzznzzzzzzzzzzzzzzU "
AntKingdom := "|<>*89$137.zzzzzzzzz7zzzzszzzzzzzzztzzzDz7aDzzzzlzzzzzzzzzVzzyDyC4TzzzzXzzzzzzzzz3zzwTwMTzzzzz7zzzzzzzzw3zzszsVzzzzjyDXzzjzzzzs7k30Dk7X0D0C0Q1k47zzzzU7U60TUT60Q0M0k1U0Dzzzz6D061z0yA0M0k1U300TzzzwACCCDy0wMslVXX76AMTzzzs0QQQTw0sllXX76CAMkzzzzU0MsszsVlXX26AAQMlVzzzz7sllkTlVX760A0M0lX3zzzwDlXXUzXV6CC0Q0s3X67zzzwzn77lz7aAQT8wFsD6CTzzzzzzzzzzzzzzvVzzzzzzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzzzzzz0DzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzU |<>*102$102.zzzzzzznzzzyTzzzzznzzbyQHzzzyTzzzzzXzzbyQHzzzyTzzzzzVzzbyMzzzzyTzzzzz1t61y1n8wHkQ79Xzz0s20y3n0M30M301zy8s31y3n0M30M301zy0Nnby3nCFWAFlAFzw0NnbyFnCFWCFlANzw09nXyMnCM30M3ANzsy9nVyQHCM30M3ANzwz9nlySHCS3WQ7AtzzzzzzzzzzxXzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzw7zzzzzzU"
MagicTown := "|<>*92$137.zzzzzzzXzzzzzzzzzzzzzzzwTszzzz7zz00TzzzzzzzzzzsTVzzzyDzy00zzzzzzzzzzzky3zzzzzzzszzzzzzzzzzzzUs7zzzzzTzlz7rzTzzzzzzz0kC0Q0lkDzXs2CAE3zzzzzy00M0k1X0Dz7U48EU7zzzzzwE8k1U360zyD04EX07zzzzzsklXX66ATzwSC806CDzzzzzlXX76CAMzzswQM0AQTzzzzzXz6AAMMlbzlssk0sszzzzzz7yA0M0lU7zXk1kVllzzzzzyDwQ0s1XUDz7k7X7XXzzzzzwzswFxX7VzyDkTbD77zzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzw0zzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzU |<>*108$102.zzzzzzlzzU1zzzzzzszXzzzlzz00zzzzzzsT3zzznzz00zzzzzzsS3zzzzzzyDzzzzzzsC3lD0nkzyDUtnYXzs43UC0lUTyD0FX40zs030A0l0TyC0MV40zsUX6AMl6zyCA80AMzslWC8sk7zyAS80AQTsvX6AMl7zyCAA0AQTszX0A0l0TyC0Q8QQTszXUC0lUTyD0SAQQTtzXlD8nkzyTVyQwwzzzzzyszzzzzzzzzzzzzzzw0zzzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzz7zzzzzzzzzzzU"
HauntedAcademy := "|<>*87$137.zzzzzzzzzzzwzzzzzzzbzzzwSDzzzzyDzzkzszzzzy7zzzswTzzzzwTzzVzlzzzzwDzzzlszzzzzszzz3z1zzzzsTzzzXlsaSN7UQ7k7y3wDWS0sCFz03UAQE20k70Ds3kC0s10A0y060MsU410A0Tl70M1U60M1w0AMll6CCAMlz26BlX6AMl3swFlXWCAM0lXy08T76AE1X7lslX64QMszX7s08z6AMkD6DXlU608skkr0DlwE60M1VCAT7XUC0FlUU70T3sEC0s30AMyTbWS9bbVkT4zDtky9sbUtn |<>*98$102.zzzzlbzzznzwzzzzzzzzzlb3NVUlkzzzzzzzzzk6290UUUzzzzzzzzzk4G94n44zzzzzzzzzlYm9An04zzzzzzzzzla31AlUUzzzzzzzzzna3VAtUUzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzrzzzzzzzzzzzztzzzbzzzzzzzzzzzzszzzbzzzzzzzzzzzzkwQC76YrTzzzzzzzzkMMA6002TzzzzzzzzUFl8YE2GTzzzzzzzzU3n9Y4mMzzzzzzzzz78MA64mMzzzzzzzzzDAQC62mMzzzzzzzzzzzzzzzztzzzzzzzzzzzzzzzztzzzzzU "
MagicHills := "|<>*90$137.zzzzzzzXzzzzslbzzzzzzzzwTszzzz7zzXslX7zzzzzzzzsTVzzzyDzz7lX6Dzzzzzzzzky3zzzzzzyDXyATzzzzzzzzUs7zzyzyTwT7wMyDzzzzzzz0kC0Q0lkDsyAMlk7zzzzzzy00M0k1X0Dk0MlXUDzzzzzzwE8k1U360zU0lX77zzzzzzzsUlXX66ATz01X6C1zzzzzzzlXX76CAMzyDX6AS1zzzzzzzXz6AAMMlbwT6AMz3zzzzzzz7yA0M0lU7syAMEF7zzzzzzyDwQ0s1XUDlwMkUUDzzzzzzwTswFwX7UzXsllVUzzzzzzzzzzzzi7zzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzw0zzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzU |<>*104$102.zzzzzzyDzzzzX6TzzszlzzzyDzz7lX4DzzsTVzzzyDzz7lX4DzzsT1zzzzzzz7lz4DzzsC1zrvjzbz7lz4DXzs61k3U6C1z7lX6C0zs01U306A0z01X6C0zsUFU306A1z01X6CDzsUlX366ATz01X6C1zsll3W768Tz7lX6D0zsvlX326ANz7lX6DkzszlU306A0z7lX228zszlk3U6C0z7lX220zszlsXt6D3z7lXX31zzzzzzi7zzzzzzzzzzzzzzzUDzzzzzzzzzzzzzzzUDzzzzzzzzzzzzzzzkzzzzzzzzzzzU"
SpaceCenter := "|<>*89$137.z0zzzzzzzzw3zzzyDzzzzzzw0zzzzzzzzk1zzzwTzzzzzzs1zzzzzzzz03zzzszzzzzzzlzzzzzrwTwDDXzzlz7qTzzzVz0S0Q3UDszw1U60M30Tzzz0S0M0k20Tlzk30A0U60zzzz0Q0E1UA8T3zV20A3243zzzzUMsXX7skz7z64QQSA8zzzzzsll76Dk3yDy0Msss0lzzzzllV2AANXzwDATlllszXzzzzU30A0M10Dw081XXUk37zzzz0C0w0s30Tw0s3771k6DzzzzUwHwFsD0zw3s6CDXkATzzzzzszzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzk |<>*100$102.z0zzzzzzs7zztzzzzz0zzzzzzk7zzlzzzzzBzzzzxzXbDzlwzzzz7kC1UkT7y30UMA7zz0kA10UD7w10UE47zzkH0kB6D7slAFX4zzzwH0kD0Tbs3AFUAzzyAE411bzV4zANnwzzz0kA10UTk43AMEAzzzVkS1VkTsC3CQsAzzzznzzzzzzzzzzzzzzzznzzzzzzzzzzzzzzzznzzzzzzzzzzzzzzU"
AlienSpaceship := "|<>*89$137.zzz77zzzzzzzzzzzzzzXz7zztyCDzzzzUTzzzzzzzz7yDzzVwQTzzzy0TzzzzzzzyDwTzz3szzzzzw0zzzzzzzzwTzzzw3lzwTzzszzzzznyDlszzzzs7XXUA0zkzUD0C1k60k3X0zU7760M1zUD0A0M10A1U761z6CCA8E1zUC080k648z06A3wAAQMkXXzkAQFVXwMECCAMzs0Msk377zwMsXX7s1kAQMlzU0FlXyCDsskV66AlzsMslVT7sVX0AQTk1U60A0U68llX0wDl170MszU70C0Q1UA1XX61wzn6D0llzkS9y8w7UQ776AHzzzzzzzzzzwTzzzzzzzzzszzzzzzzzzzzszzzzzzzzzzlzzzzzzzzzzzlzzzzzzzzzzXzzzzzzzzzzzXzzzzzzzzzz7U  |<>*91$102.zrWDzzszzzzzyD7zzzXXTzzkTzzzzyDjzzzXXyzzWTzzzjqDzzzz1W887VkA2232107zz9W803kEA220+007zy0W00nw10UQ12A0Xzy0W08nq10UQ3UA0XzwQE88nUEA2220A07zwyFABnkES3733AUDzzzzzzzzlzzzzzzszzzzzzzzzlzzzzzzszzzzzzzzzvzzzzzzxzzU"
FabledKingdom := "|<>*91$137.zzzzlzXzzyDzzlzzzzyDzzzw0DzXz7zzwTltXzzzzwTzzzs0Tz7yDzzszXV7zzzzszzzzk0zyDwTzzlz67zzzzzlzzzzXzzwTsz7zXy8TzzzvzXszzz7y0M3ls3U7w1sk3k3U70Q1y0M0k3XU60Ds7lU7060A0M1w0k1U37240TkDX060A0M0k3s1XX76CA8szUD6CAMMsllX7lz76CAQ0llz0CAQMsllXX6DXyAA8MszX3y8QMskVX376AT7w0M0kkX07wMMllU3060AMyDw0k3Uk70DssFXXU70C0slwTwFUDXkD4TltX77WD4S3lXzzzzzzzzzzzzzzzysTzzzzzzzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzsTzzzzzU |<>*96$102.y1z7XzySsDzztzzzzw1z7XzwQFTzzlzzzzwTz7XrwQ3zzzlrzzzw700X1UQ60A21107zw30030UQ60421003zw284204Q61UUEA4nzwS84214Q21UUE84nzwT00l1UQE1Y2114nzyzUVlVkStPa31Vgnzzzzzzzzzzzwbzzzzzzzzzzzzzzzw7zzzzzzzzzzzzzzzyDzzzzzU"
RuinedCity := "|<>*88$137.zzzzszzzzyDzzszzzzzzzzzw0zzlzzzzwTy1lnzzzzzzzzs0zzXzzzzszs0XXzzzzzzzzk1zzzzzzzlzU1z7zzzzzzzzXVzzzzz7zXy7byDjjzzzzzz7WCAM1s3U7wTwE0C7zzzzzyC4QMk3U60DszsU4QTzzzzzw08slU3240TVzlUMEzzzzzzs0llX76A8szXzXXsVzzzzzzk1XX6CA0llz7z77k7zzzzzzXX66AQMzX3y7aCDkDzzzzzz720AMsk307y04Q7UzzzzzzyD60Mllk70Dy0MsDVzzzzzzwSS8lXXkD4Ty1lwT7zzzzzzzzzzzzzzzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzbzzzzzzU |<>*99$102.y7zzXzzzzbznszzzzw0zzXzzzz3y0slzzzw0Tzbzzzz3w0Nlzzzw0Tzzzzzz3s0TlzzzwQNtaEy3s3szt0HlzwQMsW0M1k3kzs01lzwMMsW0M1U3kzs0FVzw0MsWA0lX3kzslkXzw0ssWC01X3szsls3zw0MkWC83X3sSslw7zwQM0WC8HU3w0MkQ7zwQQ0WC81k7y0MkSDzwyS9aSS3sbz0tsSDzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzsTzzzzzzzzzzzzzzzwzzU"
PuppetIsland := "|<>*91$137.zzzzzzzzzzzzzz7zzzzwTzzw0zzzzzzztzszyDzzzzszzzs0zzzzzzzlzlzwTzzzzlzzzk1zzzzzzzXzXzszzzzzXzzzXVzzzzzwT7z7Xlzvzzz7zzz7WCA1k7U81yA1Xk30D0DzzyC4QM1U60E3wM37060Q0Tzzw0Msk1048EDslyC0A0M0zzzs0llXWC8klzlUQQMMsllzzzk3XX74QE3XzXUMksllXXzzzXz6648EXz7z7kllVXX67zzz7y0A0k32C3yAFVU3760DzzyDy0M3UD0Q7wM31U6CC0TzzwTy8lD4z0yDssD7WAQS8zzzzzzzXyDzzzzzzzzzzzzzzzzzzzz7wTzzzzzzzzzzzzzzzzzzzyDszzzzzzzzzzzzzzzzzzzzwTlzzzzzzzzzzzzzzzzU  |<>*100$102.zzzzzzzzzzzbzzztzy1zzzzzyTnz7zzzlzy0zzzzzwTXz7zzzlzyMzzzzywTnrbzzzlzyQH430s87n1bUEC1zyMn430k07n9b0EA1zy0n4lA34Tn3aAH4lzy1n4lA0ATn1aAH0lzyTk410HyTntb0H41zyTk430kC7m1X0H41zyTsY71sDDn1XUHa1zzzzwzDzzzzzzzzzzzzzzwzDzzzzzzzzzzzzzzwzDzzzzzzzzzzzU"
VirtualDungeon := "|<>*87$137.zzzXzzzzzzlzzzzzzzzzzzzwzn7znzzzzXz0Dzzzzzzzzzkz2DzXzzzz7y0DzzzzzzzzzlyDzz7zzzyDw0DzzzzzzzzzVsTzCDzzzwTssCyxzzvwTlzXllU02CC0MzlsMsk3k3UC0z33X004QM0lzXsllU7060M1z6D61UMsk1Xz7lXX060A8E3y4SATXllXX7yDX76CAMMkXby1wMz7XX76DwS6CAQMsU37Dw3slyD26AATssQ8MskVXyCTwDlXw60A0MTk0s0llU30A0zsTX7sC0Q0kTU3s1XXU70Q1ztz6DwS8wFlz0TsX77WD0w7zzzzzzzzzzzzzzzzzysTzzzzzzzzzzzzzzzzzzzzs1zzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzsTzzzU |<>*90$102.xw7xzzsy3zzzzzzzzswjtzzsw1zzzzzzzzwszszzswEzzzzTjzzwN00380wQ60M4621zyF00380wQ6084200zy30tX10wQ62100MAzz30sm10wMY3104EAzz70sE84Q1U38462AzzbgwMA4S3kHA473AzzzzzzzzzzzztDzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzwTzzzzU"
SnowyKingdom := "|<>*87$137.zzzzzzzzzzzzz7zzzzszzzzy1zzzzzzzzz7aDzzzzlzzzzs1zzzzzzzzyC4TzzzzXzzzzk3zzzzzzzzwMTzzzzz7zzzzXzzzlxzrTTsVzzzzjyDXxjz3y0S0XX0QDk7X0D0C0Q1k4y0w0s1248szUT60Q0M0k1U1y0s0k148klz0yA0M0k1U303z0llXW01l7y0wMslVXX76ATzlXX7603UDw0sllXX76CAMzXX76CA0DUTsVlXX26AAMMlz06CA0Q8TVzlVX760A0M0lXy0QQQ1slz3zXV6CC0Q0s3X7z1ssw7tnyDz7aAQS8wFsD6DzzzzzzzzsTzzzzzvVzzzzzzzzzzzzzzlzzzzzzk7zzzzzzzzzzzzzzXzzzzzz0DzzzzzzzzzzzzzzDzzzzzzVzzzzzzU |<>*92$102.z1zzzzzwFTzzlzzzzy9zxzzzw3zzzlzzzzz70kH96Q60A21107zz10E09YQ60421003zzk4381Uw610UEA4nzzM6283kw21UUE84nzy16EQXlwE1Y2114nzz1aMQrtyNNa31Vgnzzzzzzzlzzzwbzzzzzzzzzzznzzzw7zzzzzzzzzzznzzzyDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzWTzzzzzzzzzzzzzzzUFzzzzzzzzzzzzzzzkQzzzzzzzzzzzzzzzYCzzzzzzzzzzzzzzzjCTzzzzzzzzzzzzzziTDzzzzzzzU"
DungeonThrone := "|<>*87$137.zzzzzzzzzzzzzzzzyDzzzzzw0zzzzzzzzzzzzk04Tzzzzzs0zzzzzzzzzzzzU08zzzzzzk0zzzzzzzzzzzzy7lzzzzzzXUzzzzzjlz7zzzwTXzwyDrz7VXX0D0C0s3U7zsz0C0k70yDX760Q0M1U30Dzly0Q1061wT6CA0M0kV060DzXw0M60A3syAQMslVX2CAQTz7sslwQMzlsMsllXX0AQMszyDllXkslzXVkVXX66DssllzwTXX7llXz03U3760A0k1XXzsz76DU37y0DU6CC0Q1k777zlyCATUCDw1zWAQT8w3kSCDzXwQMzUwTzzzzzzvVzzzzzzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzzzzzz0DzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzzzzzzU |<>*90$102.k7zzzzzzzU0Tzzzzzl3zzzxyzzwQTzjzzzlkM1UEM87wQ2221UzlkM0UE803wQ0200UTlkMA401UnwQEAMA0TlWEA40F0nwQMAEA0zk60AUEM8nwwMC2AUzsD1QkMQBnwyND3QkzzzzzYzzzzzzzzzzzzzzzzUzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzp1zzzzzzzzzzzzzzy007zzzzzzzzzzzzzy003zzzzzzzzzzzzzy003zzzzzzzzzzzzzy001zzzzzzzzzzzzzy001zzzzzzzzzzzzzz001zzzzzzzzzzzzzzk03zzzzzzzU"
MountainTemple := "|<>*88$137.zzzzzzzzzzzzXzzzzzzzzzzwTszzzzzzDzz7zzk07zzzzzsTVzzzzzyDzyDzzU0Dzzzzzky3zzzzzwTzzzzzy7zzzzzzUs7lzzzzszzzzzzwTlzzjzz0kC0ssk30A0lU7zsy0k460y00M1llU60E1X0Dzls1U0A1wE8k1XX061U360DzXkV00M3sUlXX76CCD76AQTz7X2AMFrlXX76CAQQQCAMszyC0AMkXjXz6CA8MsswMMllzwSDslV2T7yA0M0llkM0lXXzsw0lX20yDwQ1s1XXUs1X77zlw1X641wTsw7sX77lsX6CDzXw36CMbzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzyDU |<>*87$102.swzzzyTwzy0TzztzzsszzzyTyzz0zzztzzsEsvAA66kznlVA9lzs0kH8444UTnU001Uzt4WH8aMYWTn40UV4ztYaF9aNYaTn0AUV0ztwkM9aA4aTnVAU01zxwkw9bA4aTnUAUAUzzzzzzzzzzzzzztzzzzzzzzzzzzzzzztzzzzzzzzzzzzzzzzxzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz00Tzzzzzzzzzzzzzy007zzzzzzzzzzzzzy007zzzzzzzzzzzzzz003zzzzzzzzzzzzzz011zzzzzzzzzzzzzz00XzzzzzzzU"
RainVillage := "|<>*86$137.zzzzszzzzzlXDzzzzzzzzzzw0zzlzzyTtX6Dzzzzzzzzzzs0zzXzzsTV6ATzzzzzzzzzzk1zzzzzsz7wMzzzzzzzzzzzXVzzzzzkwDslzvzrszzzzzz7X0AM1zlsslXk3U70TzzzzyC40Mk3zVVlX7060A0zzzzzw080lU3zX7X6C0A0MEzzzzzs0llX77z2D6AQMMklVzzzzzk1XX6CDz0yAMksll07zzzzzXX66AQTy1wMllVV37zzzzzz720AMszy7skUU3060TzzzzyD60MllzwDlV1U70C0zzzzzwSC8lXXzwzXX3WD4S1zzzzzzzzzzzzzzzzzzzxkzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzzkzzzzzzzU |<>*98$102.lV04E3y6C8Xk10A0zk164FVz4S8XVU68Mzk26AFlz0S8XVWC80zk16AFlzUy8XlX6A1zll0AFlzUy80k30A9zllUAFlzly8Es3UA0zntlAnnztyQMwHmD1zzzzzzzzzzzzzziDzzzzzzzzzzzzzzz0Dzzzzzzzzzzzzzzz0TzzzzzzzzzzzzzzzkzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzqzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTzzzzzzzzU"

;raids
AntKingdomRaid := "|<>*85$194.zzzzzzzznzzztzzzznzyTnzbzbznzzzzzzyTzwzbAzzzwTzzzsbsbszlzlzADzzzzzzXzyDtXTzzz7zzzwMw9yDyTyTXnzzzzzzkzzXyFzzzzlnzzzC63zXzzzbswzzzzzzw7UEDUwkC1UMA0DnUUb0UNk843bzzzzzy9s43sTA30E4103ws09U86M210tzzzzzzWCMXy3nA34kAGAyCEWNWMYMa8yTzzzzzk3aAzUQn0kA34nDXaMYMa969WDbzzzzzw0NXDt3Al0E4FAnwty9U9WM2MntzzzzzyDaMkyMnAE410nAzCTWM2Ma0aACTzzzzzntbCTbAna1UMQnDnbtb0b9k9nXDzzzzzzzzzzzzzzgzzzzzwzzzzzzxbzznzzzzzzzzzzzzzzkDzzzzzXzzzzzy1zzszzzzzzzzzzzzzzy7zzzzzwzzzzzzkzzwTzzzy"
SacredPlanet := "|<>*89$191.zzzzzzzzzzzlzzyDzzzzzzzzzzzzzzzzzzUTzzzzzzzXy0QTzzzzzXzzzzzzzzzzzy0Tzzzzzzz7w0Mzzzzzz7zzzzzzzzzzzw0zzzzzzzyDs0lzzzzzyDzzzzzzzzzzzszzzwznszwTlkXzrzzls7zzzzzzzzzzzkzk3UM30Q0zXl7U60S0U7zzzzzzzzzzzUD060E40k1z72C0A0s10DzzzzzzzzzzzUC0A1UMEU3y0AQ0M0kV0zzzzzzzzzzzzkAQMz7lV77w0MskllX37zzzzzzzzzzzzwMslyDU6CDs1lVlXW0CDzzzzzzzzzzzsslVXAT7wMTlzXX376DwTzzzzzzzzzzzk1U308y0M0zXz306CA0sDzzzzzzzzzzzU7U70Fy0s1z7y30AQQ1kTzzzzzzzzzzzkTWD3Xy1sXyDyD4Msw3szzzzzzzzzy"
StrangeTown := "|<>*90$191.zzkDjzzzzzzzzzk07zzzzzzzzzzzzzzzzz0CDzzzzzzzzzU0Dzzzzzzzzzzzzzzzzy0QTzzzzzzzzzy7zzzzzzzzzzzzzzzzzwTszvzzzzyz7zwTlxzrTzzzzzzzzzzzzsT0830A0w0s3zsy0XX40zzzzzzzzzzzzk60E40M1k1U7zls12481zzzzzzzzzzzzk61UM0k1U327zXk148k1zzzzzzzzzzzzs6D7llXX66ADz7XW01XXzzzzzzzzzzzzyASDXX76CA0zyC760377zzzzzzzzzzzwQMwT66CAMMzzwSCA0CCDzzzzzzzzzzzs0kMy0AQM0k3zsw0Q8QQTzzzzzzzzzzzk3Uly0Mss1k7zlw1slsszzzzzzzzzzzzsDlXy8nlwXkDzXw7tnllzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzy"
RuinedCityRaid := "|<>*86$194.zzzzyTzzzDzyTzzyTznyTwzwzyTzzzzzzzkDzbzzzXy1bDzz4z4z7zDyDtXzzzzzzzw1zvzzzsz0PXzzX7VTlznznwSTzzzzzzzATzzzryDXbszztkkTwTzzwz7bzzzzzzznaMa1kQ3lzY0QyQ44s43C10UQzzzzzzzwla9UM60wTt0aDb01A10n0E87Dzzzzzzz0NWNUMaD7yMsblm4HAH4X4l7nzzzzzzzk6MaM0FXtzaD1wQn4X4l8lAFwzzzzzzzwlU9a9y0y4NnkTbDlA1AH0H6TDzzzzzzzCM2NW1UDk6QCDtnwH0H4k4lVnzzzzzzznb4aQkQ3y3bbXyQzAs4tC1CQtzzzzzzzzzzzzzzzzzzztzbzzzzzzgzzyTzzzzzzzzzzzzzzzzzzwTwTzzzzzkDzz7zzzzzzzzzzzzzzzzzzzDzbzzzzzy7zzXzzzzzy"
CursedFestival := "|<>*86$191.zzzzzzzzzzzszzzzzzzlzzzyDzzzzzzzzzs7zzzzzzzlz03zzz7XzzzwTzzzzzzzzzU3zzzzzzzXy07zzyD7zzzszzzzzzzzzy07zzzzzzz7w0DzzwTzzzzlzzzzzzzzzsSTzzD7wTyDszwTXkSxyzvXzzzzzzzzzlzllU83UC0TlzUA108Vsk37zzzzzzzzzXzXX0E60M0zU60M20F3V06Dzzzzzzzzy7z761Xw8E1z0A8Fy1X320ATzzzzzzzzyDyCAT0skXXy0MkUSD74AMMzzzzzzzzzwTwQMz0U377wTU3UQSC0kslzzzzzzzzzsSMklzVXyADszXzkswS1lVXzzzzzzzzzs0E1XsX0A0Tlz0AFkMw7U33zzzzzzzzzs1k37k70Q0zXz0M3UlwDU63zzzzzzzzzs7l6DkT0wFz7z0sDlXwzWCDzzzzzzy"
FutureCity := "|<>*79$191.zzzzzzzzzjzzDzzzzzzzzzzyzzbzzzzzzy1zDzzz2NzwUDzzz9zbzzztzz7zzzzzzwTyTzzw7nzvtzzzyHzDzzzzzzDzzzzzzsNU613nt0nbmM4084SEH88a47TzzzzzzkH8A07bn4bDaE008lwUG03806TzzzzzzbaGMMDDaMSTA9a6HltAVAWH3AzzzzzzzDUW0lT1AMwyQHUAXVmNX10U6NzzzzzzzT1Y1kz2Qnxxtb2Na7YnC29VArzzzzzzzzzzzzzzzbtznzzzzzzzzzzzzDzzzzzzzzzzzzzzyTtzDzzzzzzzzzzzwzzzzzs"
StormHideout := "|<>*87$191.zzzzzzzzzzzzzz7yDzzzzzzzzzzzzzzzzzkDDzzzzzzwT6DwTzzzzz7zzzzzzzzzzz0CDzzzzzzsyATszzzzzyDzzzzzzzzzzy0QTzzzzzzlwTzlzzzzzwTzzzzzzzzzzwTszXzbzzzXszzXszXxxkzzzzzzzzzzzsT0A1k413z7lXU70Q1ll0Dzzzzzzzzzzk60E3U803y0360A0k1XW0Tzzzzzzzzzzk61U30k07w06A0MEU3761zzzzzzzzzzzs6D76DX67s0AMslV76CCDzzzzzzzzzzzyASCAT6ADlwMll06CAQQTzzzzzzzzzzwQMwQMyAMTXslX37wQMEszzzzzzzzzzzs0kM0lwMkz7lX060M0k1kTzzzzzzzzzzk3Us3XslVyDX70C0s3k3UzzzzzzzzzzzsDlsD7lXbwTCD4S1sDl7lzzzzzzzzy |<>*100$102.nQTDzzzwwzwSzjzlzls63003wwnUMC3A0Tk841103w0n0E41A0Tw4MlD8nw0nA30lAFzz4MlDAnwwmA08lAFzn6QFDAnwwn0HwF0NzkC43DAnwwn0EA30MTsTC7DAnwwnUMC7WQzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUDzzzzzzzzzzzzzzz00Tzzzzzzzzzzzzzy00Dzzzzzzzzzzzzzy00Dzzzzzzzzzzzzzy007zzzzzzzzzzzzzy007zzzzzzzzzzzzzy007zzzzzzzzzzzzzz00DzzzzzzzU"
FutureCityRaid := "|<>*93$194.zzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzk0zzjzzzzzzkCCTzzzzzzzzzzzzzzzzzw0Dzlzzzzzzs0XXzzzzzzzzzzzzzzzzzz03zwTzzzzzw0Dszzzzzzzzzzzzzzzzzzlzzz7zzwyDy7byDjjzzzzzzzzzzzzzzzwTll08sk60zXzW01kzzzzzzzzzzzzzzzz0AQE2CA10DszsU4QTzzzzzzzzzzzzzzzk3761XX0kVwDyA337zzzzzzzzzzzzzzzw0lllsslwMTXzXXsVzzzzzzzzzzzzzzzz7wQQSCAT0Dszssy0zzzzzzzzzzzzzzzzlz677X37lzy7aCDkDzzzzzzzzzzzzzzzwTk1kM0lw0zk0XUw7zzzzzzzzzzzzzzzz7y0Q70ATUDy0MsDVzzzzzzzzzzzzzzzzlzl7lsX7w3zkCDXszzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzzzzzzzzzzzzzzzU"
NightmareTrain := "|<>*85$191.zzzzlzz7zzzzzzzzzzzzzzzlzzzzzzzzzz7lXzyDyTzzzzzzzz00TzzXzzzzzzzzzy7X7zwTwTzzzzzzzy00zzz7zzzzzzzzzwD7zzszszzzzzzzzzsTzzzzzzzzzzzzzsCDzxlzlzzzzztwTzlzbzTxzzzzzzzzzkAMs1U60E4D0A1UDzXk60Mk3zzzzzzzzU8lU30A0U0A0M20Tz7U80lU7zzzzzzzz4FX060A300M0kA8TyD0k1X07zzzzzzzy836AAQQSAMFVXskzwSDX36CDzzzzzzzwM6AQMsswMkXX7U3zswS76AQTzzzzzzzssAMElllslV66DXzzlsyAAMszzzzzzzzlsMk1XXUlX20AT0DzXlw0MllzzzzzzzzXklk3771X660Mz0Tz7Xw0lXXzzzzzzzz7lXt6CDX6CS8lz0zyD7wFX77zzzzzzzzzzzQDzzzzzzzzzzzzzzzzzzzzzzzzw"
SandVillageRaid := "|<>*89$194.zzzzzzzzszzzslbzzzzzzzzzzzzzzzzzzzs7zzzzyDtzaAMzzzzzzzzzzzzzzzzzzzw0zzzzzXwDkX6Dzzzzzzzzzzzzzzzzzzz0DzzzzszXwTlXzzzzzzzzzzzzzzzzzzzlzzzzzyDsS7wMzzzvwTzzzzzzzzzzzzzwDw0k3k3z7XX6D0C0Q1zzzzzzzzzzzzzz0S0A0s0zkkslXU3060Tzzzzzzzzzzzzzs3U3060DyASAMs0k1V3zzzzzzzzzzzzzzUMsllXXzV7X6CCAMMkzzzzzzzzzzzzzzz6CAQMszw3slXXX760TzzzzzzzzzzzzzllX376ADz0yAMsklVXzzzzzzzzzzzzzzw0M0llU3zsTX220A0M1zzzzzzzzzzzzzz0D0AQQ0zy7skUk3U70Tzzzzzzzzzzzzzw7sXD7WDznyCAC8yFs7zzzzzzzzzzzzzzzzzzzzzzzzzzzzysTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz3zzzzzzzzzzzzzzU"

map_halloween := "|<>*95$102.bDzzzbztswzzznzzzbDzzzbztsszzzzzzzbC6n31XVsEsMQPXdzUA4m1111s0kE8310zU8Ym9a89t4WFAG94zb9YGNa0NtYaHA2NAzbA62NX31twkHA31AzrC73Nn1VxwsPA/XgzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
InChamber := "|<>*125$85.zzyTzzzzzzzzbykDzDzznwQszzny87zbzzlyAQTztz4rvnvzsza6SzwzWDkNkQ07l2A60S10kAkA03s0411C0s1WFUP7y04MbbAT0382DXz32CHn61WTaTUtzVVW9tk430l0kADslkAwM33kMkQD7wwwCSC1"
WaveText := "|<>*122$56.XsyDzzzzzkwDVzzzzzy71kzzzzzzVkQDzzzzzsM73l6DnkD20Vk03sM0kU8M08S40A0U602733XU83Vkkkkss20swA8Q0C1kS63UD07kQ7U0w3kzwD1s0D1w0DXsz03sTU3tyDwFyDw1U"


;history mode
global PlanetGreenieFound := false
global WalledCityFound := false
global SandVillageFound := false
global SnowyTownFound := false
global RuinedCityFound := false
global NavyBayFound := false
global FiendCityFound := false
global SpiritWorldFound := false
global AntKingdomFound := false
global MagicTownFound := false
global HauntedAcademyFound := false
global MagicHillsFound := false
global SpaceCenterFound := false
global AlienSpaceshipFound := false
global FabledKingdomFound := false
global PuppetIslandFound := false
global VirtualDungeonFound := false
global SnowyKingdomFound := false
global DungeonThroneFound := false
global MountainTempleFound := false
global RainVillageFound := false
;raids
global AntKingdomRaidFound := false ;oi
global SacredPlanetFound := false  ;oi
global StrangeTownFound := false  ;oi
global RuinedCityRaidFound := false ; oi
global CursedFestivalFound := false  ;oi
global FutureCityFound := false ;oi
global FutureCityFound2 := false ;oi
global StormHideoutFound := false ;oi
global FutureCityRaidFound := false ; nao vi esse criei um novo nome FutureCityFound2
global NightmareTrainFound := false
global SandVillageRaidFound := false

global map_halloweenFound := false

AddToLog("You can pause/unpause with F4.")
F4:: Pause -1

SetupMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(27, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Taxi Winter Event Farm") {
        Sleep 50
        WinActivate("Taxi Winter Event Farm")
        Sleep 100
    }
}

InitializeMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    global MacroStartTime := A_TickCount

    ; Reiniciar contador


    if WinExist("Taxi Auto-Challenge") {
        WinActivate("Taxi Auto-Challenge")
    }

    if WinExist(RobloxWindow) {
        WinMove(27, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    else {
        MsgBox("You must have ROBLOX open in order to start the macro (microsoft roblox doesnt work)", "Error T4", "+0x1000",)
        return
    }

    if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
        GoToRaids()
    }
    else {
        MsgBox("You must be in the lobby with default camera angle to start the macro.", "Error T3", "+0x1000",)
        return
    }
}

SetDefaultKeyboard(localeID) {
    static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
    Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
    binaryLocaleID := Buffer(4, 0)
    NumPut("UInt", LocaleID, binaryLocaleID)
    DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "Ptr", binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
    for hwnd in WinGetList()
        PostMessage 0x50, 0, Lan, , hwnd
}

BetterClick(x, y, LR := "Left") { ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}


GoToRaids() {
    global
    Reconnect()
    loop {
        if (ok := FindText(&X, &Y, 754, 488, 835, 560, 0, 0, AreasText)) {
            break
        }
    }
    SendInput ("{Tab}")
    AddToLog("For support, make sure to click on the discord icon above")


    ; Go to xmas map
    BetterClick(33,295)
    sleep 100
    BetterClick(33, 295)
    sleep 100
    BetterClick(33, 295)
    sleep 100

    BetterClick(433, 252)
    sleep 100
    BetterClick(433, 252)
    sleep 100
    BetterClick(433, 252)
    sleep 100



    BetterClick(479, 185)
    sleep 100
    BetterClick(479, 185)
    sleep 100
    BetterClick(479, 185)
    sleep 100
    Send("Shibuya Portal")
    Sleep 700

    BetterClick(215 ,285)
    sleep 100
    BetterClick(347, 391)
    Sleep 200
    BetterClick(347, 391)
    Sleep 200
 

    BetterClick(255, 350)
    Sleep 600
    BetterClick(255, 350)
    Sleep 600

    
    BetterClick(404, 464)
    Sleep 300
    BetterClick(404, 464)
    Sleep 300
    BetterClick(404, 464)
    Sleep 300

    Shibuya := true 


    ;verificaçao de qual rota fazer


    ; Verificações para cada mapa


    ;LoadedLoop()
    ;OnSpawnSetup()


    


}


GetSelectedStage() {
    global selectedStage
    filePath := "Lib\Settings\stage.txt" ; Adjust the path as necessary

    ; Read the contents of the file
    fileContent := FileRead(filePath)
    if (!FileExist(filePath)) {
        AddToLog("File not found: " filePath)
        selectedStage := "" ; Set to empty if file is missing
        return
    }

    if (InStr(fileContent, "Stage=")) {
        selectedStage := StrSplit(fileContent, "=")[2]
        selectedStage := Trim(selectedStage) ; Remove leading/trailing whitespace
        selectedStage := StrReplace(selectedStage, "`n", "") ; Remove newlines
        selectedStage := StrReplace(selectedStage, "`r", "") ; Remove carriage returns
        AddToLog("Stage loaded: " selectedStage)
    } else {
        AddToLog("Stage not found in file.")
        selectedStage := "" ; Set to empty if not found
    }
}


; Função para verificar e configurar mapas ativos
CheckAndSetupMaps() {
    jogarEmTudo()
    if (PlanetGreenieFound = true) {
        AddToLog("Chegamos ao mapa: PlanetGreenie")
        PlanetGreenieOnSpawnSetup()
        return ; Interrompe a execução após encontrar o mapa
    }
    if (WalledCityFound = true) {
        AddToLog("Chegamos ao mapa: WalledCity")
        WalledCityOnSpawnSetup()
        return
    }
    if (SnowyTownFound = true) {
        AddToLog("Chegamos ao mapa: SnowyTown")
        SnowyOnSpawnSetup()
        return
    }
    if (SandVillageFound = true) {
        AddToLog("Chegamos ao mapa: SandVillage")
        SandOnSpawnSetup()
        return
    }
    if (NavyBayFound = true) {
        AddToLog("Chegamos ao mapa: NavyBay")
        NavyBayOnSpawnSetup()
        return
    }
    if (FiendCityFound = true) {
        AddToLog("Chegamos ao mapa: FiendCity")
        FiendCityOnSpawnSetup()
        return
    }
    if (SpiritWorldFound = true) {
        AddToLog("Chegamos ao mapa: SpiritWorld")
        SpiritWorldOnSpawnSetup()
        return
    }
    if (AntKingdomFound = true) {
        AddToLog("Chegamos ao mapa: AntKingdom")
        AntOnSpawnSetup()
        return
    }
    if (MagicTownFound = true) {
        AddToLog("Chegamos ao mapa: MagicTown")
        MagicTownOnSpawnSetup()
        return
    }
    if (HauntedAcademyFound = true) {
        AddToLog("Chegamos ao mapa: HauntedAcademy")
        HauntedAcademyOnSpawnSetup()
        return
    }
    if (MagicHillsFound = true) {
        AddToLog("Chegamos ao mapa: MagicHills")
        MagicOnSpawnSetup()
        return
    }
    if (SpaceCenterFound = true) {
        AddToLog("Chegamos ao mapa: SpaceCenter")
        SpaceCenterOnSpawnSetup()
        return
    }
    if (AlienSpaceshipFound = true) {
        AddToLog("Chegamos ao mapa: AlienSpaceship")
        AlienSpaceshipOnSpawnSetup()
        return
    }
    if (FabledKingdomFound = true) {
        AddToLog("Chegamos ao mapa: FabledKingdom")
        FabledKingdomOnSpawnSetup()
        return
    }
    if (RuinedCityFound = true) {
        AddToLog("Chegamos ao mapa: RuinedCity")
        RuinedCityOnSpawnSetup()
        return
    }
    if (PuppetIslandFound = true) {
        AddToLog("Chegamos ao mapa: PuppetIsland")
        PuppetIslandOnSpawnSetup()
        return
    }
    if (VirtualDungeonFound = true) {
        AddToLog("Chegamos ao mapa: VirtualDungeon")
        VirtualDungeonOnSpawnSetup()
        return
    }
    if (SnowyKingdomFound = true) {
        AddToLog("Chegamos ao mapa: SnowyKingdom")
        SnowyKingdomOnSpawnSetup()
        return
    }
    if (DungeonThroneFound = true) {
        AddToLog("Chegamos ao mapa: DungeonThrone")
        DungeonThroneOnSpawnSetup()
        return
    }
    if (MountainTempleFound = true) {
        AddToLog("Chegamos ao mapa: MountainTemple")
        MountainOnSpawnSetup()
        return
    }
    if (RainVillageFound = true) {
        AddToLog("Chegamos ao mapa: RainVillage")
        RainVillageOnSpawnSetup()
        return
    }

    if (AntKingdomRaidFound = true) {
        AddToLog("Chegamos ao mapa: AntKingdomFound")
        AddToLog("chamei a funcao do mapa")
        AntKingdomOnSpawnSetup()
        return
    }


    if (SacredPlanetFound = true) {
        AddToLog("Chegamos ao mapa: SacredPlanet")

        SacredPlanetOnSpawnSetup()
        return
    }
    if (StrangeTownFound = true) {
        AddToLog("Chegamos ao mapa: StrangeTown")
        StrangeTownOnSpawnSetup()
        return
    }
    if (CursedFestivalFound = true) {
        AddToLog("Chegamos ao mapa: CursedFestival")
        CursedFestivalOnSpawnSetup()
        return
    }
    if (FutureCityFound = true) {
        AddToLog("Chegamos ao mapa: FutureCity")
        FutureCityOnSpawnSetup()
        return
    }
    if (FutureCityFound2 = true) {
        AddToLog("Chegamos ao mapa: FutureCity")
        FutureCity2OnSpawnSetup()
        return
    }
    if (StormHideoutFound = true) {
        AddToLog("Chegamos ao mapa: StormHideout")
        StormHideoutOnSpawnSetup()
        return
    }
    if (NightmareTrainFound = true) {
        AddToLog("Chegamos ao mapa: NightmareTrain")
        NightmareTrainOnSpawnSetup()
        return
    }
    if (SandVillageRaidFound = true) {
        AddToLog("Chegamos ao mapa: ShigashinuDistrict")
        map_halloweenOnSpawnSetup()
        return
    }
    if (map_halloweenFound = true) {
        AddToLog("Chegamos ao mapa: ShigashinuDistrict")
        ShigashinuDistrictOnSpawnSetup()
        return
    }


}
; Caso nenhum mapa seja encontrado
AddToLog("Nenhum mapa ativo foi encontrado.")


; Função para adicionar logs (exemplo)


PlanetGreenieOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 1")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 37, 134, 104, 224, 0xFFBD18 or 0xEE8168 or 0xCC6C6B or 0xFFBD19, 10) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            AddToLog("Incorrect Angle. Turning again.1 mapa")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{d down}")
    Sleep 710
    SendInput("{d up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 636
    SendInput("{w up}")
    Sleep 100
    ;clica em sim para comecar
    PressVoteStart()
    Sleep 3000
    TryPlacingUnitsMapa()


}

WalledCityOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 302, 51, 673, 156, 0x574527 or 0x57492D, 0) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            AddToLog("Incorrect Angle. Turning again.2 mapa")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{w down}")
    Sleep 853
    SendInput("{w up}")
    Sleep 100
    ;clica em sim para comecar
    PressVoteStart()
    Sleep 1000
    SendInput ("{Left up}")
    Sleep 100
    SendInput ("{Left down}")
    Sleep 400
    SendInput ("{Left up}")
    Sleep 3000
    TryPlacingUnitsMapa2()
}

SnowyOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 302, 51, 673, 156, 0x5E4924 or 0x695C4F or 0x65512C or 0x604D2A or 0x6D614B, 30) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            AddToLog("Incorrect Angle. Turning again. mapa 3")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{d down}")
    Sleep 2526
    SendInput("{d up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1777
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 1081
    SendInput("{d up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 5000
    TryPlacingUnitsMapa3()
}

SandOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000


    loop {
        if PixelSearch(&Px, &Py, 243, 196, 313, 322, 0xFFFFB9, 0) {
            AddToLog("Correct Angle")
            break
        }
        else if PixelSearch(&Px, &Py, 243, 196, 313, 322, 0xBBCFBC, 0) {
            AddToLog("Correct Angle")
            break

        } else {

            Sleep 50
            AddToLog("Incorrect Angle. Turning again. wallet no modo historia")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }


    ;comecou a andar
    SendInput("{S down}")
    Sleep 501
    SendInput("{S up}")
    Sleep 100
    SendInput("{D down}")
    Sleep 1040
    SendInput("{D up}")
    Sleep 100
    SendInput("{S down}")
    Sleep 427
    SendInput("{S up}")
    Sleep 100
    SendInput("{D down}")
    Sleep 1464
    SendInput("{D up}")
    Sleep 100
    SendInput("{S down}")
    Sleep 2313
    SendInput("{S up}")
    Sleep 100
    SendInput("{A down}")
    Sleep 2744
    SendInput("{A up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 5000
    TryPlacingUnitsMapa4()
}

NavyBayOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 623, 241, 781, 418, 0x847C6E or 0x113663 or 0x053186 or 0x33547F or 0x002161, 3) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            AddToLog("Incorrect Angle. Turning again. wallet")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{s down}")
    Sleep 1299
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 2086
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 391
    SendInput("{s up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 174
    SendInput("{s up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 5000
    TryPlacingUnitsMapa6969()
}

FiendCityOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 667, 274, 773, 366, 0xEDF0D5 or 0x455367 or 0x81AA9F or 0x062D5F, 3) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            AddToLog("Incorrect Angle. Turning again. wallet")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{a down}")
    Sleep 531
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1097
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1223
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1554
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 2212
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 1059
    SendInput("{s up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 5000
    TryPlacingUnitsMapa5()
}

SpiritWorldOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 592, 56, 823, 174, 0x00604E or 0x04242D or 0x005E4B or 0x032E31, 3) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            AddToLog("Incorrect Angle. Turning again. wallet")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{a down}")
    Sleep 1110
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 2331
    SendInput("{s up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 5000
    TryPlacingUnitsMapa6()
}

AntOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
    Sleep 1000
    TPtoSpawn()
    Sleep 1000
    LookDown()
    Sleep 200
    loop {
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 46, 408, 182, 504, 0xBD2974 or 0xBC2A76, 0) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
            Sleep 50
            AddToLog("Incorrect Angle. Turning again. formiga")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{a down}")
    Sleep 1766
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 922
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1235
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 882
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 970
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 2259
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1902
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 566
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1214
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 266
    SendInput("{d up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1431
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 378
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 82
    SendInput("{a up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 5000
    TryPlacingUnitsMapa7()
}

MagicTownOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 643, 220, 771, 331, 0xBEABA1 or 0x8A766A or 0x856A57 or 0x817161, 3) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar

    SendInput("{a down}")
    Sleep 2000
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 2000
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 500
    SendInput("{space down}")
    Sleep 371
    SendInput("{space up}")
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1350
    SendInput("{w up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 157
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 4500
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 318
    SendInput("{w up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 3000
    Sleep 50
    SendInput ("{right up}")
    Sleep 50
    SendInput ("{right down}")
    Sleep 140
    SendInput ("{right up}")
    KeyWait "right" ; Wait for "d" to be fully processed
    Sleep 2000
    TryPlacingUnitsMapa8()


}

HauntedAcademyOnSpawnSetup() {
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput ("{Tab}")
    LookDown()
    Sleep 200
    TPtoSpawn()
    Sleep 1000
    loop {
        Sleep 1000
        if PixelSearch(&Px, &Py, 385, 0, 430, 25, 0x091512) {
            AddToLog("Correct Angle")
            break
        }
        else {
            if PixelSearch(&Px, &Py, 757, 331, 824, 439, 0x091512, 10) {
                verificaçao_de_caminho := 1
                break
            }
            AddToLog("Incorrect Angle. Performing 90-degree turn.")
            ; Simulate pressing the "Left" key for a 90-degree turn
            SendInput("{Left down}")  ; Hold the "Left" key down
            Sleep 750                 ; Adjust this value to control the turn duration (90 degrees)
            SendInput("{Left up}")    ; Release the "Left" key

            ; Ensure the key is fully processed before proceeding
            KeyWait "Left"
            ; Optional: Add a delay after the turn if needed
        }
    }
    if (verificaçao_de_caminho = 0) {

        SendInput ("{d up}")
        Sleep 100
        SendInput ("{d down}")
        Sleep 5200
        SendInput ("{d up}")
        KeyWait "d"
    }
    else {
        SendInput ("{s up}")
        Sleep 100
        SendInput ("{s down}")
        Sleep 5200
        SendInput ("{s up}")
        KeyWait "s"
        loop 3 {
            SendInput("{Left down}")  ; Hold the "Left" key down
            Sleep 750                 ; Adjust this value to control the turn duration (90 degrees)
            SendInput("{Left up}")    ; Release the "Left" key

            ; Ensure the key is fully processed before proceeding
            KeyWait "Left"
        }
    }
    PressVoteStart()
    Sleep 3000
    TryPlacingUnitsMapa19()
}

MagicOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 561, 277, 687, 416, 0xFFD300 or 0xFFD200, 0) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{w down}")
    Sleep 1097
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 610
    SendInput("{d up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1168
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 740
    SendInput("{d up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1733
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 204
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 3363
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1368
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1729
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 365
    SendInput("{d up}")
    Sleep 100
    SendInput("{q down}")
    Sleep 121
    SendInput("{q up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 173
    SendInput("{w up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 3000
    TryPlacingUnitsMapa9()
}

SpaceCenterOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 775, 49, 832, 101, 0x10C9FF or 0x25FFFF, 0) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{w down}")
    Sleep 2108
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 2860
    SendInput("{d up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 461
    SendInput("{s up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 3000
    TryPlacingUnitsMapa10()
}

AlienSpaceshipOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 210, 348, 253, 388, 0x8BEAFF or 0x8DEAFF or 0x91ECFF or 0x91ECFF, 10) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 3000
    TryPlacingUnitsMapa11()
}

FabledKingdomOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 521, 377, 565, 460, 0xFF821A or 0xFFCD00, 10) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar


    SendInput("{s down}")
    Sleep 496
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 862
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 279
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1242
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 1728
    SendInput("{s up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 353
    SendInput("{d up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 1528
    SendInput("{s up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 1197
    SendInput("{d up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 1197
    SendInput("{s up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 3000
    TryPlacingUnitsMapa12()
}

RuinedCityOnSpawnSetup() {
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 202, 286, 234, 315, 0x5F584D or 0x5F5A49 or 0x555549 or 0x212D3F or 0x212D40 or 0x58524B, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    PressVoteStart()
    Sleep 3000
    TryPlacingUnitsMapa13()
}

PuppetIslandOnSpawnSetup() {
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 133, 484, 185, 538, 0xFFF671, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    PressVoteStart()
    Sleep 3000
    TryPlacingUnitsMapa14()
}

VirtualDungeonOnSpawnSetup() {
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 6969")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 205, 553, 248, 598, 0xC717AB or 0xF878FF or 0xF87EFF or 0xF770FF or 0xCE1BB3 or 0xF76DFF, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }

    ;comece a andar
    SendInput("{a down}")
    Sleep 2587
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 1538
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1276
    SendInput("{a up}")
    Sleep 100

    PressVoteStart()
    Sleep 3000
    TryPlacingUnitsMapa15()
}

SnowyKingdomOnSpawnSetup() {
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa ai meu Deus")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 745, 88, 800, 113, 0x426DA5 or 0x2A5C99 or 0x0D478A or 0x446CA0 or 0x114B8C or 0x5D7AA9, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }

    Sleep 3000
    SendInput("{s down}")
    Sleep 1337
    SendInput("{s up}")
    Sleep 100
    PressVoteStart()
    Sleep 1000
    TryPlacingUnitsMapa16()
}

DungeonThroneOnSpawnSetup() {
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 89898989766")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 640, 573, 740, 641, 0x130055 or 0x10004F or 0x110050, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    SendInput("{s down}")
    Sleep 666
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 793
    SendInput("{a up}")
    Sleep 100

    PressVoteStart()
    Sleep 1000
    TryPlacingUnitsMapa17()
}

MountainOnSpawnSetup() {
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 36, 464, 115, 504, 0x00001B or 0x000013 or 0x040C28 or 0x000017, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }

    SendInput("{w down}")
    Sleep 1220
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 1400
    SendInput("{d up}")
    Sleep 100
    PressVoteStart()
    Sleep 1000
    TryPlacingUnitsMapa18()

}

RainVillageOnSpawnSetup() {
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 591, 48, 847, 349, 0x211D37) {
            AddToLog("Correct Angle 1")
            break
        } else {
            if PixelSearch(&Px, &Py, 28, 81, 105, 318, 0x00000C or 0x00000A or 0x00000B or 0x00000D or 0x00000F,) {
                AddToLog("Correct Angle2")

                SendInput ("{Left up}")
                Sleep 50
                SendInput("{Left down}")  ; Hold the "Left" key down
                Sleep 755                 ; Adjust this value to control the turn duration (90 degrees)
                SendInput("{Left up}")    ; Release the "Left" key
                ; Ensure the key is fully processed before proceeding
                KeyWait "Left"
                break
            }
            else {
                SendInput ("{Left up}")
                Sleep 50
                SendInput ("{Left up}")
                Sleep 750
                SendInput ("{Left down}")
                KeyWait "Left" ; Wait for "d" to be fully processed
                Sleep 1000
            }
        }
    }
    SendInput("{s down}")
    Sleep 474
    SendInput("{s up}")
    Sleep 100

    PressVoteStart()
    Sleep 1000
    TryPlacingUnitsMapa20()
}


AntKingdomOnSpawnSetup() {
    AddToLog("cheguei na funcao do mapa")
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
    Sleep 1000
    TPtoSpawn()
    Sleep 1000
    LookDown()
    Sleep 200
    loop {
        AddToLog("puxando  cor no mapa certo")
        if PixelSearch(&Px, &Py, 85, 392, 113, 421, 0xAE2D75 or 0xA02478 or 0xAE2C75, 10) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            AddToLog("puxando  cor no mapa certo")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }

    SendInput("{a down}")
    Sleep 1892
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 897
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1074
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 500
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 577
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 578
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 591
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 357
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1501
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1800
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 429
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 695
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 221
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 235
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 283
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1306
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 200
    SendInput("{d up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1078
    SendInput("{w up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 104
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 383
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 60
    SendInput("{a up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 5000
    TryPlacingUnitsMapa799()
}


SacredPlanetOnSpawnSetup() {
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 737, 214, 783, 254, 0xFF28FF or 0xFF47FF or 0xFF0FFF or 0xFF86FF or 0xFF1FFF, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }

    SendInput("{s down}")
    Sleep 1886
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 291
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 164
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 723
    SendInput("{s up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 135
    SendInput("{s up}")
    Sleep 100
    SendInput ("{left up}")
    Sleep 50
    SendInput ("{left down}")
    Sleep 130
    SendInput ("{left up}")
    KeyWait "left" ; Wait for "d" to be fully processed


    PressVoteStart()
    Sleep 1000
    TryPlacingUnitsMapa30()
}

StrangeTownOnSpawnSetup() {
    ; func vazia
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000

    loop {
        if PixelSearch(&Px, &Py, 188, 234, 243, 287, 0x7CFFFF or 0x79FFFF or 0x77FFFF or 0x7AFFFF or 0x7AFFFF, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }

    SendInput("{S down}")
    Sleep 1385
    SendInput("{S up}")
    Sleep 100
    SendInput("{S down}")
    Sleep 104
    SendInput("{S up}")
    Sleep 100
    SendInput("{D down}")
    Sleep 287
    SendInput("{D up}")
    Sleep 100
    SendInput("{S down}")
    Sleep 811
    SendInput("{S up}")
    Sleep 100
    SendInput("{D down}")
    Sleep 169
    SendInput("{D up}")
    Sleep 100
    SendInput("{D down}")
    Sleep 173
    SendInput("{D up}")
    Sleep 100
    SendInput("{D down}")
    Sleep 127
    SendInput("{D up}")
    Sleep 100
    SendInput("{S down}")
    Sleep 226
    SendInput("{S up}")
    Sleep 100
    SendInput("{D down}")
    Sleep 130
    SendInput("{D up}")
    Sleep 100
    SendInput("{S down}")
    Sleep 95
    SendInput("{S up}")
    Sleep 100
    SendInput ("{left up}")
    Sleep 50
    SendInput ("{left down}")
    Sleep 412
    SendInput ("{left up}")
    KeyWait "left" ; Wait for "d" to be fully processed

    PressVoteStart()
    Sleep 1000

    TryPlacingUnitsMapa21()

}

CursedFestivalOnSpawnSetup() {
    ; func vazia
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 354, 286, 472, 319, 0xED4B00 or 0xE74C00 or 0xF85D00 or 0xEB4E00 or 0xD64500, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    loop 7 {
        Sleep 50
        SendInput ("{right up}")
        Sleep 50
        SendInput ("{right down}")
        Sleep 50
        SendInput ("{right up}")
        KeyWait "right" ; Wait for "d" to be fully processed

    }


    SendInput("{a down}")
    Sleep 1888
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 235
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1436
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 525
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1470
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 595
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 417
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 121
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 121
    SendInput("{w up}")
    Sleep 100
    PressVoteStart()
    Sleep 1000

    TryPlacingUnitsMapa22()


}

FutureCityOnSpawnSetup() {
    ; func vazia
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 987654321")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    N1 := 0
    loop {
        if PixelSearch(&Px, &Py, 34, 143, 316, 429, 0xF9ABFF, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
            N1++
            AddToLog(N1)
        }

    }
    loop 1 {
        Sleep 50
        SendInput ("{right up}")
        Sleep 50
        SendInput ("{right down}")
        Sleep 50
        SendInput ("{right up}")
        KeyWait "right" ; Wait for "d" to be fully processed
        AddToLog("rodei")
    }
    SendInput("{a down}")
    Sleep 1000
    SendInput("{a up}")
    PressVoteStart()
    Sleep 1000

    TryPlacingUnitsMapa23()
}


FutureCity2OnSpawnSetup() {
    ; func vazia
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa FUTURE CITY2")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    N1 := 0
    loop {
        if PixelSearch(&Px, &Py, 751, 310, 831, 443, 0x030FFF, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
            N1++
            AddToLog(N1)
        }

    }
    SendInput("{a down}")
    Sleep 1000
    SendInput("{a up}")
    PressVoteStart()
    Sleep 1000
    TryPlacingUnitsMapa244()


}


StormHideoutOnSpawnSetup() {
    ; func vazia
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 55, 126, 147, 199, 0x5E4F7B or 0x5A4D73 or 0x5A4E77 or 0x5D5080 or 0x5A4E7C, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed

        }

    }
    SendInput("{a down}")
    Sleep 522
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 863
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 810
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 291
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 518
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 173
    SendInput("{a up}")
    Sleep 100

    PressVoteStart()
    Sleep 1000
    TryPlacingUnitsMapa25()
}


NightmareTrainOnSpawnSetup() {
    ; func vazia
    jogarEmTudo()
    LoadedLoop()
    AddToLog("entrou na funaçao do mapa 8")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {
        if PixelSearch(&Px, &Py, 92, 164, 130, 212, 0x22073A or 0x1F073A or 0x20073A or 0x48143D or 0x18053B or 0x47133D, 20) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed

        }

    }
    SendInput("{a down}")
    Sleep 1298
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1425
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1110
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 325
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 292
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 371
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 191
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 108
    SendInput("{a up}")
    Sleep 100

    loop 10 {
        Sleep 50
        SendInput ("{Left up}")
        Sleep 50
        SendInput ("{Left down}")
        Sleep 50
        SendInput ("{Left up}")
        KeyWait "Left" ; Wait for "d" to be fully processed


    }

    PressVoteStart()
    Sleep 1000
    TryPlacingUnitsMapa26()


}


ShigashinuDistrictOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
    ;faz o squema de olha para baixo
    LookDown()
    Sleep 200
    ;o nome a auto descritivo da tp pra base
    TPtoSpawn()
    Sleep 1000
    loop {

        if PixelSearch(&Px, &Py, 257, 269, 287, 309, 0xBBCFBD or 0xBBCFBC or 0xBBCEBC, 5) {
            AddToLog("Correct Angle")
            break
        }
        else {
            Sleep 50
            AddToLog("Incorrect Angle. Turning again. wallet 2.0 Raid")
            SendInput ("{Left up}")
            Sleep 50
            SendInput ("{Left down}")
            Sleep 50
            SendInput ("{Left up}")
            KeyWait "Left" ; Wait for "d" to be fully processed
        }
    }
    ;comecou a andar
    SendInput("{S down}")
    Sleep 501
    SendInput("{S up}")
    Sleep 100
    SendInput("{D down}")
    Sleep 1040
    SendInput("{D up}")
    Sleep 100
    SendInput("{S down}")
    Sleep 427
    SendInput("{S up}")
    Sleep 100
    SendInput("{D down}")
    Sleep 1464
    SendInput("{D up}")
    Sleep 100
    SendInput("{S down}")
    Sleep 2313
    SendInput("{S up}")
    Sleep 100
    SendInput("{A down}")
    Sleep 2744
    SendInput("{A up}")
    Sleep 100


    ;clica em sim para comecar
    PressVoteStart()
    Sleep 5000
    TryPlacingUnitsMapa4()
}
map_halloweenOnSpawnSetup() {
    jogarEmTudo()
    ;verifica se apareceu o sim quando carrega ele faz o macro so comecar quando o user carregar
    LoadedLoop()
    AddToLog("entrou na funaçao")
    sleep 1000
    SendInput("{Tab}")
}

Replaying() {
    global DesiredRuns

    jogarEmTudo()
    ; Código existente para reconectar
    loop {
        if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
            AddToLog("Carregando próxima fase...")
            break
        }
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            break
        }
        Reconnect()
        Sleep 1000
    }
    ;if (RunCount >= DesiredRuns) {
    ;    AddToLog("Execuções concluídas - Retornando ao lobby")
    ;   AddToLog("Pressionando F3 10 vezes...")
    ;   Loop 1 {
    ;       SendInput "{F3}"
    ;       Sleep 150 ; Pausa de 150ms entre cada pressionamento para evitar problemas
    ;    }
    ;
    ;}
    ; Restante do código para nova fase
    LoadedLoop()
    StartedLoop()
}

StopMacro() {
    SaveLocal
    if ControlGetVisible(keybindsGui) {
        return
    }
    Reload()
}
; Define the rectangle coordinates


#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\Gdip_All.ahk


UpgradeUnit(x, y) {
    BetterClick(x, (y - 3))
    BetterClick(264, 363) ; upgrade
    jogarEmTudo()
}

IsMaxUpgrade() {
    jogarEmTudo()
    Sleep 500
    if (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade2)) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade3)))
    {
        return true
    }
}

ShouldStopUpgrading(sleepamount := 300) {
    jogarEmTudo()
    Sleep sleepamount
    if CheckForReplayButton() {
        if (WebhookCheckbox.Value = 1) {
            SendWebhook()
        }
        BetterClick(485, 115)
        return true
    }
}


LookDown() {
    jogarEmTudo()
    MouseMove(400, 300)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 200
    MouseGetPos(&x, &y)
    MouseMove(400, 300)
    SendInput(Format("{Click {} {} Left}", x, y + 150))

    loop 20 {
        SendInput("{WheelDown}")
        Sleep 50
    }
}

LoadedLoop() {
    jogarEmTudo()
    AddToLog("Waiting to load in")
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            AddToLog("Loaded in")
            Sleep 1000
            break
        }
        Reconnect()
    }
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        AddToLog("Sending chat")
        SendChat()
    }
}

PressVoteStart() {
    jogarEmTudo()
    sleep 1000
    BetterClick(350, 103) ; click yes
    BetterClick(350, 100) ; click yes
    BetterClick(350, 97) ; click yes
}

StartedLoop() {
    jogarEmTudo()
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            continue
        }
        AddToLog("Game started")
        break
    }
}

LobbyLoop() {
    jogarEmTudo()
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText))
        {
            break
        }
        Reconnect()
    }
    AddToLog("Returned to lobby, going back to raids")
    return GoToRaids()
}

CheckForLobbyButton() {
    jogarEmTudo()
    if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText))
    {
        return true
    }
}


Checkforloss() {
    jogarEmTudo()
    if (ok := FindText(&X, &Y, 412 - 150000, 109 - 150000, 412 + 150000, 109 + 150000, 0, 0, DeathText))
    {
        return true
    }
    return false
}

CheckForReplayButton() {

    ;if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText)) {
    ;Verificar se atingiu o limite
    ;return true
    ;}
    ;return false
}
CheckforNextButton() {

    NextButton := "|<>*124$49.70s000007ly0003s6AnU001y33Mk001X1VwNyCClkkSDzzjsyM77UQyM3A1XU4C81a0lU3040n40llk7VtX0M0w7lslkA0S3swMs6Dy0wCQS30C0C1yDVk277Uz7sw3bnszzzzzzzzzzzzzzzzzU"

    if (ok := FindText(&X, &Y, 355 - 150000, 441 - 150000, 355 + 150000, 441 + 150000, 0, 0, NextButton)) {
        AddToLog("fui chamado next button")


        ;AddToLog("Iniciando macro - Execuções restantes: " DesiredRuns)
        ;if (RunCount >= DesiredRuns) {
        ;    AddToLog("Execuções concluídas - Retornando ao lobby")
        ;  AddToLog("Pressionando F3 10 vezes...")
        ;  Loop 1 {
        ;      SendInput "{F3}"
        ;       Sleep 150 ; Pausa de 150ms entre cada pressionamento para evitar problemas
        ;      }
        ;; }
        loop 10 {
            BetterClick(348, 391) ; next
            Sleep 200
        }
        Sleep 3000
        AddToLog("fui chamado next button pt2")
        ;if (RunCount >= DesiredRuns) {
        ;    AddToLog("Execuções concluídas - Retornando ao lobby")
        ;    AddToLog("Pressionando F3 10 vezes...")
        ;    Loop 1 {
        ;        SendInput "{F3}"
        ;        Sleep 150 ; Pausa de 150ms entre cada pressionamento para evitar problemas
        ;    }

        ;}
        loop 10 {
            BetterClick(335, 119) ;
            Sleep 200
        }
        loop {
            if (ok := FindText(&X, &Y, 743, 488, 830, 553, 0, 0, AreasText))
                break
        }
        AddToLog("esta no loby replay")

        GoToRaids()
    }
    if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText))
    {
        AddToLog("fui chamado next button pt2")

        loop 10 {
            BetterClick(335, 119) ;
            Sleep 200
        }
        loop {
            if (ok := FindText(&X, &Y, 743, 488, 830, 553, 0, 0, AreasText)) {
                break
            }
        }
        AddToLog("esta no loby replay")

        GoToRaids()

    }
    if (ok := FindText(&X, &Y, 743, 488, 830, 553, 0, 0, AreasText)) {
        GoToRaids()
    }
    return false
}

SendChat() {
    jogarEmTudo()
    SendInput("/")
    Sleep 250
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        for char in StrSplit(chat) {
            Send(char)
            Sleep(Random(100, 200))  ; Optional delay between each keypress
        }
    }
    Sleep 1200
    SendInput("{Enter}")
    Sleep 250
}

TPtoSpawn() {
    jogarEmTudo()
    BetterClick(27, 574) ; setings
    Sleep 1000
    BetterClick(400, 287)
    Sleep 600
    loop 5 {
        Sleep 150
        SendInput("{WheelDown 1}") ; scroll
    }
    Sleep 600
    BetterClick(523, 221) ; tp to spawn
    Sleep 600
    BetterClick(582, 150) ; exit settings

}

DebugOCR() {
    jogarEmTudo()
    if ControlGetVisible(keybindsGui) {
        return
    }
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }
}

AntiCaptcha() {
    jogarEmTudo()
    ; Perform OCR on the defined region directly
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    ; Display OCR results
    if ocrResult {
        BetterClick(414, 342) ; Click to focus on captcha input
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
            BetterClick(584, 192) ; close captcha
            return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }

    BetterClick(309, 386) ; select
    Sleep 1500
    BetterClick(383, 221)
    Sleep 500

    sleep 6000
    if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
        return
    }
    if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
        return
    }
    AddToLog("Walking to ensure the UI pops up again if it didnt matchmake")

    loop 2 {
        HoldKey("D", 400)
        HoldKey("A", 800)
        HoldKey("Space", 2000)
    }

    Sleep 1500
    if (ok := FindText(&X, &Y, 221, 206, 403, 355, 0, 0, MatchmakeUI))
    {
        AddToLog("Waiting for captcha cooldown then retrying")
        Sleep 6000
    }
    return
}


Reconnect() {
    ; Check for Disconnected Screen
    color := PixelGetColor(519, 329) ; Get color at (519, 329)
    if (color = 0x393B3D) {
        AddToLog("Disconnected! Attempting to reconnect...")

        ; Use Roblox deep linking to reconnect
        Run("roblox://placeID=" 8304191830)
        Sleep 2000
        if WinExist(RobloxWindow) {
            WinMove(27, 15, 800, 600, RobloxWindow)
            WinActivate(RobloxWindow)
            Sleep 1000
        }

        loop {


            AddToLog("Reconnecting to Roblox...")
            BetterClick(555, 425)
            Sleep 15000
            if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
                AddToLog("Reconnected Succesfully!")
                return GoToRaids() ; Check for challenges in the lobby
            }
            else {
                Reconnect()
            }
        }
    }
}

HoldKey(key, duration) {
    SendInput ("{" key "up}")
    ; go to teleporter
    Sleep 100
    SendInput ("{" key " down}")
    Sleep duration
    SendInput ("{" key " up}")
    KeyWait key ; Wait for "d" to be fully processed
}
CheckMapInArea(mapName) {
    global

    ; Permite acessar variáveis globaisS

    if (ok := FindText(&X, &Y, 340, 197, 755, 490, 0.1, 0.1, %mapName%))
    {

        AddToLog("DEPOIS DO IF")
        Sleep 500
        AddToLog(mapName " found!")

        Sleep 2000
        BetterClick(400, 438) ; play
        Sleep 500
        BetterClick(400, 438) ; play
        Sleep 500


        return true
    }
    else {
        return false
    }


}


CheckMaps() {
    jogarEmTudo()
    ; Verifica cada mapa usando CheckMapInArea
    loop {
        jogarEmTudo()
        if (CheckMapInArea("PlanetGreenie")) {
            AddToLog("to rodando ")
            global PlanetGreenieFound := true
            break
        } else if (CheckMapInArea("WalledCity")) {
            global WalledCityFound := true
            break
        } else if (CheckMapInArea("SnowyTown")) {
            global SnowyTownFound := true
            break
        } else if (CheckMapInArea("SandVillage")) {
            global SandVillageFound := true
            break
        } else if (CheckMapInArea("NavyBay")) {
            global NavyBayFound := true
            break
        } else if (CheckMapInArea("FiendCity")) {
            global FiendCityFound := true
            break
        } else if (CheckMapInArea("SpiritWorld")) {
            global SpiritWorldFound := true
            break
        } else if (CheckMapInArea("AntKingdom")) {
            global AntKingdomFound := true
            AddToLog("AntKingdom encontrado.")
            break
        } else if (CheckMapInArea("MagicTown")) {
            global MagicTownFound := true
            break
        } else if (CheckMapInArea("HauntedAcademy")) {
            global HauntedAcademyFound := true
            break
        } else if (CheckMapInArea("MagicHills")) {
            global MagicHillsFound := true
            break
        } else if (CheckMapInArea("SpaceCenter")) {
            global SpaceCenterFound := true
            break
        } else if (CheckMapInArea("AlienSpaceship")) {
            global AlienSpaceshipFound := true
            break
        } else if (CheckMapInArea("FabledKingdom")) {
            global FabledKingdomFound := true
            break
        } else if (CheckMapInArea("RuinedCity")) {
            global RuinedCityFound := true
            break
        } else if (CheckMapInArea("PuppetIsland")) {
            global PuppetIslandFound := true
            break
        } else if (CheckMapInArea("VirtualDungeon")) {
            global VirtualDungeonFound := true
            break
        } else if (CheckMapInArea("SnowyKingdom")) {
            global SnowyKingdomFound := true
            break
        } else if (CheckMapInArea("DungeonThrone")) {
            global DungeonThroneFound := true
            break
        } else if (CheckMapInArea("MountainTemple")) {
            global MountainTempleFound := true
            break
        } else if (CheckMapInArea("RainVillage")) {
            global RainVillageFound := true
            break
        } else if (CheckMapInArea("SacredPlanet")) {
            global SacredPlanetFound := true
            break
        } else if (CheckMapInArea("StrangeTown")) {
            global StrangeTownFound := true
            break
        } else if (CheckMapInArea("CursedFestival")) {
            global CursedFestivalFound := true
            break
        } else if (CheckMapInArea("FutureCity")) {
            global FutureCityFound := true
            break
        } else if CheckMapInArea("FutureCityRaid") {
            global FutureCityFound2 := true
            break
        } else if (CheckMapInArea("StormHideout")) {
            global StormHideoutFound := true
            break
        } else if (CheckMapInArea("NightmareTrain")) {
            global NightmareTrainFound := true
            break
        } else if (CheckMapInArea("SandVillageRaid")) {
            global SandVillageFound := true
            break
        } else if (CheckMapInArea("AntKingdomRaid")) { ; Novo mapa adicionado
            global AntKingdomRaidFound := true
            ;global AntKingdomFound := true
            AddToLog("AntKingdomRaid encontrado.")
            break
        } else if (CheckMapInArea("RuinedCityRaid")) { ; Novo mapa adicionado
            ;global RuinedCityRaidFound := true
            global RuinedCityFound := true
            AddToLog("RuinedCityRaid encontrado.")
            break
        } else if (CheckMapInArea("FutureCityRaid")) { ; Novo mapa adicionado
            global FutureCityRaidFound := true
            AddToLog("FutureCityRaid encontrado.")
            break
        } else if (CheckMapInArea("map_halloween")) { ; Novo mapa adicionado
            global FutureCityRaidFound := true
            AddToLog("map_halloween encontrado.")
            break
        } else {
            ; Se nenhum mapa for encontrado, repete a verificação
            AddToLog("Repetindo a verificação...")
        }
    }
    return true
}