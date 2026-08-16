'# MWS Version: Version 2025.1 - Oct 28 2024 - ACIS 34.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 1 fmax = 60
'# created = '[VERSION]2025.1|34.0.1|20241028[/VERSION]


'@ use template: Antenna - Planar_10.cfg

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

'@ import odbpp file: C:\Users\Ilysha\Desktop\eclipse\PCB1.zip

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LayoutDB
     .Reset 
     .SourceFileName "C:\Users\Ilysha\Desktop\eclipse\PCB1.zip" 
     .LdbFileName "*PCB1.ldb" 
     .PcbType "odbpp" 
     .KeepSynchronized "True" 
     .CreateDB 
     .LoadDB 
End With

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

'@ change material and color: PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER to: Copper (annealed)

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.ChangeMaterial "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "Copper (annealed)" 
Solid.SetUseIndividualColor "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", 1
Solid.ChangeIndividualColor "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "255", "170", "0"

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

'@ change material and color: PCB1(PCB1)/Substrates:03_DIELECTRIC_1 to: Rogers RO4350B LoPro (loss free)

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.ChangeMaterial "PCB1(PCB1)/Substrates:03_DIELECTRIC_1", "Rogers RO4350B LoPro (loss free)" 
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

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "23", "23"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "19", "19"

'@ define lumped face element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedFaceElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "50"
     .SetL "0"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "101.08832335456", "80.717151238252", "0.38128" 
     .SetP2 "True", "101.08902820067", "81.185084010126", "0.38128" 
     .SetInvert "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create
End With

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ pick end point

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEndpointFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "23"

'@ define lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "50"
     .SetL "0"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .SetRadius "0.0"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "100.7487367844", "80.724999843802", "0.38128" 
     .SetP2 "False", "0", "0", "0" 
     .SetInvert "False" 
     .Wire "" 
     .Position "end1" 
     .Create
End With

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "2", "3"

'@ define lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "50"
     .SetL "0"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .SetRadius "0.0"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "False", "1", "1", "0" 
     .SetP2 "False", "1", "0", "0" 
     .SetInvert "False" 
     .Wire "" 
     .Position "end1" 
     .Create
End With

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "27", "3"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "1"

'@ define lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "50"
     .SetL "0"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .SetRadius "0.0"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "False", "1", "0", "0" 
     .SetP2 "False", "0", "0", "0" 
     .SetInvert "False" 
     .Wire "" 
     .Position "end1" 
     .Create
End With

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "27", "3"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "1"

'@ define lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "50"
     .SetL "0"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .SetRadius "0.0"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "False", "1", "0", "0" 
     .SetP2 "False", "0", "0", "0" 
     .SetInvert "False" 
     .Wire "" 
     .Position "end1" 
     .Create
End With

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ pick end point

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEndpointFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "23"

'@ pick end point

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEndpointFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "3"

'@ define lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "76.408"
     .SetL "0.695369"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .SetRadius "0.0"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "100.7487367844", "80.724999843802", "0.38128" 
     .SetP2 "True", "96.00000104003", "78.999998208974", "0.01016" 
     .SetInvert "False" 
     .Wire "" 
     .Position "end1" 
     .Create
End With

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "21", "21"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "3", "4"

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
     .SetP1 "True", "97.708999404407", "80.949932083999", "0.38128"
     .SetP2 "True", "96.00000104003", "80.99999802", "0.01016"
     .LocalCoordinates "False"
     .InvertDirection "False"
     .UseProjection "False"
     .ReverseProjection "False"
     .FaceType "Linear"
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
     .Xrange "100.22", "100.75" 
     .Yrange "80.73", "81.17" 
     .Zrange "0.035+0.3", "0.035+0.3+0.035+0.02" 
     .Create
End With

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1):solid1", "1", "1"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "1"

'@ define lumped face element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedFaceElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "76.408"
     .SetL "0.695369"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "100.75", "80.95", "0.39" 
     .SetP2 "True", "100.75", "80.95", "0.01016" 
     .SetInvert "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create
End With

'@ delete shape: PCB1(PCB1):solid1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.Delete "PCB1(PCB1):solid1"

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "15", "15"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "1", "2"

