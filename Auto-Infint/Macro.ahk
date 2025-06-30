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
cancel_boton := "|<>*138$82.zzwDzzzzzzzszzzz0DzzzzzzzXzzzs0TzzzzzzyDzzz01zzzzzzzszzzsDjzzzzrz7XzzzVzw0k3w3k6DzzyDzU307U60Mzzzszw0A0A0kEXzzzXzkkkkkz72DzzyDz7X7X7w08zzzsTwQASATk1XzzzkMk0lskX3y7zzz01037X040MDzzy060ASC0M1Uzzzy1y8lsy7k73zU"
rainvilager_verificaçao := "|<>*51$33.U0000Q00003U0000Q00003U0000Q00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A00001U0000A"

; Variáveis para os nomes dos mapas (abreviações)
PlanetGreenie := "|<>*90$137.zzwTzzzzzzzzzzzzzzzyDzzw0szzzzzzDzs3zzzzzzwTzzs0lzzzzzyDz03zzzzzzszzzk1XzzzzzwTy0DzzzzzzzzzzXV7zzzzXszsSTnszXvzzszz7WD0A0w10Dlzs30Q1U770TyC4Q0M1k20TXUk40k30CA0Tw0Ms0k1V21y61UMEV20AMEzs0lllXX66DyC37lV64QMlVzk3XXX760QTwT6D060Msl07zXz766CATszsSAT7wTllX7zz7y60AQM1kTs0My0M1XX60TyDw60Mss3Uzs0ly0s376C0zwTwS8lls7lzs7Xy1s6CAS1y"
WalledCity := "|<>*90$137.zzzzzsnzzz7zzwTzzzzzzzzwyTDzlXzzyDz0stzzzzzzzzksQDzX7zzwTw0Flzzzzzzzzlkszz6Dzzszk0zXzzzzzzzzXVlzyATXzlz3nz7rrzzzzzz2130AMw1k3yDy8073zzzzzz42A0Mlk307wTwE2CDzzzzzy00M0lXV20DkzskA8Tzzzzzw30llX764QTlzllwEzzzzzzw63XX6C0MszXzXXs3zzzzzzsA766AQTlVz3n77s7zzzzzzswS0A881U3z02C3kTzzzzzzlsy0MEM3U7z0AQ7kzzzzzzzbty8sks7WDz0syDXzzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzznzzzzzzU"
SnowyTown := "|<>*89$137.z0zzzzzzzzz00Tzzzzzzzzzw0zzzzzzzzy00zzzzzzzzzzs1zzzzzzzzzsTzzzzzzzzzzlzzzsyzvjjzlz7rzTzzzzzzVz0D0FlUC7zXs2CAE3zzzzz0S0Q0V24QTz7U48EU7zzzzz0Q0M0W4MMzyD04EX07zzzzzUMsll00sXzwSC806CDzzzzzsllXX01k7zswQM0AQTzzzzllXX7607kDzlssk0sszzzzzU3760C4DkzzXk1kVllzzzzz0CCC0wMzVzz7k7X7XXzzzzzUwQS3wtz7zyDkTbD77zzzzzzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzbzzzzzzzzzzzzzk"
SandVillage := "|<>*90$137.zzzzzzzlzzzlXDzzzzzzzzzy1zzzzzXyTtX6Dzzzzzzzzzs1zzzzz7sTV6ATzzzzzzzzzk3zzzzyDsz7wMzzzzzzzzzzXzzzzzwTkwDslzvzrszzzzz3z0A0w0zlsslXk3U70Tzzzy0w0M1k1zVVlX7060A0zzzzy0s0k1U3zX7X6C0A0MEzzzzz0llXX77z2D6AQMMklVzzzzzlXX76CDz0yAMssll07zzzzXX66CAMTy1wMllVV37zzzzz060AQM0zy7skUU3060Tzzzy0S0Mss1zwDlV1U70C0zzzzz1y8nlsXzwzXX3WDYS1zzzzzzzzzzzzzzzzzzzxkzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzzkzzzzzzU"
NavyBay := "|<>*93$137.yDXzzzzzzU7zzzzzzzzzzzzwD7zzzzzz07zzzzzzzzzzzzsSDzzzzzy07zzzzzzzzzzzzkQTzrvjjwQDzvvzzzzzzzzzUMs1DUSDssQ03Vzzzzzzzzz0FU0C4QTl1k177zzzzzzzzy8X04QMMzW3U26DzzzzzzzzwE6CAEsXz73768zzzzzzzzzskAQM3k7yD6CA1zzzzzzzzzlkMks7kDwSAMQ3zzzzzzzzzXkk1kTkzs0M0wDzzzzzzzzz7lk3kzVzk1s1sTzzzzzzzzyTXl7nz7zU7sXlzzzzzzzzzzzzzzzwDzzzzz3zzzzzzzzzzzzzzzszzzzzyDzzzzzzzzzzzzzzzlzzzzzwTzzzzzzzzzzzzzzzbzzzzztzzzzzzzzzk"
FiendCity := "|<>*89$137.zzwTzzzz7zzwTzzzzzzzzzzw08zzzzyDz0stzzzzzzzzzzs0FzzzzwTw0Flzzzzzzzzzzk0zzzzzszk0zXzzzzzzzzzzXzzlzzzlz3nz7rrzzzzzzzz7yC0k3k3yDy8073zzzzzzzy0QM1U707wTwE2CDzzzzzzzw0skV060DkzskAATzzzzzzzs1lX2CAQTlzllwFzzzzzzzzlzX0AQMszXzXXs3zzzzzzzzXz6DsslVz3n77s7zzzzzzzz7yA0llU3z02C3sTzzzzzzzyDwQ1XXU7z0AQ7kzzzzzzzzwTsw377WDz0syDXzzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzznzzzzzzzzU"
SpiritWorld := "|<>*89$137.zzzzlzszzzzzzzzszszzzzzy1zzXzlnzntwzzzlzlzzzzzs1zz7zXXz3VkzzzXzXzzzzzk3zzzzz7z73Xzzz7z7zzzzzXzzzzbyDyC77XzaDyDzzzzz3y0sk4E3w84A1k4S0Tzzzzy0w0lU8U7wE8k3U8s0zzzzzy0s0X0lUTs01U30lk1zzzzzz0ll6DXXzkA376DXXXzzzzzzlXWAT77zkMCCAT777zzzzzXX24MyCDzUkQQMyCADzzzzz060MlwQ7z3ls0lwA0Tzzzzy0Q0lXssDz7Xs3XsA0zzzzzz1sbX7lwTyTbsD7swFzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzyDzzzzzzzzzzzzzzzzzzzU"
AntKingdom := "|<>*89$137.zzzzzzzzz7zzzzszzzzzzzzztzzzDz7aDzzzzlzzzzzzzzzVzzyDyC4TzzzzXzzzzzzzzz3zzwTwMTzzzzz7zzzzzzzzw3zzszsVzzzzjyDXzzjzzzzs7k30Dk7X0D0C0Q1k47zzzzU7U60TUT60Q0M0k1U0Dzzzz6D061z0yA0M0k1U300TzzzwACCCDy0wMslVXX76AMTzzzs0QQQTw0sllXX76CAMkzzzzU0MsszsVlXX26AAQMlVzzzz7sllkTlVX760A0M0lX3zzzwDlXXUzXV6CC0Q0s3X67zzzwzn77lz7aAQT8wFsD6CTzzzzzzzzzzzzzzvVzzzzzzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzzzzzz0DzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzU"
MagicTown := "|<>*92$137.zzzzzzzXzzzzzzzzzzzzzzzwTszzzz7zz00TzzzzzzzzzzsTVzzzyDzy00zzzzzzzzzzzky3zzzzzzzszzzzzzzzzzzzUs7zzzzzTzlz7rzTzzzzzzz0kC0Q0lkDzXs2CAE3zzzzzy00M0k1X0Dz7U48EU7zzzzzwE8k1U360zyD04EX07zzzzzsklXX66ATzwSC806CDzzzzzlXX76CAMzzswQM0AQTzzzzzXz6AAMMlbzlssk0sszzzzzz7yA0M0lU7zXk1kVllzzzzzyDwQ0s1XUDz7k7X7XXzzzzzwzswFxX7VzyDkTbD77zzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzw0zzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzU"
HauntedAcademy := "|<>*87$137.zzzzzzzzzzzwzzzzzzzbzzzwSDzzzzyDzzkzszzzzy7zzzswTzzzzwTzzVzlzzzzwDzzzlszzzzzszzz3z1zzzzsTzzzXlsaSN7UQ7k7y3wDWS0sCFz03UAQE20k70Ds3kC0s10A0y060MsU410A0Tl70M1U60M1w0AMll6CCAMlz26BlX6AMl3swFlXWCAM0lXy08T76AE1X7lslX64QMszX7s08z6AMkD6DXlU608skkr0DlwE60M1VCAT7XUC0FlUU70T3sEC0s30AMyTbWS9bbVkT4zDtky9sbUtn"
MagicHills := "|<>*90$137.zzzzzzzXzzzzslbzzzzzzzzwTszzzz7zzXslX7zzzzzzzzsTVzzzyDzz7lX6Dzzzzzzzzky3zzzzzzyDXyATzzzzzzzzUs7zzyzyTwT7wMyDzzzzzzz0kC0Q0lkDsyAMlk7zzzzzzy00M0k1X0Dk0MlXUDzzzzzzwE8k1U360zU0lX77zzzzzzzsUlXX66ATz01X6C1zzzzzzzlXX76CAMzyDX6AS1zzzzzzzXz6AAMMlbwT6AMz3zzzzzzz7yA0M0lU7syAMEF7zzzzzzyDwQ0s1XUDlwMkUUDzzzzzzwTswFwX7UzXsllVUzzzzzzzzzzzzi7zzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzw0zzzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzU"
SpaceCenter := "|<>*89$137.z0zzzzzzzzw3zzzyDzzzzzzw0zzzzzzzzk1zzzwTzzzzzzs1zzzzzzzz03zzzszzzzzzzlzzzzzrwTwDDXzzlz7qTzzzVz0S0Q3UDszw1U60M30Tzzz0S0M0k20Tlzk30A0U60zzzz0Q0E1UA8T3zV20A3243zzzzUMsXX7skz7z64QQSA8zzzzzsll76Dk3yDy0Msss0lzzzzllV2AANXzwDATlllszXzzzzU30A0M10Dw081XXUk37zzzz0C0w0s30Tw0s3771k6DzzzzUwHwFsD0zw3s6CDXkATzzzzzszzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzk"
AlienSpaceship := "|<>*89$137.zzz77zzzzzzzzzzzzzzXz7zztyCDzzzzUTzzzzzzzz7yDzzVwQTzzzy0TzzzzzzzyDwTzz3szzzzzw0zzzzzzzzwTzzzw3lzwTzzszzzzznyDlszzzzs7XXUA0zkzUD0C1k60k3X0zU7760M1zUD0A0M10A1U761z6CCA8E1zUC080k648z06A3wAAQMkXXzkAQFVXwMECCAMzs0Msk377zwMsXX7s1kAQMlzU0FlXyCDsskV66AlzsMslVT7sVX0AQTk1U60A0U68llX0wDl170MszU70C0Q1UA1XX61wzn6D0llzkS9y8w7UQ776AHzzzzzzzzzzwTzzzzzzzzzszzzzzzzzzzzszzzzzzzzzzlzzzzzzzzzzzlzzzzzzzzzzXzzzzzzzzzzzXzzzzzzzzzz7U"
FabledKingdom := "|<>*91$137.zzzzlzXzzyDzzlzzzzyDzzzw0DzXz7zzwTltXzzzzwTzzzs0Tz7yDzzszXV7zzzzszzzzk0zyDwTzzlz67zzzzzlzzzzXzzwTsz7zXy8TzzzvzXszzz7y0M3ls3U7w1sk3k3U70Q1y0M0k3XU60Ds7lU7060A0M1w0k1U37240TkDX060A0M0k3s1XX76CA8szUD6CAMMsllX7lz76CAQ0llz0CAQMsllXX6DXyAA8MszX3y8QMskVX376AT7w0M0kkX07wMMllU3060AMyDw0k3Uk70DssFXXU70C0slwTwFUDXkD4TltX77WD4S3lXzzzzzzzzzzzzzzzysTzzzzzzzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzsTzzzzzU"
RuinedCity := "|<>*88$137.zzzzszzzzyDzzszzzzzzzzzw0zzlzzzzwTy1lnzzzzzzzzs0zzXzzzzszs0XXzzzzzzzzk1zzzzzzzlzU1z7zzzzzzzzXVzzzzz7zXy7byDjjzzzzzz7WCAM1s3U7wTwE0C7zzzzzyC4QMk3U60DszsU4QTzzzzzw08slU3240TVzlUMEzzzzzzs0llX76A8szXzXXsVzzzzzzk1XX6CA0llz7z77k7zzzzzzXX66AQMzX3y7aCDkDzzzzzz720AMsk307y04Q7UzzzzzzyD60Mllk70Dy0MsDVzzzzzzwSS8lXXkD4Ty1lwT7zzzzzzzzzzzzzzzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzbzzzzzzU"
PuppetIsland := "|<>*91$137.zzzzzzzzzzzzzz7zzzzwTzzw0zzzzzzztzszyDzzzzszzzs0zzzzzzzlzlzwTzzzzlzzzk1zzzzzzzXzXzszzzzzXzzzXVzzzzzwT7z7Xlzvzzz7zzz7WCA1k7U81yA1Xk30D0DzzyC4QM1U60E3wM37060Q0Tzzw0Msk1048EDslyC0A0M0zzzs0llXWC8klzlUQQMMsllzzzk3XX74QE3XzXUMksllXXzzzXz6648EXz7z7kllVXX67zzz7y0A0k32C3yAFVU3760DzzyDy0M3UD0Q7wM31U6CC0TzzwTy8lD4z0yDssD7WAQS8zzzzzzzXyDzzzzzzzzzzzzzzzzzzzz7wTzzzzzzzzzzzzzzzzzzzyDszzzzzzzzzzzzzzzzzzzzwTlzzzzzzzzzzzzzzzzU"
VirtualDungeon := "|<>*87$137.zzzXzzzzzzlzzzzzzzzzzzzwzn7znzzzzXz0Dzzzzzzzzzkz2DzXzzzz7y0DzzzzzzzzzlyDzz7zzzyDw0DzzzzzzzzzVsTzCDzzzwTssCyxzzvwTlzXllU02CC0MzlsMsk3k3UC0z33X004QM0lzXsllU7060M1z6D61UMsk1Xz7lXX060A8E3y4SATXllXX7yDX76CAMMkXby1wMz7XX76DwS6CAQMsU37Dw3slyD26AATssQ8MskVXyCTwDlXw60A0MTk0s0llU30A0zsTX7sC0Q0kTU3s1XXU70Q1ztz6DwS8wFlz0TsX77WD0w7zzzzzzzzzzzzzzzzzysTzzzzzzzzzzzzzzzzzzzzs1zzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzsTzzzU"
SnowyKingdom := "|<>*87$137.zzzzzzzzzzzzz7zzzzszzzzy1zzzzzzzzz7aDzzzzlzzzzs1zzzzzzzzyC4TzzzzXzzzzk3zzzzzzzzwMTzzzzz7zzzzXzzzlxzrTTsVzzzzjyDXxjz3y0S0XX0QDk7X0D0C0Q1k4y0w0s1248szUT60Q0M0k1U1y0s0k148klz0yA0M0k1U303z0llXW01l7y0wMslVXX76ATzlXX7603UDw0sllXX76CAMzXX76CA0DUTsVlXX26AAMMlz06CA0Q8TVzlVX760A0M0lXy0QQQ1slz3zXV6CC0Q0s3X7z1ssw7tnyDz7aAQS8wFsD6DzzzzzzzzsTzzzzzvVzzzzzzzzzzzzzzlzzzzzzk7zzzzzzzzzzzzzzXzzzzzz0DzzzzzzzzzzzzzzDzzzzzzVzzzzzzU"
DungeonThrone := "|<>*87$137.zzzzzzzzzzzzzzzzyDzzzzzw0zzzzzzzzzzzzk04Tzzzzzs0zzzzzzzzzzzzU08zzzzzzk0zzzzzzzzzzzzy7lzzzzzzXUzzzzzjlz7zzzwTXzwyDrz7VXX0D0C0s3U7zsz0C0k70yDX760Q0M1U30Dzly0Q1061wT6CA0M0kV060DzXw0M60A3syAQMslVX2CAQTz7sslwQMzlsMsllXX0AQMszyDllXkslzXVkVXX66DssllzwTXX7llXz03U3760A0k1XXzsz76DU37y0DU6CC0Q1k777zlyCATUCDw1zWAQT8w3kSCDzXwQMzUwTzzzzzzvVzzzzzzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzzzzzz0DzzzzzzzzzzzzzzzzzzzzzVzzzzzzzzzzzzzzzU"
MountainTemple := "|<>*88$137.zzzzzzzzzzzzXzzzzzzzzzzwTszzzzzzDzz7zzk07zzzzzsTVzzzzzyDzyDzzU0Dzzzzzky3zzzzzwTzzzzzy7zzzzzzUs7lzzzzszzzzzzwTlzzjzz0kC0ssk30A0lU7zsy0k460y00M1llU60E1X0Dzls1U0A1wE8k1XX061U360DzXkV00M3sUlXX76CCD76AQTz7X2AMFrlXX76CAQQQCAMszyC0AMkXjXz6CA8MsswMMllzwSDslV2T7yA0M0llkM0lXXzsw0lX20yDwQ1s1XXUs1X77zlw1X641wTsw7sX77lsX6CDzXw36CMbzzzzzzzzzzzzzzzzzzzzzlzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzzzzzzzzzz7zzzzzzzzzzzzzzzzzzzzzyDU"
RainVillage := "|<>*86$137.zzzzszzzzzlXDzzzzzzzzzzw0zzlzzyTtX6Dzzzzzzzzzzs0zzXzzsTV6ATzzzzzzzzzzk1zzzzzsz7wMzzzzzzzzzzzXVzzzzzkwDslzvzrszzzzzz7X0AM1zlsslXk3U70TzzzzyC40Mk3zVVlX7060A0zzzzzw080lU3zX7X6C0A0MEzzzzzs0llX77z2D6AQMMklVzzzzzk1XX6CDz0yAMksll07zzzzzXX66AQTy1wMllVV37zzzzzz720AMszy7skUU3060TzzzzyD60MllzwDlV1U70C0zzzzzwSC8lXXzwzXX3WD4S1zzzzzzzzzzzzzzzzzzzxkzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzzkzzzzzzzU"

