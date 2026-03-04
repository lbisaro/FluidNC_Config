; Stress Test Termico MPCNC
G21 ; Unidades en mm
G90 ; Posicionamiento absoluto
G94 ; Velocidad en mm/min

; --- PREPARACION ---
; Asegurate que el Z tenga espacio para subir 20mm y bajar 20mm
G0 Z20 F800 ; Sube Z a zona segura
G0 X0 Y0 F3000 ; Va al origen de trabajo

; --- CICLO DE TRABAJO (Repetir mentalmente o copiar mas veces) ---
M03 ; Simula encendido de fresadora (solo logico)

; Movimientos en X e Y (Simulando desbaste)
G1 X100 Y100 F2500
G1 X0 Y100 F2500
G1 X100 Y0 F2500
G1 X0 Y0 F2500

; Movimientos circulares (Exige interpolacion a los drivers)
G2 X50 Y50 I50 J0 F2000
G2 X0 Y0 I-50 J0 F2000

; Movimiento Z constante (Simulando 3D)
G1 Z5 F600
G1 X100 Y100 Z20 F2000
G1 X0 Y0 Z5 F2000

; Repetir patron 10 veces (Loop manual)
; [Aqui el codigo repetiria las lineas anteriores]

G0 Z20 ; Termina en posicion segura
M05 ; Simula apagado
M30 ; Final de programa