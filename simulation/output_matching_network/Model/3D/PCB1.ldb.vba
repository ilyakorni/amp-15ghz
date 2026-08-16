#-> section

With SAT
    .Reset
    .FileName "*PCB1.ldb.sab"
    .Version "9.0"
    .ScaleToUnit True
    .ImportToActiveCoordinateSystem True
    .Curves True
    .Wires True
    .MergeFaces False
    .SubProjectName3D "PCB_UID_110173_repl_token"
    .SubProjectScaleFactor 2.54e-05
    .Read
    End With


#-> section

Curve.NewCurve "PCB_UID_110173_UTR_PICK"

#-> section

Mesh.StartSubProjectAdd

#-> section

With Material
   .Reset
   .Name "Copper"
   .Folder "PCB_UID_110173_UTR"
   .Colour 0.703, 0.703, 0
   .Wireframe False
   .Transparency 0
    .FrqType "static"
    .Type "Normal"
    .SetMaterialUnit "Hz", "mm"
    .Epsilon "1"
    .Mu "1"
    .Kappa "5.8e+07"
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
    .Mu "1"
    .Kappa "5.8e+07"
    .Rho "8930"
    .ThermalType "Normal"
    .ThermalConductivity "401"
    .SpecificHeat "390"
    .MetabolicRate "0"
    .BloodFlow "0"
    .VoxelConvection "0"
    .MechanicsType "Isotropic"
    .YoungsModulus "120"
    .PoissonsRatio "0.33"
    .ThermalExpansionRate "17"
    .Reflection "False"
    .Allowoutline "True"
    .Transparentoutline "False"
    .Create
End With


#-> section

With Material
   .Reset
   .Name "FR4"
   .Folder "PCB_UID_110173_UTR"
   .Colour 0, 0.333, 0
   .Wireframe False
   .Transparency 90
   .FrqType "all"
    .Type "Normal"
    .SetMaterialUnit "GHz", "mm"
    .Epsilon "3.5"
    .Mu "1"
    .Kappa "0.0"
    .TanD "0.02"
    .TanDFreq "0"
    .TanDGiven "True"
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
    .Rho "1890"
    .SpecificHeat "1150"
    .ThermalType "Normal"
    .ThermalConductivity "0.3"
    .MechanicsType "Isotropic"
    .YoungsModulus "22"
    .PoissonsRatio "0.12"
    .ThermalExpansionRate "14"
    .SetActiveMaterial "all"
    .Create
End With


#-> section

With Material
   .Reset
   .Name "FR4_1"
   .Folder "PCB_UID_110173_UTR"
   .Colour 0, 0.333, 0
   .Wireframe False
   .Transparency 90
   .FrqType "all"
    .Type "Normal"
    .SetMaterialUnit "GHz", "mm"
    .Epsilon "4.8"
    .Mu "1"
    .Kappa "0.0"
    .TanD "0.02"
    .TanDFreq "0"
    .TanDGiven "True"
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
    .Rho "1890"
    .SpecificHeat "1150"
    .ThermalType "Normal"
    .ThermalConductivity "0.3"
    .MechanicsType "Isotropic"
    .YoungsModulus "22"
    .PoissonsRatio "0.12"
    .ThermalExpansionRate "14"
    .SetActiveMaterial "all"
    .Create
End With


#-> section

With Material
   .Reset
   .Name "VIAS_MATERIAL"
   .Folder "PCB_UID_110173_UTR"
   .Colour 1, 0, 0
   .Wireframe False
   .Transparency 0
    .FrqType "static"
    .Type "Normal"
    .SetMaterialUnit "Hz", "mm"
    .Epsilon "1"
    .Mu "1"
    .Kappa "5.8e+07"
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
    .Mu "1"
    .Kappa "5.8e+07"
    .Rho "8930"
    .ThermalType "Normal"
    .ThermalConductivity "401"
    .SpecificHeat "390"
    .MetabolicRate "0"
    .BloodFlow "0"
    .VoxelConvection "0"
    .MechanicsType "Isotropic"
    .YoungsModulus "120"
    .PoissonsRatio "0.33"
    .ThermalExpansionRate "17"
    .Reflection "False"
    .Allowoutline "True"
    .Transparentoutline "False"
    .Create
End With


#-> section

