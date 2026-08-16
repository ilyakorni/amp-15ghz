# 15-GHz-Ku-Band-Mikrowellen-FET-Verstärker (ATF-26884)

<p align="center">
  <a href="README.md">Русский</a> | <a href="README.en.md">English</a> | <b>Deutsch</b>
</p>

<p align="center">
  <img src="docs/images/pcb_3d_assembly_top_view.png" alt="3D-Modell der 15-GHz-Verstärker-Leiterplatte" width="80%">
</p>

## Projektübersicht

Dieses Repository enthält die vollständige Entwicklung, analytische Synthese, elektromagnetische Simulation und das Leiterplattenlayout eines einstufigen rauscharmen Mikrowellenverstärkers für eine Mittenfrequenz von **15,0 GHz** (Ku-Band). Als aktives Element dient ein Galliumarsenid-(GaAs)-pHEMT-Transistor (**ATF-26884**, Avago / Broadcom) im hermetischen 84-Keramik-Micro-X-Gehäuse.

Die Schaltung ist auf einem Hochfrequenz-Laminat des Typs **Rogers RO4350B** realisiert ($\varepsilon_r = 3.48$, Substratdicke $h = 0.30$ mm, Kupferkaschierung $t = 35\ \mu\text{m}$, dielektrischer Verlustfaktor $\tan\delta = 0.0037$). Das Repository umfasst die geschlossene mathematische Berechnung der Anpassnetzwerke in Mathcad unter Berücksichtigung von Frequenzdispersion und Leiterdickeneffekten, dreidimensionale Vollwellen-Feldberechnungen in CST Microwave Studio sowie das fertigungsreife PCB-Layout in Altium Designer mit koplanarer Masseverbindung und Via-Stitching.

---

## Projektstruktur

```text
├── cad/
│   ├── atf26884_transistor_package.step        # 3D-STEP-Modell des ATF-26884 Micro-X-Gehäuses
│   ├── pcb_amplifier_15ghz_full_assembly.pcbdoc # Gesamtlayout der Verstärker-Leiterplatte in Altium Designer
│   ├── pcb_input_matching_network.pcbdoc       # PCB-Layout des Eingangsanpassnetzwerks
│   └── pcb_output_matching_network.pcbdoc      # PCB-Layout des Ausgangsanpassnetzwerks
├── calculations/
│   ├── input_matching_network_calc.xmcd        # Analytische Berechnung des Eingangsanpassnetzwerks (Mathcad 14)
│   └── output_matching_network_calc.xmcd       # Analytische Berechnung des Ausgangsanpassnetzwerks (Mathcad 14)
├── simulation/
│   ├── input_matching_network.cst              # 3D-EM-Simulationsmodell des Eingangsnetzwerks (CST)
│   ├── input_matching_network/                 # CST-Rechengitter und Ergebnisdaten des Eingangs
│   ├── output_matching_network.cst             # 3D-EM-Simulationsmodell des Ausgangsnetzwerks (CST)
│   └── output_matching_network/                # CST-Rechengitter und Ergebnisdaten des Ausgangs
└── docs/
    └── images/                                 # Technische Abbildungen, Smith-Diagramme und Simulationskurven
```

---

## Analytische Berechnung

### 1. Transistorparameter und Stabilitätsanalyse

Bei der Entwurfsfrequenz $f = 15.0\text{ GHz}$ und einem Systemwellenwiderstand von $Z_0 = 50\ \Omega$ weist der Transistor ATF-26884 folgende Streuparameter (S-Parameter) auf:

$$S_{11} = 0.62 \angle 56^\circ = 0.347 + j0.514$$

$$S_{21} = 1.60 \angle -75^\circ = 0.414 - j1.545$$

$$S_{12} = 0.182 \angle -1^\circ = 0.182 - j0.00318$$

$$S_{22} = 0.52 \angle -165^\circ = -0.502 - j0.135$$

Transformation der $[S]$-Matrix in die komplexe Impedanzmatrix $[Z]$:

$$Z_{11} = Z_0 \frac{(1 + S_{11})(1 - S_{22}) + S_{12}S_{21}}{(1 - S_{11})(1 - S_{22}) - S_{12}S_{21}} = 76.408 + j65.537\ \Omega$$

