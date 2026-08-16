'# MWS Version: Version 2025.1 - Oct 28 2024 - ACIS 34.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0 fmax = 60
'# created = '[VERSION]2025.1|34.0.1|20241028[/VERSION]


'@ use template: Antenna - Planar_11.cfg

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
'set the units
With Units
    .SetUnit "Length", "mm"
    .SetUnit "Frequency", "GHz"
    .SetUnit "Voltage", "V"
    .SetUnit "Resistance", "Ohm"
    .SetUnit "Inductance", "nH"
    .SetUnit "Temperature",  "degC"
    .SetUnit "Time", "ns"
    .SetUnit "Current", "A"
    .SetUnit "Conductance", "S"
    .SetUnit "Capacitance", "pF"
End With

ThermalSolver.AmbientTemperature "0"

'----------------------------------------------------------------------------

'set the frequency range
Solver.FrequencyRange "14", "16"

'----------------------------------------------------------------------------

Plot.DrawBox True

With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mu "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With

With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With

' optimize mesh settings for planar structures

With Mesh
     .MergeThinPECLayerFixpoints "True"
     .RatioLimit "20"
     .AutomeshRefineAtPecLines "True", "6"
     .FPBAAvoidNonRegUnite "True"
     .ConsiderSpaceForLowerMeshLimit "False"
     .MinimumStepNumber "5"
     .AnisotropicCurvatureRefinement "True"
     .AnisotropicCurvatureRefinementFSM "True"
End With

With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementRatio", "6"
End With

With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With

With MeshSettings
     .SetMeshType "Tet"
     .Set "VolMeshGradation", "1.5"
     .Set "SrfMeshGradation", "1.5"
End With

' change mesh adaption scheme to energy
' 		(planar structures tend to store high energy
'     	 locally at edges rather than globally in volume)

MeshAdaption3D.SetAdaptionStrategy "Energy"

' switch on FD-TET setting for accurate farfields

FDSolver.ExtrudeOpenBC "True"

PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"

With FarfieldPlot
	.ClearCuts ' lateral=phi, polar=theta
	.AddCut "lateral", "0", "1"
	.AddCut "lateral", "90", "1"
	.AddCut "polar", "90", "1"
End With

'----------------------------------------------------------------------------

With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With

With Mesh
     .MeshType "PBA"
End With

'set the solver type
ChangeSolverType("HF Time Domain")

'----------------------------------------------------------------------------

'@ import odbpp file: C:\Users\Ilysha\Desktop\Новая папка\PCB1.zip

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LayoutDB
     .Reset 
     .SourceFileName "C:\Users\Ilysha\Desktop\Новая папка\PCB1.zip" 
     .LdbFileName "*PCB1.ldb" 
     .PcbType "odbpp" 
     .KeepSynchronized "True" 
     .CreateDB 
     .LoadDB 
End With

'@ delete shapes

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.Delete "PCB1(PCB1)/Substrates:01_TOP_SOLDER" 
Solid.Delete "PCB1(PCB1)/Substrates:05_BOTTOM_SOLDER"

'@ define material: Rogers RO4350B LoPro (loss free)

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With Material
     .Reset
     .Name "Rogers RO4350B LoPro (loss free)"
     .Folder ""
     .FrqType "all"
     .Type "Normal"
     .SetMaterialUnit "GHz", "mm"
     .Epsilon "3.55"
     .Mu "1.0"
     .Kappa "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .KappaM "0.0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstKappa"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "General 1st"
     .DispersiveFittingSchemeMu "General 1st"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0.62"
     .SetActiveMaterial "all"
     .Colour "0.75", "0.95", "0.85"
     .Wireframe "False"
     .Transparency "0"
     .Create
End With

'@ change material: PCB1(PCB1)/Substrates:03_DIELECTRIC_1 to: Rogers RO4350B LoPro (loss free)

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.ChangeMaterial "PCB1(PCB1)/Substrates:03_DIELECTRIC_1", "Rogers RO4350B LoPro (loss free)"