With Material
   .Reset
   .Name "PEC Sheets"
   .Folder "PCB_UID_110173_UTR"
   .Type "Pec"
   .Rho "0.0"
   .ThermalType "Normal"
   .ThermalConductivity "0"
   .SpecificHeat "0"
   .DynamicViscosity "0"
   .Emissivity "0"
   .MetabolicRate "0.0"
   .VoxelConvection "0.0"
   .BloodFlow "0"
   .MechanicsType "Unused"
   .FrqType "static"
   .Type "Pec"
   .MaterialUnit "Time", "s"
   .Epsilon "1"
   .Mu "1"
   .ReferenceCoordSystem "Global"
   .CoordSystemType "Cartesian"
   .NLAnisotropy "False"
   .NLAStackingFactor "1"
   .NLADirectionX "1"
   .NLADirectionY "0"
   .NLADirectionZ "0"
   .FrqType "all"
   .Type "Pec"
   .MaterialUnit "Time", "s"
   .Epsilon "1"
   .Mu "1"
   .ReferenceCoordSystem "Global"
   .CoordSystemType "Cartesian"
   .NLAnisotropy "False"
   .NLAStackingFactor "1"
   .NLADirectionX "1"
   .NLADirectionY "0"
   .NLADirectionZ "0"
   .Colour "0.588235", "0.588235", "0.588235"
   .Wireframe False
   .Reflection "False"
   .Allowoutline "True"
   .Transparentoutline "True"
   .Transparency 30
   .Create
End With


#-> section

Solid.SetUseIndividualColor "PCB_UID_110173_UTR/Substrates:01_TOP_SOLDER", 1
Solid.ChangeIndividualColor "PCB_UID_110173_UTR/Substrates:01_TOP_SOLDER", 0, 84, 0

Solid.SetUseIndividualColor "PCB_UID_110173_UTR/Nets/SNONES:02_TOP_LAYER", 1
Solid.ChangeIndividualColor "PCB_UID_110173_UTR/Nets/SNONES:02_TOP_LAYER", 179, 179, 0

Solid.SetUseIndividualColor "PCB_UID_110173_UTR/Substrates:03_DIELECTRIC_1", 1
Solid.ChangeIndividualColor "PCB_UID_110173_UTR/Substrates:03_DIELECTRIC_1", 0, 84, 0

Solid.SetUseIndividualColor "PCB_UID_110173_UTR/Nets/SNONES:04_BOTTOM_LAYER", 1
Solid.ChangeIndividualColor "PCB_UID_110173_UTR/Nets/SNONES:04_BOTTOM_LAYER", 133, 28, 251

Solid.SetUseIndividualColor "PCB_UID_110173_UTR/Substrates:05_BOTTOM_SOLDER", 1
Solid.ChangeIndividualColor "PCB_UID_110173_UTR/Substrates:05_BOTTOM_SOLDER", 0, 84, 0

Solid.SetUseIndividualColor "PCB_UID_110173_UTR/Nets/SNONES:VIA_TOP_LAYER_BOTTOM_LAYER", 1
Solid.ChangeIndividualColor "PCB_UID_110173_UTR/Nets/SNONES:VIA_TOP_LAYER_BOTTOM_LAYER", 255, 0, 0


#-> section

' Creating groups =====
Group.NewFolder "PCB_UID_110173_UTR"
Group.NewFolder "PCB_UID_110173_UTR/Layers"
Group.NewFolder "PCB_UID_110173_UTR/Vias"
Group.NewFolder "PCB_UID_110173_UTR/Nets"
Group.NewFolder "PCB_UID_110173_UTR/Ports"
Group.NewFolder "PCB_UID_110173_UTR/Auxiliary Geometry"
Group.NewFolder "PCB_UID_110173_UTR/Auxiliary Geometry/PEC"
Group.NewFolder "PCB_UID_110173_UTR/Auxiliary Geometry/Components"
Group.NewFolder "PCB_UID_110173_UTR/Auxiliary Geometry/HeatSources"
Group.NewFolder "PCB_UID_110173_UTR/Auxiliary Geometry/RLC Node Support"
Group.NewFolder "PCB_UID_110173_UTR/Simplified Geometry"
Group.Add "PCB_UID_110173_UTR/Layers:01_TOP_SOLDER", "normal"
Group.AddItem "solid$PCB_UID_110173_UTR/Substrates:01_TOP_SOLDER", "PCB_UID_110173_UTR/Layers:01_TOP_SOLDER"