global PlanetGreenieFound := false
global WalledCityFound := false
global SnowyTownFound := false
global SandVillageFound := false
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
global RuinedCityFound := false
global PuppetIslandFound := false
global VirtualDungeonFound := false
global SnowyKingdomFound := false
global DungeonThroneFound := false
global MountainTempleFound := false
global RainVillageFound := false
global RunCount, DesiredRuns

F4:: Pause -1 ; Pausa indefinidamente ao pressionar F4

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

BetterClick(x, y, LR := "Left") {
    jogarEmTudo() ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

GoToRaids() {
    global

    loop {
        if (ok := FindText(&X, &Y, 754, 488, 835, 560, 0, 0, AreasText)) {
            break
        }
        else {
            AddToLog("error  lobby unidentified") ;
        }
    }

    loop 5 {

        if (ok := PixelSearch(&hx, &hy, 0, 0, 800, 600, 0xDC0A0B or 0xDC0000, 5)) {
            BetterClick(hx, hy)
        }
        Sleep 100
    }
    SendInput ("{Tab}")
    AddToLog("For support, make sure to click on the discord icon above")


    AddToLog("Attempting to go to raids...")


    loop {
        if (ok := FindText(&X, &Y, 361, 542, 507, 596, 0, 0, cancel_boton))
        {
            AddToLog("achei o cancell")

            loop 5 {
                if (FindText(&X, &Y, 60, 278, 196, 303, 0, 0, PlanetGreenie) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, WalledCity) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SnowyTown) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SandVillage) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, NavyBay) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, FiendCity) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SpiritWorld) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, AntKingdom) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, MagicTown) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, MagicHills) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SpaceCenter) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, AlienSpaceship) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, FabledKingdom) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, RuinedCity) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, PuppetIsland) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, VirtualDungeon) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, HauntedAcademy))
                {

                    BetterClick(408, 520)
                    SendInput ("{Tab}")
                    GoToRaids()
                } else {
                    break
                }
            }
            break


        } else {
            AddToLog("TESTE")
            Sleep 2000

            BetterClick(89, 302) ; play
            Sleep 1000
            HoldKey("d", 1600)
            Sleep 500
            HoldKey("w", 3400)
            AddToLog("esperando entrar na sala")
        }
        if (ok := FindText(&X, &Y, 361, 542, 507, 596, 0, 0, cancel_boton))
        {
            AddToLog("achei o cancell")

            loop 5 {
                if (FindText(&X, &Y, 60, 278, 196, 303, 0, 0, PlanetGreenie) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, WalledCity) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SnowyTown) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SandVillage) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, NavyBay) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, FiendCity) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SpiritWorld) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, AntKingdom) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, MagicTown) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, MagicHills) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, SpaceCenter) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, AlienSpaceship) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, FabledKingdom) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, RuinedCity) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, PuppetIsland) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, VirtualDungeon) ||
                    FindText(&X, &Y, 60, 278, 196, 303, 0, 0, HauntedAcademy))
                {

                    BetterClick(408, 520)
                    SendInput ("{Tab}")
                    GoToRaids()
                } else {
                    break
                }
            }
            break


        }


    }


    loop {
        if (ok := FindText(&X, &Y, 361, 542, 507, 596, 0, 0, cancel_boton))
        {
            loop {
                ; Verifica cada mapa usando CheckMapInArea

                jonis()

                if (jonis())
                {
                    break
                }


            }


            ; Mapa 1 - Planet Greenie
            ; Mapa 1 - Planet Greenie
            ; Mapa 1 - Planet Greenie
            if (PlanetGreenieFound = 1) {
                BetterClick(700, 250)
                loop 10 {
                    SendInput("{Wheelup}")
                    Sleep 150
                }
                BetterClick(700, 250) ; Y = 250
            }

            ; Mapa 2 - Walled City
            if (WalledCityFound = 1) {
                BetterClick(700, 300)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                BetterClick(700, 295) ; Y = 295
            }

            ; Mapa 3 - Snowy Town
            if (SnowyTownFound = 1) {
                BetterClick(700, 350)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                BetterClick(700, 330) ; Y = 330
            }

            ; Mapa 4 - Sand Village
            if (SandVillageFound = 1) {
                BetterClick(700, 400)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                BetterClick(700, 375) ; Y = 375
            }

            ; Mapa 5 - Navy Bay
            if (NavyBayFound = 1) {
                BetterClick(700, 450)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                BetterClick(700, 420) ; Y = 420
            }

            ; Mapa 6 - Fiend City (reset para 250, Loop 2)
            if (FiendCityFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                loop 2 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 250) ; Y = 250 (reset)
            }

            ; Mapa 7 - Spirit World
            if (SpiritWorldFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 2 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 295) ; Y = 295
            }

            ; Mapa 8 - Ant Kingdom
            if (AntKingdomFound = 1) {
                BetterClick(700, 380)
                Loop 2 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 330) ; Y = 330
            }

            ; Mapa 9 - Magic Town
            if (MagicTownFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 2 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 375) ; Y = 375
            }

            ; Mapa 10 - Haunted Academy
            if (HauntedAcademyFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 2 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 435) ; Y = 435
            }

            ; Mapa 11 - Magic Hills (reset para 250, Loop 4)
            if (MagicHillsFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 4 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 222) ; Y = 222
            }

            ; Mapa 12 - Space Center
            if (SpaceCenterFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 4 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 266) ; Y = 266
            }

            ; Mapa 13 - Alien Spaceship
            if (AlienSpaceshipFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 4 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 330) ; Y = 330
            }

            ; Mapa 14 - Fabled Kingdom
            if (FabledKingdomFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 4 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 375) ; Y = 375
            }

            ; Mapa 15 - Ruined City
            if (RuinedCityFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 4 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 420) ; Y = 420
            }

            ; Mapa 16 - Puppet Island (reset para 250, Loop 8)
            if (PuppetIslandFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Sleep 500
                Loop 6 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 212) ; Y = 250 (reset)
            }

            ; Mapa 17 - Virtual Dungeon
            if (VirtualDungeonFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 6 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 250) ; Y = 250
            }

            ; Mapa 18 - Snowy Kingdom
            if (SnowyKingdomFound = 1) {
                BetterClick(700, 380)
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 6 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 300) ; Y = 300
            }

            ; Mapa 19 - Dungeon Throne
            if (DungeonThroneFound = 1) {
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 6 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 375) ; Y = 375
            }

            ; Mapa 20 - Mountain Temple
            if (MountainTempleFound = 1) {
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 6 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 420) ; Y = 420
            }

            ; Mapa 21 - Rain Village (reset para 250, Loop 10)
            if (RainVillageFound = 1) {
                BetterClick(700, 380)
                loop 10 {
                    Sleep 150
                    SendInput("{WheelUp}")
                }
                Loop 8 {
                    Sleep 150
                    SendInput("{WheelDown 1}")
                }
                BetterClick(700, 380)
            }


            break
        }
        else {
            Sleep 2000
            AddToLog ("esperando entrar na sala")
        }
    }
    ;verificaçao de qual rota fazer


    ; Verificações para cada mapa


    ;LoadedLoop()
    ;OnSpawnSetup()
    BetterClick(285, 240) ;clicando na infinit
    Sleep 1500
    BetterClick(285, 240) ;clicando na infinit
    Sleep 500


    BetterClick(400, 430) ;clicando em start
    Sleep 1500
    BetterClick(400, 430) ;clicando em start
    Sleep 500

    BetterClick(330, 320) ;clicando em play
    Sleep 1500
    BetterClick(330, 320) ;clicando em play
    Sleep 500

    BetterClick(400, 460) ;clicando em Start
    Sleep 1500
    BetterClick(400, 460) ;clicando em Start
    Sleep 500


    loop {

        if (!ok := FindText(&X, &Y, 361, 542, 507, 596, 0, 0, cancel_boton)) {
            Sleep 2000
            CheckAndSetupMaps()
            break
        } else {
            AddToLog ("esperando tela de carregamento ")
            Sleep 1000

        }
    }
    AddToLog ("sai do loop")
}