$$Z_{22} = Z_0 \frac{(1 - S_{11})(1 + S_{22}) + S_{12}S_{21}}{(1 - S_{11})(1 - S_{22}) - S_{12}S_{21}} = 25.468 - j21.511\ \Omega$$

<p align="center">
  <img src="docs/images/transistor_s_to_z_parameters.png" alt="S- zu Z-Parameter-Transformation" width="80%">
</p>

Berechnung der Determinante $\Delta$ und des Rollett-Stabilitätsfaktors $K$:

$$\Delta = S_{11}S_{22} - S_{12}S_{21} = -0.175 - j0.022 \quad (|\Delta| = 0.1764)$$

$$K = \frac{1 - |S_{11}|^2 - |S_{22}|^2 + |\Delta|^2}{2|S_{12}S_{21}|} = 0.646$$

Da $K < 1$ ist, liegt bedingte Stabilität vor. Zur Gewährleistung eines stabilen Betriebs wurden Mittelpunkte und Radien der Stabilitätskreise für Quelle (Source) und Last (Load) ermittelt:

$$C_S = \frac{\overline{S_{11} - \Delta \cdot \overline{S_{22}}}}{|S_{11}|^2 - |\Delta|^2} = 0.724 - j1.491, \quad |C_S| = 1.657, \quad R_S = 0.825, \quad \theta_S = 124.57^\circ$$

$$C_L = \frac{\overline{S_{22} - \Delta \cdot \overline{S_{11}}}}{|S_{22}|^2 - |\Delta|^2} = -1.798 + j0.908, \quad |C_L| = 2.014, \quad R_L = 1.218, \quad \theta_L = 134.45^\circ$$

Da $|C_S| > 1$ und $|C_L| > 1$ sind, befinden sich die Mittelpunkte außerhalb des Smith-Diagramms ($|\Gamma| \le 1$), was einen weiten stabilen Impedanzanpassungsbereich eröffnet.

<p align="center">
  <img src="docs/images/transistor_stability_factors_k_delta.png" alt="Stabilitätsfaktoren K und Delta" width="80%">
</p>

<p align="center">
  <img src="docs/images/transistor_smith_chart_stability_circles.png" alt="Stabilitätskreise im Smith-Diagramm" width="80%">
</p>

---

### 2. Synthese des Eingangsanpassnetzwerks

Die Eingangsimpedanz $Z_{11} = 76.408 + j65.537\ \Omega$ besteht aus einem Wirkanteil $R_{11} = 76.408\ \Omega$ und einem induktiven Blindanteil $X_{L11} = 65.537\ \Omega$. Das Netzwerk integriert einen $\lambda/4$-Transformator mit kontinuierlichem Taper-Übergang und einen kapazitiven Kompensations-Stub.

1. **Wirkwiderstandsanpassung ($50\ \Omega \leftrightarrow 76.408\ \Omega$):**
   - Wellenwiderstand des $\lambda/4$-Transformators: $Z_{t} = \sqrt{50 \cdot 76.408} = 61.809\ \Omega$.
   - Quasistatische Berechnung nach Wheeler und Schneider: Breiten-Dicken-Verhältnis $W/h = 1.586$, effektive Permittivität $\varepsilon_{\text{eff}} = 2.664$.
   - Berücksichtigung der Frequenzdispersion nach Kobayashi und Leiterdickenkorrektur: $\varepsilon_F = 2.70$, Leitungswellenlänge $\lambda_t = 12.163$ mm.
   - Abmessungen des Transformators: Länge $L_t = \lambda_t / 4 = 3.041$ mm, Streifenbreite $W_t = 0.450$ mm ($449.86\ \mu\text{m}$).
   - 10-stufiger diskretisierter Exponentialtaper zur breitbandigen Reflexionsminimierung zwischen $50\ \Omega$ ($W_0 = 0.681$ mm) und $61.81\ \Omega$ ($W_{10} = 0.450$ mm).