Group.Add "PCB_UID_110173_UTR/Layers:02_TOP_LAYER", "normal"
Group.AddItem "solid$PCB_UID_110173_UTR/Nets/SNONES:02_TOP_LAYER", "PCB_UID_110173_UTR/Layers:02_TOP_LAYER"

Group.Add "PCB_UID_110173_UTR/Layers:03_DIELECTRIC_1", "normal"
Group.AddItem "solid$PCB_UID_110173_UTR/Substrates:03_DIELECTRIC_1", "PCB_UID_110173_UTR/Layers:03_DIELECTRIC_1"

Group.Add "PCB_UID_110173_UTR/Layers:04_BOTTOM_LAYER", "normal"
Group.AddItem "solid$PCB_UID_110173_UTR/Nets/SNONES:04_BOTTOM_LAYER", "PCB_UID_110173_UTR/Layers:04_BOTTOM_LAYER"

Group.Add "PCB_UID_110173_UTR/Layers:05_BOTTOM_SOLDER", "normal"
Group.AddItem "solid$PCB_UID_110173_UTR/Substrates:05_BOTTOM_SOLDER", "PCB_UID_110173_UTR/Layers:05_BOTTOM_SOLDER"

Group.Add "PCB_UID_110173_UTR/Vias:VIA_TOP_LAYER_BOTTOM_LAYER", "normal"
Group.AddItem "solid$PCB_UID_110173_UTR/Nets/SNONES:VIA_TOP_LAYER_BOTTOM_LAYER", "PCB_UID_110173_UTR/Vias:VIA_TOP_LAYER_BOTTOM_LAYER"



#-> section

MeshSettings.AdjustItemMeshSettingsStart

#-> section

Group.Add "meshgroup1", "mesh"

#-> section

With MeshSettings
With .ItemMeshSettings ("group$meshgroup1")
.SetMeshType "Hex"

          .Set "ConsiderGlobalEdgeRefinement", 0
          .Set "ConsiderGlobalFaceRefinement", 0
          .Set "ConsiderGlobalMaterialRefinement", 0
          .Set "ConsiderGlobalRefinement", 0
          .Set "ConsiderGlobalSnapping", 0
          .Set "EdgeRefinementBufferLines", 3
          .Set "EdgeRefinementRatio", "1"
          .Set "EdgeRefinementStep", "0"
          .Set "EdgeRefinementType", "NONE"
          .Set "EllipseRefinementNSteps", 2
          .Set "EllipseRefinementRatio", 2
          .Set "EllipseRefinementStep", 0
          .Set "EllipseRefinementType", "NONE"
          .Set "FaceRefinementBufferLines", 3
          .Set "FaceRefinementNSteps", 2
          .Set "FaceRefinementRatio", 2
          .Set "FaceRefinementStep", 0
          .Set "FaceRefinementType", "NONE"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "SnapToAxialEdges", 0
          .Set "SnapToCylinderCenters", 0
          .Set "SnapToCylinders", 0
          .Set "SnapToEllipseCenters", 0
          .Set "SnapToEllipses", 0
          .Set "SnapToObjectBoundaries", 0
          .Set "SnapToPlanes", "0"
          .Set "SnapToSpheres", 0
          .Set "SnapToTori", 0
          .Set "SnapXYZ", "0", "0", "0"
          .Set "UseMaterialRefinement", 0
          .Set "UseSnappingPriority", 0
          .Set "VolumeRefinementExtentNumSteps", 0, 0, 0
          .Set "VolumeRefinementExtentStep", 0, 0, 0
          .Set "VolumeRefinementExtentType", "NONE"
          .Set "VolumeRefinementExtentValueUseSameXYZ", 1
          .Set "VolumeRefinementNumSteps", "0", "0", "0"
          .Set "VolumeRefinementRatio", "0", "0", "0"
          .Set "VolumeRefinementScopeType", "ALL"
          .Set "VolumeRefinementStep", "0.000000", "0.000000", "0.000000"
          .Set "VolumeRefinementType", "NONE"
          .Set "VolumeRefinementValueUseSameXYZ", 0
    