'@ change material and color: PCB1(PCB1)/Substrates:03_DIELECTRIC_1 to: Rogers RO4350B LoPro (loss free)

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.SetUseIndividualColor "PCB1(PCB1)/Substrates:03_DIELECTRIC_1", 1
Solid.ChangeIndividualColor "PCB1(PCB1)/Substrates:03_DIELECTRIC_1", "0", "170", "127"

'@ define material: Rogers RO4350B LoPro (loss free)

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With Material 
     .Reset 
     .Name "Rogers RO4350B LoPro (loss free)"
     .Folder ""
     .Rho "0.0"
     .ThermalType "Normal"
     .ThermalConductivity "0.62"
     .SpecificHeat "0", "J/K/kg"
     .DynamicViscosity "0"
     .UseEmissivity "True"
     .Emissivity "0"
     .MetabolicRate "0.0"
     .VoxelConvection "0.0"
     .BloodFlow "0"
     .MechanicsType "Unused"
     .SolarRadiationAbsorptionType "Opaque"
     .Absorptance "0.0"
     .UseSemiTransparencyCalculator "False"
     .SolarRadTransmittance "0.0"
     .SolarRadReflectance "0.0"
     .SolarRadSpecimenThickness "0.0"
     .SolarRadRefractiveIndex "1.0"
     .SolarRadAbsorptionCoefficient "0.0"
     .IntrinsicCarrierDensityModel "none"
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "s"
     .Epsilon "3.48"
     .Mu "1.0"
     .Sigma "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .SetConstTanDStrategyEps "AutomaticOrder"
     .ConstTanDModelOrderEps "3"
     .DjordjevicSarkarUpperFreqEps "0"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0.0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .SetConstTanDStrategyMu "AutomaticOrder"
     .ConstTanDModelOrderMu "3"
     .DjordjevicSarkarUpperFreqMu "0"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "1st Order"
     .DispersiveFittingSchemeMu "1st Order"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Colour "0.74902", "0.94902", "0.85098" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .Create
End With

'@ define material colour: Rogers RO4350B LoPro (loss free)

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With Material 
     .Name "Rogers RO4350B LoPro (loss free)"
     .Folder ""
     .Colour "0.74902", "0.94902", "0.85098" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeColour 
End With

'@ boolean add shapes: PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER, PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.Add "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER"

'@ boolean add shapes: PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER, PCB1(PCB1)/Nets/SNONES:VIA_TOP_LAYER_BOTTOM_LAYER

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.Add "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "PCB1(PCB1)/Nets/SNONES:VIA_TOP_LAYER_BOTTOM_LAYER"

'@ define material: Copper (annealed)

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With Material
     .Reset
     .Name "Copper (annealed)"
     .Folder ""
     .FrqType "static"
     .Type "Normal"
     .SetMaterialUnit "Hz", "mm"
     .Epsilon "1"
     .Mu "1.0"
     .Kappa "5.8e+007"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .KappaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .DispModelEps "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .DispersiveFittingSchemeMu "Nth Order"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .FrqType "all"
     .Type "Lossy metal"
     .SetMaterialUnit "GHz", "mm"
     .Mu "1.0"
     .Kappa "5.8e+007"
     .Rho "8930.0"
     .ThermalType "Normal"
     .ThermalConductivity "401.0"
     .SpecificHeat "390", "J/K/kg"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Isotropic"
     .YoungsModulus "120"
     .PoissonsRatio "0.33"
     .ThermalExpansionRate "17"
     .Colour "1", "1", "0"
     .Wireframe "False"
     .Reflection "False"
     .Allowoutline "True"
     .Transparentoutline "False"
     .Transparency "0"
     .Create
End With

'@ change material and color: PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER to: Copper (annealed)

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.ChangeMaterial "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "Copper (annealed)" 
Solid.SetUseIndividualColor "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", 1
Solid.ChangeIndividualColor "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "255", "170", "0"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "47", "43"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "45"