2. **Kompensation des induktiven Blindanteils ($X_{L11} = 65.537\ \Omega$):**
   - Kompensationskapazität: $C_{11} = \frac{1}{2\pi f X_{L11}} = 161.90\text{ fF}$.
   - Realisierung als kapazitives Leitungssegment: Radius/Länge $r_c = 2.90$ mm, Streifenbreite $W_c = 0.681$ mm.

<p align="center">
  <img src="docs/images/input_matching_calc_transformer.png" alt="Berechnung des Eingangstransformators" width="80%">
</p>

<p align="center">
  <img src="docs/images/input_matching_calc_dispersion.png" alt="Kobayashi-Dispersionskorrektur des Eingangs" width="80%">
</p>

<p align="center">
  <img src="docs/images/input_matching_calc_capacitive_stub.png" alt="Berechnung der Kompensationskapazität" width="80%">
</p>

<p align="center">
  <img src="docs/images/input_matching_calc_stub_dimensions.png" alt="Geometrie des kapazitiven Stubs" width="80%">
</p>

<p align="center">
  <img src="docs/images/input_matching_calc_taper_discretization.png" alt="Taper-Diskretisierung des Eingangs" width="80%">
</p>

---

### 3. Synthese des Ausgangsanpassnetzwerks

Die Ausgangsimpedanz $Z_{22} = 25.468 - j21.511\ \Omega$ setzt sich aus einem Wirkwiderstand $R_{22} = 25.468\ \Omega$ und einer kapazitiven Reaktanz $X_{C22} = 21.511\ \Omega$ zusammen.

1. **Wirkwiderstandsanpassung ($25.468\ \Omega \leftrightarrow 50\ \Omega$):**
   - Wellenwiderstand des $\lambda/4$-Transformators: $Z_{t} = \sqrt{50 \cdot 25.468} = 35.685\ \Omega$.
   - Quasistatische Berechnung: $W/h = 3.748$, $\varepsilon_{\text{eff}} = 2.845$.
   - Dispersionskorrektur nach Kobayashi: $\varepsilon_F = 2.904$, Leitungswellenlänge $\lambda_t = 11.728$ mm.
   - Abmessungen: Länge $L_t = 2.932$ mm, Streifenbreite $W_t = 1.097$ mm.
   - 10-stufiger Taper-Übergang zwischen $35.69\ \Omega$ und $100\ \Omega / 50\ \Omega$.

2. **Kompensation des kapazitiven Blindanteils ($X_{C22} = 21.511\ \Omega$):**
   - Kompensationsinduktivität: $L_{11} = \frac{X_{C22}}{2\pi f} = 228.24\text{ pH}$.
   - Realisierung als hochohmige Streifenleitung ($Z_B = 100\ \Omega$): Länge $l_L = 431.25\ \mu\text{m}$ ($0.431$ mm), Breite $W_L = 162.50\ \mu\text{m}$ ($0.163$ mm).

<p align="center">
  <img src="docs/images/output_matching_calc_transformer.png" alt="Berechnung des Ausgangstransformators" width="80%">
</p>

<p align="center">
  <img src="docs/images/output_matching_calc_dispersion.png" alt="Kobayashi-Dispersionskorrektur des Ausgangs" width="80%">
</p>

<p align="center">
  <img src="docs/images/output_matching_calc_inductive_line.png" alt="Berechnung der Kompensationsinduktivität" width="80%">
</p>

<p align="center">
  <img src="docs/images/output_matching_calc_line_dimensions.jpg" alt="Geometrie der Induktivitätsleitung" width="80%">
</p>

<p align="center">
  <img src="docs/images/output_matching_calc_taper_discretization.png" alt="Taper-Diskretisierung des Ausgangs" width="80%">
</p>

---

## 3D-Modellierung und Aufbau

Der Verstärker ist in Mikrostreifenleitungstechnik mit geerdeter koplanarer Schirmung ausgeführt:
- **Substrat**: Rogers RO4350B, $\varepsilon_r = 3.48$, Dicke $h = 0.30$ mm, 35 $\mu\text{m}$ Kupferbelag.
- **Schirmung und Via-Stitching**: Obere Masseflächen sind über ein periodisches Raster von Durchkontaktierungen (Vias) mit einem Abstand kleiner als $\lambda/10$ mit der durchgehenden unteren Massefläche verbunden, um Substratwellen und parasitäre Moden zu unterdrücken.
- **Transistor-Montage**: Das Pad-Layout für das hermetische micro-X-Gehäuse des ATF-26884 gewährleistet symmetrische Wärmeabfuhr und minimale parasitäre Source-Induktivität zur Masse.