.SetMeshType "HexTLM"

          .Set "ConsiderGlobalEdgeRefinement", 0
          .Set "ConsiderGlobalFaceRefinement", 0
          .Set "ConsiderGlobalMaterialRefinement", 0
          .Set "ConsiderGlobalRefinement", 0
          .Set "ConsiderGlobalSnapping", 0
          .Set "EdgeRefinementBufferLines", 3
          .Set "EdgeRefinementRatio", "1"
          .Set "EdgeRefinementStep", "0"
          .Set "EdgeRefinementType", "NONE"
          .Set "EllipseRefinementNSteps", 2
          .Set "EllipseRefinementRatio", 2
          .Set "EllipseRefinementStep", 0
          .Set "EllipseRefinementType", "NONE"
          .Set "FaceRefinementBufferLines", 3
          .Set "FaceRefinementNSteps", 2
          .Set "FaceRefinementRatio", 2
          .Set "FaceRefinementStep", 0
          .Set "FaceRefinementType", "NONE"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "SnapToAxialEdges", 0
          .Set "SnapToCylinderCenters", 0
          .Set "SnapToCylinders", 0
          .Set "SnapToEllipseCenters", 0
          .Set "SnapToEllipses", 0
          .Set "SnapToObjectBoundaries", 0
          .Set "SnapToPlanes", "0"
          .Set "SnapToSpheres", 0
          .Set "SnapToTori", 0
          .Set "SnapXYZ", "0", "0", "0"
          .Set "UseMaterialRefinement", 0
          .Set "UseSnappingPriority", 0
          .Set "VolumeRefinementExtentNumSteps", 0, 0, 0
          .Set "VolumeRefinementExtentStep", 0, 0, 0
          .Set "VolumeRefinementExtentType", "NONE"
          .Set "VolumeRefinementExtentValueUseSameXYZ", 1
          .Set "VolumeRefinementNumSteps", "0", "0", "0"
          .Set "VolumeRefinementRatio", "0", "0", "0"
          .Set "VolumeRefinementScopeType", "ALL"
          .Set "VolumeRefinementStep", "0.000000", "0.000000", "0.000000"
          .Set "VolumeRefinementType", "NONE"
          .Set "VolumeRefinementValueUseSameXYZ", 0
    
End With
End With


#-> section

Group.AddItem "solid$PCB_UID_110173_UTR/Nets/SNONES:02_TOP_LAYER", "meshgroup1"
Group.AddItem "solid$PCB_UID_110173_UTR/Nets/SNONES:04_BOTTOM_LAYER", "meshgroup1"
Group.AddItem "solid$PCB_UID_110173_UTR/Nets/SNONES:VIA_TOP_LAYER_BOTTOM_LAYER", "meshgroup1"
Group.AddItem "solid$PCB_UID_110173_UTR/Substrates:01_TOP_SOLDER", "meshgroup1"
Group.AddItem "solid$PCB_UID_110173_UTR/Substrates:05_BOTTOM_SOLDER", "meshgroup1"


#-> section

Group.Add "meshgroup2", "mesh"

#-> section

With MeshSettings
With .ItemMeshSettings ("group$meshgroup2")
.SetMeshType "Hex"

          .Set "ConsiderGlobalEdgeRefinement", 0
          .Set "ConsiderGlobalFaceRefinement", 0
          .Set "ConsiderGlobalMaterialRefinement", 0
          .Set "ConsiderGlobalRefinement", 0
          .Set "ConsiderGlobalSnapping", 0
          .Set "EdgeRefinementBufferLines", 3
          .Set "EdgeRefinementRatio", "1"
          .Set "EdgeRefinementStep", "0"
          .Set "EdgeRefinementType", "NONE"
          .Set "EllipseRefinementNSteps", 2
          .Set "EllipseRefinementRatio", 2
          .Set "EllipseRefinementStep", 0
          .Set "EllipseRefinementType", "NONE"
          .Set "FaceRefinementBufferLines", 3
          .Set "FaceRefinementNSteps", 2
          .Set "FaceRefinementRatio", 2
          .Set "FaceRefinementStep", 0
          .Set "FaceRefinementType", "NONE"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "SnapToAxialEdges", 0
          .Set "SnapToCylinderCenters", 0
          .Set "SnapToCylinders", 0
          .Set "SnapToEllipseCenters", 0
          .Set "SnapToEllipses", 0
          .Set "SnapToObjectBoundaries", 0
          .Set "SnapToPlanes", "1"
          .Set "SnapToSpheres", 0
          .Set "SnapToTori", 0
          .Set "SnapXYZ", "0", "0", "1"
          .Set "UseMaterialRefinement", 0
          .Set "UseSnappingPriority", 0
          .Set "VolumeRefinementExtentNumSteps", 0, 0, 0
          .Set "VolumeRefinementExtentStep", 0, 0, 0
          .Set "VolumeRefinementExtentType", "NONE"
          .Set "VolumeRefinementExtentValueUseSameXYZ", 1
          .Set "VolumeRefinementNumSteps", "0", "0", "0"
          .Set "VolumeRefinementRatio", "0", "0", "0"
          .Set "VolumeRefinementScopeType", "ALL"
          .Set "VolumeRefinementStep", "19.685039", "19.685039", "5.905512"
          .Set "VolumeRefinementType", "ABS_VALUE"
          .Set "VolumeRefinementValueUseSameXYZ", 0
    
