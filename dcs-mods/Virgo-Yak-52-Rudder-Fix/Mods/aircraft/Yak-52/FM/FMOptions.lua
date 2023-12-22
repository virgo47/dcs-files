tailWheelStaticFricK = 0.6
tailWheelSideFricK = 0.5
tailWheelRollFricK = 0.025
tailWheelGlideFricK = 0.54
tailWheelMOI = 0.15

mainWheelStaticFricK = 0.71
mainWheelSideFricK = 0.73*.8
mainWheelRollFricK = 0.022
mainWheelGlideFricK = 0.69
mainWheelBrakeMomentMax = 0.33 * 8000.0
mainWheelMOI = 0.32

tailGearYawDamperK = 36.0
tailGearAxleFricM0s = 250.0
tailGearAxleFricM0f = 5.0
tailGearAxleFricVs = 0.2
tailGearAxleFricVf = 1.2

tailGearStockLength = 0.15
tailGearSpringForceFactor = 320000
tailGearSpringForceFactorRate = 2
tailGearStaticForce = 3900
tailGearReduceLength = 0.005
tailGearDirectDamperForceFactor = 300.0
tailGearBackDamperForceFactor = 5600.0
tailGearDamageLengthLim = 0.1

mainGearSpringForceFactor = 430000
mainGearSpringForceFactorRate = 2
mainGearStaticForce = 7000.0
mainGearReduceLength = 0.02
mainGearDirectDamperForceFactor = 1300.0
mainGearBackDamperForceFactor = 19000.0
mainGearDamageLengthLim = 0.17

skew_w_wingK = 0.65
skew_w_tailK = 0.7

governorRegK = 0.0003
governorVelK = 0.0035
governorDamperK = 0.00002
governorNscale = 0.0
governorNc1 = 160.0
governorNc2 = 320.0
governorNc3 = 0.003
governorCentrifugalWeightK = 339.0
governorCentrifugalPressureK = 0.0

transversalK = 1.0

fuselageMyDampK = 0.1
fuselageMzDampK = 0.19*0.7
wingMzDampK = 0.43*0.7

stabSkewK = 0.0

--aileronTrimTab = -0.0             DEFAULT VALUE !
aileronTrimTab = -0.0205
elevatorTrimTab = 0.0
--rudderTrimTab = -0.666          DEFAULT VALUE !
rudderTrimTab = -0.385 

contactPosShiftK = 0.0

tailShadowPower = 8
tailShadowK = .5
tailShadowSpread = 58
damperShadowK = .7

wingShakeFilterK = 0.001
wingShakeFilterLim = 0.01

shakeScaleAD = 500.0

autoRudderK = 16.0*2.0
autoRudderWyK = 8.5*3.0
autoRudderWyLowTauInv = 0.5
autoRudderDampK = 0
autoRudderOutTauInv = 1.2

takeoffHelperK = 100.0
takeoffHelperWyTauInv = 0.7

propBodyShakeK = 20.0
propBodyShakeHor = 1.0
propBodyShakeVer = 1
propBodyShakeLim = 900.0
propDisbalanceShakeLim = 1200.0
detonationShakeK = 0.223

FFBK1 = 0.004444 * 2.0
FFBB1 = 0.375
FFBK2 = 0.0002777 * 2.0
FFBShakeLim = 0.0

overcritZeroPoint = 5.8
overcritK = 0.0015
overcritLineDisplacement = 1.0

overspeedGenericVim0 = 153.0 * 153.0 * 1.225 / 2.0
overspeedGenericVim1 = 187.0 * 187.0 * 1.225 / 2.0

automationFlags = 0