'@ define lumped face element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedFaceElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCSerial"
     .SetR "76.408"
     .SetL "0.695369"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "106.87229577459", "80.951693570242", "0.38128" 
     .SetP2 "True", "109.00000043997", "80.99999802", "0.01016" 
     .SetInvert "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create
End With

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "16", "16"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "1"

'@ define lumped face element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedFaceElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCParallel"
     .SetR "76.408"
     .SetL "0.695369"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "105.42279397602", "81.279729489255999", "0.38128000000000001" 
     .SetP2 "True", "105.42279397602", "81.279729489255999", "0.010160000000000001" 
     .SetInvert "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create
End With

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
     .Xrange "100.28", "100.76" 
     .Yrange "80.74", "81.16" 
     .Zrange "0.045+0.3", "0.035+0.3+0.06" 
     .Create
End With

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1):solid1", "1", "1"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "1"

'@ define lumped face element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedFaceElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCParallel"
     .SetR "76.408"
     .SetL "0.695369"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "100.76000000000001", "80.950000000000003", "0.39500000000000002" 
     .SetP2 "True", "100.76000000000001", "80.950000000000003", "0.010160000000000001" 
     .SetInvert "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create
End With

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ delete shape: PCB1(PCB1):solid1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.Delete "PCB1(PCB1):solid1"

'@ define brick: PCB1(PCB1):solid1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "PCB1(PCB1)" 
     .Material "Copper (annealed)" 
     .Xrange "105.8", "106.86" 
     .Yrange "80.92", "81.08" 
     .Zrange "0.035+0.3+0.035", "0.035+0.3+0.1" 
     .Create
End With

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1):solid1", "1", "1"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "1"

'@ define lumped face element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedFaceElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCParallel"
     .SetR "76.408"
     .SetL "0.695369"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "106.86", "81", "0.435" 
     .SetP2 "True", "106.86", "81", "0.010160000000000001" 
     .SetInvert "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create
End With

'@ define frequency range

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solver.FrequencyRange "1", "60"

'@ delete port: port1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Port.Delete "1"

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:02_TOP_LAYER", "21", "21"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "1"

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
     .SetP1 "True", "97.708999404407", "80.949932083999", "0.38128"
     .SetP2 "True", "97.708999404407", "80.949932083999", "0.01016"
     .LocalCoordinates "False"
     .InvertDirection "False"
     .UseProjection "False"
     .ReverseProjection "False"
     .FaceType "Linear"
     .Create 
End With

'@ delete lumped element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
LumpedElement.Delete "Folder1:element1"

'@ delete shape: PCB1(PCB1):solid1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Solid.Delete "PCB1(PCB1):solid1"

'@ define brick: PCB1(PCB1)/Nets/SNONES:solid1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "PCB1(PCB1)/Nets/SNONES" 
     .Material "Copper (annealed)" 
     .Xrange "106.7", "106.82" 
     .Yrange "80.66", "81.26" 
     .Zrange "0.3+0.06", "0.3+0.035+0.1" 
     .Create
End With

'@ pick edge

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickEdgeFromId "PCB1(PCB1)/Nets/SNONES:solid1", "2", "2"

'@ pick face

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
Pick.PickFaceFromId "PCB1(PCB1)/Nets/SNONES:04_BOTTOM_LAYER", "1"

'@ define lumped face element: Folder1:element1

'[VERSION]2025.1|34.0.1|20241028[/VERSION]
With LumpedFaceElement
     .Reset 
     .SetName "element1" 
     .Folder "Folder1" 
     .SetType "RLCParallel"
     .SetR "76.408"
     .SetL "0.695369"
     .SetC "0"
     .SetGs "0"
     .SetI0 "1e-14"
     .SetT "300"
     .SetMonitor "True"
     .CircuitFileName ""
     .CircuitId "1"
     .UseCopyOnly "True"
     .UseRelativePath "False"
     .SetP1 "True", "106.76000000000001", "81.260000000000005", "0.435" 
     .SetP2 "True", "106.76000000000001", "81.260000000000005", "0.010160000000000001" 
     .SetInvert "False" 
     .UseProjection "False" 
     .ReverseProjection "False" 
     .Create
End With