.SetMeshType "HexTLM"

          .Set "ConsiderGlobalEdgeRefinement", 0
          .Set "ConsiderGlobalFaceRefinement", 0
          .Set "ConsiderGlobalMaterialRefinement", 0
          .Set "ConsiderGlobalRefinement", 0
          .Set "ConsiderGlobalSnapping", 0
          .Set "EdgeRefinementBufferLines", 3
          .Set "EdgeRefinementRatio", "1"
          .Set "EdgeRefinementStep", "0"
          .Set "EdgeRefinementType", "NONE"
          .Set "EllipseRefinementNSteps", 2
          .Set "EllipseRefinementRatio", 2
          .Set "EllipseRefinementStep", 0
          .Set "EllipseRefinementType", "NONE"
          .Set "FaceRefinementBufferLines", 3
          .Set "FaceRefinementNSteps", 2
          .Set "FaceRefinementRatio", 2
          .Set "FaceRefinementStep", 0
          .Set "FaceRefinementType", "NONE"
          .Set "SnappingIntervals", 0, 0, 0
          .Set "SnappingPriority", 0
          .Set "SnapToAxialEdges", 0
          .Set "SnapToCylinderCenters", 0
          .Set "SnapToCylinders", 0
          .Set "SnapToEllipseCenters", 0
          .Set "SnapToEllipses", 0
          .Set "SnapToObjectBoundaries", 0
          .Set "SnapToPlanes", "1"
          .Set "SnapToSpheres", 0
          .Set "SnapToTori", 0
          .Set "SnapXYZ", "0", "0", "1"
          .Set "UseMaterialRefinement", 0
          .Set "UseSnappingPriority", 0
          .Set "VolumeRefinementExtentNumSteps", 0, 0, 0
          .Set "VolumeRefinementExtentStep", 0, 0, 0
          .Set "VolumeRefinementExtentType", "NONE"
          .Set "VolumeRefinementExtentValueUseSameXYZ", 1
          .Set "VolumeRefinementNumSteps", "0", "0", "0"
          .Set "VolumeRefinementRatio", "0", "0", "0"
          .Set "VolumeRefinementScopeType", "ALL"
          .Set "VolumeRefinementStep", "19.685039", "19.685039", "5.905512"
          .Set "VolumeRefinementType", "ABS_VALUE"
          .Set "VolumeRefinementValueUseSameXYZ", 0
    
End With
End With


#-> section

Group.AddItem "solid$PCB_UID_110173_UTR/Substrates:03_DIELECTRIC_1", "meshgroup2"


#-> section

MeshSettings.AdjustItemMeshSettingsEnd

#-> section

Mesh.EndSubProjectAdd

#-> section

Curve.DeleteCurve "PCB_UID_110173_UTR_PICK"

#-> section

With MeshSettings
     .SetMeshType "All"
     .Set "PrioritizationScheme", "ElectricConductivity"
End With


#-> section

Component.Rename "PCB_UID_110173_UTR", "PCB_UID_110173_repl_token"

#-> section

Group.RenameFolder "PCB_UID_110173_UTR", "PCB_UID_110173_repl_token"

#-> section

Material.RenameFolder "PCB_UID_110173_UTR", "PCB_UID_110173_repl_token"