'@ define discrete face port: 1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "1" 
     .Type "SParameter"
     .Label ""
     .Folder ""
     .Impedance "50.0"
     .VoltageAmplitude "1.0"
     .CurrentAmplitude "1.0"
     .Monitor "True"
     .CenterEdge "True"
     .SetP1 "True", "94.590849684315", "80.174109399155", "0.38128"
     .SetP2 "True", "94.590849684315", "80.174109399155", "0.01016"
     .LocalCoordinates "False"
     .InvertDirection "False"
     .UseProjection "False"
     .ReverseProjection "False"
     .FaceType "Linear"
     .Create 
End With

'@ define brick: PCB1(PCB1):solid1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "PCB1(PCB1)" 
     .Material "Copper (annealed)" 
     .Xrange "97.12", "97.46" 
     .Yrange "79.64", "80.7" 
     .Zrange "0.3+0.035+0.02", "0.3+0.035+0.1" 
     .Create
End With

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1):solid1", "2", "2"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "45"

'@ define discrete face port: 2

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With DiscreteFacePort 
     .Reset 
     .PortNumber "2" 
     .Type "SParameter"
     .Label ""
     .Folder ""
     .Impedance "50.0"
     .VoltageAmplitude "1.0"
     .CurrentAmplitude "1.0"
     .Monitor "True"
     .CenterEdge "True"
     .SetP1 "True", "97.29", "80.7", "0.435"
     .SetP2 "True", "97.29", "80.7", "0.01016"
     .LocalCoordinates "False"
     .InvertDirection "False"
     .UseProjection "False"
     .ReverseProjection "False"
     .FaceType "Linear"
     .Create 
End With

'@ delete port: port2

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Port.Delete "2"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1):solid1", "2", "2"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "45"

'@ define lumped face element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedFaceElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "25.468"
     .SetL "0"
     .SetC "0.493251"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "97.290000000000006", "80.700000000000003", "0.435" 
     .SetP2 "True", "97.290000000000006", "80.700000000000003", "0.010160000000000001" 
     .SetInvert "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create
End With

'@ define time domain solver acceleration

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With Solver 
     .UseParallelization "True"
     .MaximumNumberOfThreads "1024"
     .MaximumNumberOfCPUDevices "8"
     .RemoteCalculation "False"
     .UseDistributedComputing "False"
     .MaxNumberOfDistributedComputingPorts "64"
     .DistributeMatrixCalculation "True"
     .MPIParallelization "False"
     .AutomaticMPI "False"
     .ConsiderOnly0D1DResultsForMPI "False"
     .HardwareAcceleration "True"
     .MaximumNumberOfGPUs "16"
End With
UseDistributedComputingForParameters "False"
MaxNumberOfDistributedComputingParameters "2"
UseDistributedComputingMemorySetting "False"
MinDistributedComputingMemoryLimit "0"
UseDistributedComputingSharedDirectory "False"
OnlyConsider0D1DResultsForDC "False"

'@ define time domain solver parameters

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-20"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .RunDiscretizerOnly "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ delete shape: PCB1(PCB1):solid1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.Delete "PCB1(PCB1):solid1"

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ define brick: PCB1(PCB1):solid1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "PCB1(PCB1)" 
     .Material "Copper (annealed)" 
     .Xrange "97.56", "97.78" 
     .Yrange "79.72", "80.66" 
     .Zrange "0.3+0.05", "0.3+0.035+0.1" 
     .Create
End With

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1):solid1", "2", "2"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "45"

'@ define lumped face element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedFaceElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "25.468"
     .SetL "0"
     .SetC "0.493251"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "97.670000000000002", "80.659999999999997", "0.435" 
     .SetP2 "True", "97.670000000000002", "80.659999999999997", "0.010160000000000001" 
     .SetInvert "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create
End With

'@ define frequency range

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solver.FrequencyRange "0", "60"