; Função para verificar e configurar mapas ativos
CheckAndSetupMaps() {
    jogarEmTudo()

    if (PlanetGreenieFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: PlanetGreenie")
        PlanetGreenieOnSpawnSetup()
        return ; Interrompe a execução após encontrar o mapa
    }
    if (WalledCityFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: WalledCity")
        WalledCityOnSpawnSetup()
        return
    }
    if (SnowyTownFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: SnowyTown")
        SnowyOnSpawnSetup()
        return
    }
    if (SandVillageFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: SandVillage")
        SandOnSpawnSetup()
        return
    }
    if (NavyBayFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: NavyBay")
        NavyBayOnSpawnSetup()
        return
    }
    if (FiendCityFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: FiendCity")
        FiendCityOnSpawnSetup()
        return
    }
    if (SpiritWorldFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: SpiritWorld")
        SpiritWorldOnSpawnSetup()
        return
    }
    if (AntKingdomFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: AntKingdom")
        AntOnSpawnSetup()
        return
    }
    if (MagicTownFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: MagicTown")
        MagicTownOnSpawnSetup()
        return
    }
    if (HauntedAcademyFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: HauntedAcademy")
        HauntedAcademyOnSpawnSetup()
        return
    }
    if (MagicHillsFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: MagicHills")
        MagicOnSpawnSetup()
        return
    }
    if (SpaceCenterFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: SpaceCenter")
        SpaceCenterOnSpawnSetup()
        return
    }
    if (AlienSpaceshipFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: AlienSpaceship")
        AlienSpaceshipOnSpawnSetup()
        return
    }
    if (FabledKingdomFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: FabledKingdom")
        FabledKingdomOnSpawnSetup()
        return
    }
    if (RuinedCityFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: RuinedCity")
        RuinedCityOnSpawnSetup()
        return
    }
    if (PuppetIslandFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: PuppetIsland")
        PuppetIslandOnSpawnSetup()
        return
    }
    if (VirtualDungeonFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: VirtualDungeon")
        VirtualDungeonOnSpawnSetup()
        return
    }
    if (SnowyKingdomFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: SnowyKingdom")
        SnowyKingdomOnSpawnSetup()
        return
    }
    if (DungeonThroneFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: DungeonThrone")
        DungeonThroneOnSpawnSetup()
        return
    }
    if (MountainTempleFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: MountainTemple")
        MountainOnSpawnSetup()
        return
    }
    if (RainVillageFound = true) {
        jogarEmTudo()
        AddToLog("Chegamos ao mapa: RainVillage")
        RainVillageOnSpawnSetup()
        return
    }
}
; Caso nenhum mapa seja encontrado
AddToLog("Nenhum mapa ativo foi encontrado.")