<p align="center">
  <img src="docs/images/input_matching_3d_cst_model.png" alt="CST 3D-Modell des Eingangsanpassnetzwerks" width="80%">
</p>

<p align="center">
  <img src="docs/images/output_matching_3d_cst_model.png" alt="CST 3D-Modell des Ausgangsanpassnetzwerks" width="80%">
</p>

---

## Numerische Simulationsergebnisse

Die dreidimensionale elektromagnetische Vollwellensimulation im Zeit- und Frequenzbereich wurde in CST Microwave Studio im Frequenzbereich von 0.1 bis 60.0 GHz durchgeführt.

### Zusammenfassung der Anpassungsparameter bei 15,0 GHz

| Anpassnetzwerk | S11 (dB) | VSWR | Re(Z) (Ω) | Im(Z) (Ω) |
| :--- | :---: | :---: | :---: | :---: |
| **Eingangsnetzwerk** | -20.63 | 1.205 | 41.53 | -0.80 |
| **Ausgangsnetzwerk** | -25.16 | 1.117 | 44.77 | +0.20 |

### 1. Verhalten des Eingangsanpassnetzwerks
- Reflexionsdämpfung bei der Mittenfrequenz: $S_{11} = -20.63\text{ dB}$, $\text{VSWR} = 1.205$.
- Der induktive Blindanteil ist kompensiert: $\text{Im}(Z_{1,1}) = -0.80\ \Omega$ bei $\text{Re}(Z_{1,1}) = 41.53\ \Omega$.

<p align="center">
  <img src="docs/images/input_matching_sim_s11_return_loss.png" alt="S11 des Eingangsanpassnetzwerks" width="80%">
</p>

<p align="center">
  <img src="docs/images/input_matching_sim_vswr.png" alt="VSWR des Eingangsanpassnetzwerks" width="80%">
</p>

<p align="center">
  <img src="docs/images/input_matching_sim_complex_impedance_z11.png" alt="Komplexe Eingangsimpedanz Z11" width="80%">
</p>

### 2. Verhalten des Ausgangsanpassnetzwerks
- Reflexionsdämpfung bei der Mittenfrequenz: $S_{11} = -25.16\text{ dB}$, $\text{VSWR} = 1.117$.
- Der kapazitive Blindanteil ist kompensiert: $\text{Im}(Z_{1,1}) = +0.20\ \Omega$ bei $\text{Re}(Z_{1,1}) = 44.77\ \Omega$.

<p align="center">
  <img src="docs/images/output_matching_sim_s11_return_loss.png" alt="S11 des Ausgangsanpassnetzwerks" width="80%">
</p>

<p align="center">
  <img src="docs/images/output_matching_sim_vswr.png" alt="VSWR des Ausgangsanpassnetzwerks" width="80%">
</p>

<p align="center">
  <img src="docs/images/output_matching_sim_complex_impedance_z11.png" alt="Komplexe Ausgangsimpedanz Z11" width="80%">
</p>

---

## Lizenz

Copyright (c) 2026 Ilya Kornilov

Diese Quelle beschreibt Open Hardware (offene Hardware) und ist unter der CERN-OHL-P v2 lizenziert. 
Sie dürfen diese Quelle unter den Bedingungen der CERN-OHL-P v2 (https://cern.ch/cern-ohl) 
weiterverbreiten, modifizieren und Produkte auf deren Grundlage herstellen.

Diese Quelle wird OHNE JEGLICHE AUSDRÜCKLICHE ODER STILLSCHWEIGENDE GEWÄHRLEISTUNG vertrieben, 
EINSCHLIESSLICH DER GEWÄHRLEISTUNG DER MARKTGÄNGIGKEIT, ZUFRIEDENSTELLENDEN QUALITÄT ODER EIGNUNG 
FÜR EINEN BESTIMMTEN ZWECK. Die geltenden Bedingungen entnehmen Sie bitte der CERN-OHL-P v2.