; Função para adicionar logs (exemplo)

mapa1() {
    BetterClick(720, 277)
    sleep 500
    BetterClick(720, 277)
    sleep 500
    BetterClick(282, 268)
    sleep 500
    BetterClick(413, 463)
    sleep 500
    BetterClick(371, 378)
    sleep 500
    BetterClick(396, 485)
}
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 37, 134, 104, 224, 0xFFBD18 or 0xEE8168 or 0xCC6C6B or 0xFFBD19, 10) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 302, 51, 673, 156, 0x574527 or 0x57492D, 0) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 302, 51, 673, 156, 0x5E4924 or 0x695C4F or 0x65512C or 0x604D2A or 0x6D614B, 30) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 247, 231, 296, 312, 0xFFFFB9, 0) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 623, 241, 781, 418, 0x847C6E or 0x113663 or 0x053186 or 0x33547F or 0x002161, 3) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 667, 274, 773, 366, 0xEDF0D5 or 0x455367 or 0x81AA9F or 0x062D5F, 3) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 592, 56, 823, 174, 0x00604E or 0x04242D or 0x005E4B or 0x032E31, 3) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        if PixelSearch(&Px, &Py, 85, 392, 113, 421, 0xBD2974 or 0xBC2A76, 0) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
    Sleep 923
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 2201
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 517
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 1027
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 177
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 566
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 810
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 2845
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 2200
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 400
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 279
    SendInput("{w up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 147
    SendInput("{a up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 741
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 274
    SendInput("{d up}")
    Sleep 100
    SendInput("{w down}")
    Sleep 1808
    SendInput("{w up}")
    Sleep 100
    SendInput("{d down}")
    Sleep 230
    SendInput("{d up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 387
    SendInput("{a up}")
    Sleep 100
    SendInput("{s down}")
    Sleep 96
    SendInput("{s up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 165
    SendInput("{a up}")
    Sleep 100
    SendInput("{a down}")
    Sleep 81
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 643, 220, 771, 331, 0xBEABA1 or 0x8A766A or 0x856A57 or 0x817161, 3) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        Sleep 1000
        if PixelSearch(&Px, &Py, 385, 0, 430, 25, 0x091512) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
            if PixelSearch(&Px, &Py, 757, 331, 824, 439, 0x091512, 10) {
                jogarEmTudo()
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
        jogarEmTudo()

        SendInput ("{d up}")
        Sleep 100
        SendInput ("{d down}")
        Sleep 5200
        SendInput ("{d up}")
        KeyWait "d"
    }
    else {
        jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 561, 277, 687, 416, 0xFFD300 or 0xFFD200, 0) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 775, 49, 832, 101, 0x10C9FF or 0x25FFFF, 0) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 210, 348, 253, 388, 0x8BEAFF or 0x8DEAFF or 0x91ECFF or 0x91ECFF, 10) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 521, 377, 565, 460, 0xFF821A or 0xFFCD00, 10) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 202, 286, 234, 315, 0x5F584D or 0x5F5A49 or 0x555549 or 0x212D3F or 0x212D40 or 0x58524B, 20) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 133, 484, 185, 538, 0xFFF671, 20) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 205, 553, 248, 598, 0xC717AB or 0xF878FF or 0xF87EFF or 0xF770FF or 0xCE1BB3 or 0xF76DFF, 20) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 745, 88, 800, 113, 0x426DA5 or 0x2A5C99 or 0x0D478A or 0x446CA0 or 0x114B8C or 0x5D7AA9, 20) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 640, 573, 740, 641, 0x130055 or 0x10004F or 0x110050, 20) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 36, 464, 115, 504, 0x00001B or 0x000013 or 0x040C28 or 0x000017, 20) {
            jogarEmTudo()
            AddToLog("Correct Angle")
            break
        }
        else {
            jogarEmTudo()
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
        jogarEmTudo()
        if PixelSearch(&Px, &Py, 591, 48, 847, 349, 0x211D37) {
            jogarEmTudo()
            AddToLog("Correct Angle 1")
            break
        } else {
            jogarEmTudo()
            if PixelSearch(&Px, &Py, 28, 81, 105, 318, 0x00000C or 0x00000A or 0x00000B or 0x00000D or 0x00000F,) {
                jogarEmTudo()
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
                jogarEmTudo()
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


Replaying() {
    jogarEmTudo()
    ; global RunCount, DesiredRuns

    jogarEmTudo()
    ; Código existente para reconectar
    loop {
        jogarEmTudo()
        if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
            jogarEmTudo()
            AddToLog("Carregando próxima fase...")
            break
        }
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            jogarEmTudo()
            break
        }
        Reconnect()
        Sleep 1000
    }
    ;if (RunCount >= DesiredRuns){
    jogarEmTudo()
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
    jogarEmTudo()
    SaveLocal
    if ControlGetVisible(keybindsGui) {
        jogarEmTudo()
        return
    }
    Reload()
}
; Define the rectangle coordinates


#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\Gdip_All.ahk


UpgradeUnit(x, y) {
    jogarEmTudo()
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
        jogarEmTudo()
        if (WebhookCheckbox.Value = 1) {
            jogarEmTudo()
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
        jogarEmTudo()
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
        jogarEmTudo()
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
        jogarEmTudo()
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
        jogarEmTudo()
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
    jogarEmTudo()

    ;if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText)){
    jogarEmTudo()
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
        ;if (RunCount >= DesiredRuns){

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
        ;if (RunCount >= DesiredRuns){

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
            jogarEmTudo()
            if (ok := FindText(&X, &Y, 743, 488, 830, 553, 0, 0, AreasText))
                break
        }
        AddToLog("esta no loby replay")

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
        jogarEmTudo()
        for char in StrSplit(chat) {
            jogarEmTudo()
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
        jogarEmTudo()
        return
    }
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            jogarEmTudo()
            AddToLog("invalid captcha retrying")
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha){
        jogarEmTudo()
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        jogarEmTudo()
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
            jogarEmTudo()
            AddToLog("invalid captcha retrying")
            BetterClick(584, 192) ; close captcha
            return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha){
        jogarEmTudo()
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        jogarEmTudo()
        AddToLog("NO CAPTCHA FOUND.")
    }

    BetterClick(309, 386) ; select
    Sleep 1500
    BetterClick(383, 221)
    Sleep 500

    sleep 6000
    if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
        jogarEmTudo()
        return
    }
    if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
        jogarEmTudo()
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
            jogarEmTudo()


            AddToLog("Reconnecting to Roblox...")
            BetterClick(500, 388)
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
    jogarEmTudo()
    SendInput ("{" key "up}")
    ; go to teleporter
    Sleep 100
    SendInput ("{" key " down}")
    Sleep duration
    SendInput ("{" key " up}")
    KeyWait key ; Wait for "d" to be fully processed
}
CheckMapInArea(mapName) {
    global ; Permite acessar variáveis globais
    jogarEmTudo()

    if (ok := FindText(&X, &Y, 60, 278, 196, 303, 0, 0, %mapName%))
    {
        AddToLog(mapName " found!")
        Sleep 1000
        return true
    }
    else {
        jogarEmTudo()

        ;AddToLog("Map identification failed" mapName " found!")
        Sleep 10

    }
}


CheckMaps() {

    jogarEmTudo()
    ; Verifica cada mapa usando CheckMapInArea
    loop {
        jogarEmTudo()
        if (CheckMapInArea("PlanetGreenie")) {
            jogarEmTudo()
            global PlanetGreenieFound := true
            break

        } else {
            jogarEmTudo()
            if (CheckMapInArea("WalledCity")) {
                jogarEmTudo()
                global WalledCityFound := true

                break
            } else {
                jogarEmTudo()
                if (CheckMapInArea("SnowyTown")) {
                    jogarEmTudo()
                    global SnowyTownFound := true

                    break
                } else {
                    jogarEmTudo()
                    if (CheckMapInArea("SandVillage")) {
                        jogarEmTudo()
                        global SandVillageFound := true

                        break
                    } else {
                        jogarEmTudo()
                        if (CheckMapInArea("NavyBay")) {
                            jogarEmTudo()
                            global NavyBayFound := true

                            break
                        } else {
                            jogarEmTudo()
                            if (CheckMapInArea("FiendCity")) {
                                jogarEmTudo()
                                global FiendCityFound := true

                                break
                            } else {
                                jogarEmTudo()
                                if (CheckMapInArea("SpiritWorld")) {
                                    jogarEmTudo()
                                    global SpiritWorldFound := true

                                    break
                                } else {
                                    jogarEmTudo()
                                    if (CheckMapInArea("AntKingdom")) {
                                        jogarEmTudo()
                                        global AntKingdomFound := true

                                        break
                                    } else {
                                        jogarEmTudo()
                                        if (CheckMapInArea("MagicTown")) {
                                            jogarEmTudo()
                                            global MagicTownFound := true

                                            break
                                        } else {
                                            jogarEmTudo()
                                            if (CheckMapInArea("HauntedAcademy")) {
                                                jogarEmTudo()
                                                global HauntedAcademyFound := true

                                                break
                                            } else {
                                                jogarEmTudo()
                                                if (CheckMapInArea("MagicHills")) {
                                                    jogarEmTudo()
                                                    global MagicHillsFound := true

                                                    break
                                                } else {
                                                    jogarEmTudo()
                                                    if (CheckMapInArea("SpaceCenter")) {
                                                        jogarEmTudo()
                                                        global SpaceCenterFound := true

                                                        break
                                                    } else {
                                                        jogarEmTudo()
                                                        if (CheckMapInArea("AlienSpaceship")) {
                                                            jogarEmTudo()
                                                            global AlienSpaceshipFound := true

                                                            break
                                                        } else {
                                                            jogarEmTudo()
                                                            if (CheckMapInArea("FabledKingdom")) {
                                                                jogarEmTudo()
                                                                global FabledKingdomFound := true

                                                                break
                                                            } else {
                                                                jogarEmTudo()
                                                                if (CheckMapInArea("RuinedCity")) {
                                                                    jogarEmTudo()
                                                                    global RuinedCityFound := true

                                                                    break
                                                                } else {
                                                                    jogarEmTudo()
                                                                    if (CheckMapInArea("PuppetIsland")) {
                                                                        jogarEmTudo()
                                                                        global PuppetIslandFound := true

                                                                        break
                                                                    } else {
                                                                        jogarEmTudo()
                                                                        if (CheckMapInArea("VirtualDungeon")) {
                                                                            jogarEmTudo()
                                                                            global VirtualDungeonFound := true

                                                                            break
                                                                        } else {
                                                                            jogarEmTudo()
                                                                            if (CheckMapInArea("SnowyKingdom")) {
                                                                                jogarEmTudo()
                                                                                global SnowyKingdomFound := true

                                                                                break
                                                                            } else {
                                                                                jogarEmTudo()
                                                                                if (CheckMapInArea("DungeonThrone")) {
                                                                                    jogarEmTudo()
                                                                                    global DungeonThroneFound := true

                                                                                    break
                                                                                } else {
                                                                                    jogarEmTudo()
                                                                                    if (CheckMapInArea("MountainTemple")) {
                                                                                        jogarEmTudo()
                                                                                        global MountainTempleFound := true

                                                                                        break
                                                                                    } else {
                                                                                        jogarEmTudo()
                                                                                        if (CheckMapInArea("RainVillage")) {
                                                                                            jogarEmTudo()
                                                                                            global RainVillageFound := true

                                                                                            break
                                                                                        } else {
                                                                                            jogarEmTudo()
                                                                                            ; Se nenhum mapa for encontrado, retorna false
                                                                                            AddToLog ("repetindo a verificaçao")
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return true
}


jonis() {
    global

    if DesiredRuns == 1 { ; Macro 1
        PlanetGreenieFound := true
        AddToLog("teste")
        return true
    }
    if DesiredRuns == 2 { ; Macro 2
        WalledCityFound := true
        AddToLog("teste2")
        return true
    }
    if DesiredRuns == 3 { ; Macro 3
        SnowyTownFound := true
        return true
    }
    if DesiredRuns == 4 { ; Macro 4
        SandVillageFound := true
        return true
    }
    if DesiredRuns == 5 { ; Macro 5
        NavyBayFound := true
        return true
    }
    if DesiredRuns == 6 { ; Macro 6
        FiendCityFound := true
        return true
    }
    if DesiredRuns == 7 { ; Macro 7
        SpiritWorldFound := true
        return true
    }
    if DesiredRuns == 8 { ; Macro 8
        AntKingdomFound := true
        return true
    }
    if DesiredRuns == 9 { ; Macro 9
        MagicTownFound := true
        return true
    }
    if DesiredRuns == 10 { ; Macro 10
        HauntedAcademyFound := true
        return true
    }
    if DesiredRuns == 11 { ; Macro 11
        MagicHillsFound := true
        return true
    }
    if DesiredRuns == 12 { ; Macro 12
        SpaceCenterFound := true
        return true
    }
    if DesiredRuns == 13 { ; Macro 13
        AlienSpaceshipFound := true
        return true
    }
    if DesiredRuns == 14 { ; Macro 14
        FabledKingdomFound := true
        return true
    }
    if DesiredRuns == 15 { ; Macro 15
        RuinedCityFound := true
        return true
    }
    if DesiredRuns == 16 { ; Macro 16
        PuppetIslandFound := true
        return true
    }
    if DesiredRuns == 17 { ; Macro 17
        VirtualDungeonFound := true
        return true
    }
    if DesiredRuns == 18 { ; Macro 18
        SnowyKingdomFound := true
        return true
    }
    if DesiredRuns == 19 { ; Macro 19
        DungeonThroneFound := true
        return true
    }
    if DesiredRuns == 20 { ; Macro 20
        MountainTempleFound := true
        return true
    }
    if DesiredRuns == 21 { ; Macro 21
        RainVillageFound := true
        return true
    }
}