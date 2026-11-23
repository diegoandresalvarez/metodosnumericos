# Taller de Simulación de Monte Carlo en Gerencia de la Construcción

**Modalidad:** Exposiciones en parejas  
**Duración por exposición:** 40 minutos  
**Herramientas obligatorias:** Python y Excel + VBA  



## 1. Objetivo General y Dinámica del Taller

Cada pareja expone durante 40 minutos un caso de simulación de Monte Carlo aplicado a la gerencia de la construcción, con demostración en Python y en Excel + VBA. El objetivo es que usted pase de un presupuesto o un cronograma determinístico a un análisis probabilístico, y que use esa información para tomar una decisión práctica en obra.



## 2. Estructura de la exposición (40 minutos)

| Bloque | Minutos | Contenido |
| --- | --- | --- |
| 1. Teoría | 8 | Concepto no visto en clase, solo lo necesario para entender el modelo (por ejemplo: parametrización PERT, merge bias, teoría de colas/ciclos de acarreo o compensación costo-plazo). |
| 2. Modelo determinista y supuestos | 5 | Presupuesto o cronograma base, variables inciertas y justificación de distribuciones y parámetros |
| 3. Simulación en EXCEL+VBA y en PYTHON (Jupyter Notebook, preferiblemente) | 15 |Presentar la implementación en ambas herramientas, mostrando cómo se generan las iteraciones, cómo se calcula la variable de salida y cómo se verifica la convergencia. Mismos supuestos y semilla; comparar media, P50 y P80 |
| 5. Resultados y decisión | 7 | Gráficos, percentiles, probabilidad de cumplir y recomendación gerencial (qué decide el gerente de obra con lo que sale de la simulación.) |
| 6. Preguntas | 5 | Discusión con el curso |

La exposición se evalúa tanto por lo que muestran como por la calidad de la decisión que sustentan. Si el tiempo aprieta, recorten la teoría, no la interpretación.

Cada pareja debe llevar el modelo listo para correr en clase; una corrida en vivo debe tardar menos de 2 minutos.

Ambos integrantes deben poder explicar cualquier parte del trabajo.

## 3. Entregables Obligatorios por Pareja

Al finalizar su exposición, cada grupo debe entregar:

1. **Código fuente:** Scripts/notebooks en Python (Jupyter notebooks, preferiblemente) y macros/módulos en Excel + VBA, debidamente comentados, reproducibles (con semilla fija para la corrida oficial) y organizados en carpetas.
2. **Hoja de cálculo:** Libro de Excel habilitado para macros (`.xlsm`) con entradas parametrizadas, corrida de simulación y tablero de resultados. En caso de que el usuario final quiera modificar los parámetros, estos los debe hacer desde la hoja de cálculo. En ningún momento debe modificar el código en VBA.
3. **Diapositivas de exposición:** en formato PDF. Deben incluir obligatoriamente:
   - Gráficos de distribución de resultados (histogramas con valores marcados, curvas acumuladas CDF/curvas S o comparativas según el caso).
   - Interpretación gerencial de los resultados.
   - Percentiles: reporten P10, P50, P80 y P90, y la probabilidad de cumplir o superar la meta.
   - Recomendación concreta para la toma de decisiones en el proyecto.
4. **Justificación de distribuciones y parámetros:** Sustento técnico y estadístico de por qué se eligió cada distribución de probabilidad (Triangular, PERT, Lognormal, Uniforme, discreta, etc.) y cómo se definieron sus parámetros (mínimo, más probable, máximo, media, desviación estándar o probabilidades) a partir del contexto de obra.
5. **Verificación de convergencia:** Evidencia cuantitativa y gráfica de la estabilidad de los resultados al aumentar el número de iteraciones (por ejemplo, gráfica de convergencia de la media y/o percentiles clave). La media y el P80 de Python y de Excel deben diferir en menos de 1 %.
6. **Enlace a la conversación con la IA** que empleó para realizar el trabajo. Allí el profesor verá la interacción que tuvo con la inteligencia artificial y los prompts que hizo.

Los datos de cada caso son **sugeridos**. Si cambian un valor, déjenlo documentado y justificado. Donde se indiquen rangos o supuestos complementarios de obra (rendimientos unitarios, precios base o desviaciones), el grupo deberá documentarlos explícitamente como supuestos de ingeniería coherentes con la práctica constructiva.

Los archivos (código, hoja de cálculo y diapositivas) se envían **antes de la exposición**.


## 4. Criterios de evaluación y entrega

La nota de la exposición se calcula sobre 100 puntos.

| Criterio | Puntos | Qué se espera |
| --- | --- | --- |
| Fundamentación teórica | 15 | Explicación correcta y breve del concepto nuevo, con un ejemplo de obra |
| Modelo y justificación de distribuciones | 20 | Variables inciertas bien elegidas; cada distribución y cada parámetro con su fuente |
| Implementación en Python | 15 | Código claro, reproducible, con semilla y sin errores |
| Implementación en Excel + VBA | 15 | Hoja y macro ordenadas, ejecutables, con los supuestos visibles |
| Convergencia y verificación entre herramientas | 10 | Gráfica de convergencia y coincidencia de resultados entre Python y Excel |
| Interpretación y decisión gerencial | 15 | Lectura correcta de percentiles y probabilidades; recomendación concreta y sus límites |
| Claridad y manejo del tiempo | 10 | Diapositivas legibles, cumplimiento de los 40 minutos y respuestas a las preguntas |

## 5. Casos y Temas por Grupo

### Grupo 1: Presupuesto de obra — Costos y variabilidad
<details>
<summary>Tema asignado a Carlos David y Santiago. Clic para expandir</summary>

- **Tema:** Presupuesto de obra: costos directos, indirectos y variabilidad.
- **Caso de estudio:** Pavimentación de 1 km de una vía rural (ancho de calzada de 6.0 m, subbase granular, base estabilizada, carpeta asfáltica y obras básicas de drenaje/cunetas).
- **Alcance técnico y financiero sugerido (ajustable con justificación):**
  - Elaborar el presupuesto de obra y los Análisis de Precios Unitarios (APU) de las partidas principales, incluyendo **costos directos** (materiales, equipo, mano de obra, transporte) y **costos indirectos** (Administración, Imprevistos y Utilidad - AIU, etc).
  - Establecer una **estimación determinista** del costo total y compararla con el modelo **probabilista** mediante simulación de Monte Carlo en Python y Excel + VBA.
- **Preguntas clave a resolver:**
  - ¿Cuál es la probabilidad real de superar el presupuesto determinista? ¿Qué monto de presupuesto debería aprobarse si la entidad contratante exige un nivel de confianza del 80 % (P80)?
  - Construir los APU detallados (materiales, equipo, transporte y mano de obra) y obtener el costo total determinista del proyecto (incluyendo AIU).
  - Modelar la incertidumbre en los insumos críticos de los APU (precios de materiales, acarreos y rendimientos de mano de obra/equipo) justificando las distribuciones elegidas.
  - ¿Cuánta contingencia (P80 menos determinista) recomiendan, y qué porcentaje del costo directo representa?
  - Presentar la tabla de percentiles P10, P50, P80 y P90, el histograma de costo total, la curva de probabilidad acumulada y la gráfica de convergencia de la media al incrementar el número de simulaciones.
  - Si hay materiales con precios que suben juntos (asfalto y combustible), analizar la **correlación** o justificar por qué se ignora.


Pavimento flexible de 1000 m de longitud y 6,0 m de calzada (6000 m²), en una vía rural con cunetas a ambos lados. Cantidades de referencia:

| Ítem | Unidad | Cantidad | Fuentes de incertidumbre a considerar |
| --- | --- | --- | --- |
| Localización y replanteo | m² | 6000 | Rendimiento de la comisión de topografía |
| Excavación y conformación de subrasante | m³ | 1500 | Tipo de suelo, clima, rendimiento de la maquinaria, esponjamiento/acarreo de material sobrante. |
| Sub-base granular (0,20 m) | m³ | 1200 | Precio del material, distancia de acarreo, factor de compactación |
| Base granular (0,15 m) | m³ | 900 | Precio del material, distancia de acarreo, factor de compactación |
| Imprimación asfáltica | m² | 6000 | Precio del asfalto líquido |
| Mezcla densa en caliente (0,07 m) | m³ | 420 | Precio del cemento asfáltico, transporte desde planta, espesor real colocado |
| Cunetas en concreto | m | 2000 | Precio del concreto, rendimiento de la cuadrilla |
| Señalización y demarcación | señal | 10 | Poca variabilidad |
| Costos indirectos (Administración y gastos generales)	|% CD	| 18,0 % |	Variabilidad en costos de transporte de personal, señalización vial y campamento temporal.

</details>

### Grupo 2: Cronograma de obra — Plazos y criticidad
<details>
<summary>Tema asignado a Valentina y CIA. Clic para expandir</summary>

- **Tema:** Cronograma de obra: duraciones probabilísticas, rutas paralelas y criticidad.
- **Caso de estudio:** Construcción de una **vivienda de 100 m² en área rural**. El método de la ruta crítica determinista da 180 días para construir una vivienda rural de 100 m². 
- **Alcance técnico y de programación:**
  - Construir un cronograma de **12 actividades** (por ejemplo: replanteo y preliminares, excavación y cimentación, desagües sanitarios, estructura/mampostería, cubierta, instalaciones eléctricas, instalaciones hidrosanitarias, pañetes/revoques, pisos y enchapes, carpintería/ventanería, pintura, aseo y entrega); calcular la **ruta crítica determinista** y las holguras.
  - Garantizar **al menos tres rutas paralelas** y definir las duraciones base (deterministas) para que el cálculo CPM arroje una duración total de **180 días**.
  - Programar el cálculo de inicio/fin más temprano y la duración total del proyecto en cada iteración (en Python y en Excel + VBA), registrando en qué porcentaje de simulaciones resulta crítica cada actividad (*índice de criticidad*).
  - Explicar el efecto de la convergencia de rutas (*merge bias*) y por qué las actividades críticas en simulación pueden diferir de la ruta crítica determinista.
- **Preguntas clave a resolver:**
  - Si el CPM determinista da **180 días**, ¿cuál es la **probabilidad real** de terminar en 180 días o menos?
  - ¿Cuál es la fecha/duración correspondiente al percentil **P80**?
  - Calcular el índice de criticidad simulada (% de iteraciones en que cada actividad tiene holgura cero) e identificar el Top 3 de actividades con mayor criticidad, explicando por qué actividades no críticas en el CPM determinista adquieren criticidad en la simulación. ¿Qué medidas de acción gerencial recomiendan sobre estas tres actividades?
  - ¿Por qué una actividad con holgura pequeña (instalaciones eléctricas) puede ser más relevante que otra que está en la ruta crítica determinista?
  - Comparar la duración determinista con la media y los percentiles de la simulación, y explicar por qué la media simulada es mayor que 180 días aunque se use la misma duración más probable.


Vivienda de 100 m² en zona rural, con mampostería confinada y cubierta liviana. La red de 12 actividades, con duraciones en días calendario, es la siguiente (la columna "más probable" produce los 180 días del CPM):

| N.º | Actividad | Predecesoras | Mínima | Más probable | Máxima |
| --- | --- | --- | --- | --- | --- |
| 1 | Preliminares y replanteo | – | 5 | 7 | 12 |
| 2 | Excavación y cimentación | 1 | 14 | 18 | 30 |
| 3 | Estructura (columnas, vigas y placa) | 2 | 20 | 25 | 38 |
| 4 | Mampostería | 3 | 28 | 35 | 55 |
| 5 | Cubierta | 3 | 16 | 20 | 32 |
| 6 | Instalaciones hidrosanitarias | 4 | 12 | 15 | 24 |
| 7 | Instalaciones eléctricas | 4 | 9 | 12 | 20 |
| 8 | Pañetes y repellos | 6, 7 | 20 | 25 | 38 |
| 9 | Pisos y enchapes | 8 | 20 | 25 | 40 |
| 10 | Carpintería (puertas y ventanas) | 4, 5 | 12 | 15 | 28 |
| 11 | Pintura y acabados | 9, 10 | 15 | 20 | 32 |
| 12 | Aparatos sanitarios, limpieza y entrega | 11 | 7 | 10 | 16 |

La ruta crítica determinista es 1-2-3-4-6-8-9-11-12. Hay **tres ramas paralelas** después de la estructura: la de mampostería e instalaciones, la eléctrica (con apenas 3 días de holgura) y la de cubierta y carpintería. Los grupos pueden ajustar los datos si lo justifican, pero deben conservar al menos tres rutas paralelas.

En una red con caminos paralelos, el proyecto suele terminar tarde porque cualquiera de las ramas que se atrase empuja el final. La simulación revela qué actividades son críticas en la práctica, no solo en el papel.

</details>

### Grupo 3: Decisión integral costo/tiempo — Movimiento de tierras y flota
<details>
<summary>Clic para expandir</summary>

- **Tema:** Decisión integral costo/tiempo: dimensionamiento de flota y penalidades por retraso.
- **Caso de estudio:** Movimiento de tierras de **100,000 m³** (excavación, cargue, acarreo y conformación/compactación) con una meta de plazo contractual de **20 días hábiles** y una **multa superior a $30,000,000 COP** por día de retraso (o fracción proporcional de día) si se supera la fecha plazo.

- **Alcance operativo y de modelación:**
  - Definir la combinación de volquetas y excavadoras (completando la maquinaria de cargue/excavación requerida para el frente) y modelar sus rendimientos variables, tiempos de ciclo/acarreo, disponibilidad mecánica (la volqueta o la excavadora se podría dañar) y condiciones de vía/clima.
  - Evaluar distintas configuraciones de flota (volquetas + excavadoras) mediante simulación de Monte Carlo en Python y Excel + VBA, contabilizando costos operativos de maquinaria, costos fijos diarios y multas por incumplimiento del plazo.
- **Preguntas clave a resolver:**
  - Modelar el rendimiento efectivo diario del sistema excavadora–volquetas considerando tiempos de espera o desbalance entre cargue y acarreo, e incorporar la variabilidad en los tiempos de ciclo y factores climáticos.
  - Evaluar distintas combinaciones de (N° de excavadoras, N° de volquetas) y construir una matriz de decisión comparando utilidad esperada, probabilidad de incurrir en multa y percentil P10 de utilidad (peor escenario razonable).
  - Recomendar la flota óptima justificando el equilibrio entre sobrecosto por equipos ociosos y exposición a la multa de COP $32 millones/día.
  - Calcular el diseño determinista: número de volquetas y de excavadoras que cumplen exactamente el plazo con valores promedio, y su utilidad.
  - Modelar el avance diario como el mínimo entre la capacidad de cargue (excavadoras) y la de acarreo (volquetas), con lluvia y daños aleatorios.
  - Simular cada configuración con 10.000 iteraciones y los mismos números aleatorios para todas, de modo que las diferencias entre configuraciones no sean ruido.
  - Calcular, para cada configuración: utilidad esperada, P10 / P50 / P90 de la utilidad, probabilidad de retraso y multa esperada.
  - ¿Qué combinación óptima de **número de volquetas y excavadoras** conviene contratar para **maximizar las ganancias / minimizar el costo total esperado** sin exponerse a multas superiores a 30 millones diarios?
  - ¿Cómo cambia la decisión al analizar los percentiles de utilidad/costo total y la probabilidad de cumplir el plazo?
  - Identificar dos óptimos: el que **maximiza la utilidad esperada** y el que lo hace **con una probabilidad de retraso de a lo sumo 10 %** (debe justificar este umbral).
  - ¿Cuántas volquetas y excavadoras recomiendan? ¿Cuánto cuesta cumplir con 90 % de confianza frente a aceptar el riesgo de multa?
  - ¿A partir de cuántas volquetas deja de rendir agregar una más? ¿Por qué aparece el cuello de botella en la excavadora?
  - ¿Qué pasa con la decisión si la multa sube a COP 40 millones por día o si llueve más?
- **Generar:**
  - Tabla o mapa de calor de la utilidad esperada y de la probabilidad de retraso para cada combinación de volquetas y excavadoras.
  - Histograma de la utilidad en la configuración recomendada.
  - Gráfica de convergencia de la utilidad esperada de esa configuración.

Contrato de excavación y transporte de **100.000 m³ en banco** a un botadero ubicado a 8 km. Si la obra supera el plazo, el contratista paga una multa de **COP 30 millones por día de retraso** (como mínimo; hagan un análisis de sensibilidad con COP 40 millones). Datos sugeridos:

| Variable | Valor o distribución sugerida |
| --- | --- |
| Precio pactado | COP 45.000 por m³ en banco (ingreso de COP 4500 millones) |
| Plazo contractual | 20 días hábiles, jornada de 8 horas |
| Capacidad de la volqueta | 12 m³ sueltos; factor de abundamiento se debe modelar como variable aleatoria |
| Excavadora hidráulica (1,2 m³ de cucharón) | Tiempo de cargue por volqueta: 6 a 10 min (según dureza del suelo y destreza del operador) |
| Ciclo de la volqueta (tiempo de cargue, viaje de ida y vuelta, descargue y esperas) | Triangular 50 / 65 / 95 min |
| Rendimiento real de la excavadora | Triangular 90 / 120 / 150 m³ en banco por hora |
| Disponibilidad mecánica de cada equipo | Entre 85 % y 95 % (daños y mantenimiento) |
| Días perdidos por lluvia | Cada día tiene entre 15 % y 20 % de probabilidad de no trabajarse |
| Alquiler de volqueta con conductor y combustible | COP 1,2 a 1,6 millones por día, triangular |
| Alquiler de excavadora con operador y combustible | COP 2,2 a 3,0 millones por día, triangular |
| Costos fijos (supervisión, señalización y administración) | COP 3 millones por día de obra |

Los valores de alquiler son ilustrativos: confróntenlos con cotizaciones o precios de referencia reales y documenten la fuente. Las variables de decisión son el **número de volquetas** y el **número de excavadoras**.

</details>

### Grupo 4: Decisión integral costo/tiempo: estrategia estándar o acelerada
<details>
<summary>Tema asignado a Manuela y Juan David. Clic para expandir</summary>

**Pregunta central:** en la construcción de una bodega industrial, ¿conviene pagar USD 65.000 adicionales por acelerar la cubierta y los pisos industriales, o es mejor mantener la operación estándar?

### Caso

Bodega industrial y patio de maniobras con **plazo objetivo de 24 semanas**.

| Dato | Valor |
| --- | --- |
| Presupuesto directo base | USD 1.480.000 |
| Costo indirecto | USD 9.500 por semana de ejecución |
| Multa por retraso | USD 14.000 por semana de retraso |
| Sobrecosto directo de la Estrategia B | USD 65.000 (estimado) |

- **Estrategia A:** operación estándar.
- **Estrategia B:** aceleración en cubierta y pisos industriales (turnos adicionales, más cuadrillas y concreto de fraguado rápido).

Para que la duración no sea un dato aislado, se propone esta red de 9 actividades, con duraciones en semanas (la columna "más probable" suma las 24 semanas del plazo):

| N.º | Actividad | Predecesoras | Mínima | Más probable A | Máxima | Más probable B |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | Preliminares y movimiento de tierras | – | 2 | 3 | 5 | 3 |
| 2 | Cimentación | 1 | 3 | 4 | 7 | 4 |
| 3 | Estructura metálica | 2 | 4 | 5 | 8 | 5 |
| 4 | Cubierta | 3 | 3 | 4 | 7 | 3 |
| 5 | Cerramientos y fachadas | 3 | 3 | 4 | 6 | 4 |
| 6 | Instalaciones | 3 | 4 | 5 | 8 | 5 |
| 7 | Pisos industriales | 4, 6 | 3 | 4 | 7 | 3 |
| 8 | Patio de maniobras | 4 | 4 | 5 | 9 | 5 |
| 9 | Pruebas, acabados y entrega | 5, 7, 8 | 2 | 3 | 5 | 3 |

En la Estrategia B, las actividades 4 y 7 se acortan y se tornan menos variables (el grupo debe definir y justificar el nuevo mínimo y máximo). El costo directo total es incierto: se sugiere una triangular de USD 1.430.000 / 1.480.000 / 1.700.000 para A, y el sobrecosto de B entre USD 55.000 y USD 85.000.

Los grupos deben definir y documentar cómo se calculan los indirectos (se sugiere proporcional a la duración simulada) y la multa (se sugiere por semana o fracción de semana de retraso).

### Qué debe hacer el grupo

1. Calcular la **ruta crítica y el costo total determinista** de A y de B.
2. Simular el **costo total** (directos + indirectos + multas) y la **duración** de cada estrategia, usando **los mismos números aleatorios** en ambas para comparar de forma justa.
3. Calcular para cada estrategia: media, P10 / P50 / P80 / P90 del costo total, probabilidad de cumplir las 24 semanas y retraso esperado.
4. Calcular la probabilidad de que B resulte más barata que A en una misma iteración.
5. Evaluar si acelerar la cubierta y los pisos **acorta realmente la ruta crítica**: verifiquen qué actividades quedan críticas en B.

### Preguntas que se deben responder en la exposición

- ¿Cuál estrategia recomiendan según el costo esperado, y cuál según el P90? ¿Coinciden?
- ¿Cuál es la probabilidad de cumplir el plazo con A y con B?
- ¿Cuál es el sobrecosto máximo de B que lo mantiene conveniente (punto de equilibrio), y a partir de qué multa semanal cambia la decisión?

### Evidencias específicas

- Tabla comparativa de A y B con media, percentiles de costo, probabilidad de cumplir el plazo y retraso esperado.
- Curvas acumuladas del costo total de A y de B en un mismo gráfico.
- Histograma de la diferencia de costo entre A y B (B menos A).
- Gráfica de convergencia de la media y del P90.

<!---
Decisión integral costo/tiempo — Bodega industrial y patio de maniobras
- **Tema:** Decisión integral costo/tiempo: evaluación de estrategias de aceleración.
- **Caso de estudio:** Construcción de una **bodega industrial y patio de maniobras** con los siguientes parámetros base:
  - **Plazo objetivo:** 24 semanas.
  - **Costo indirecto semanal:** USD 9,500.
  - **Multa por semana de retraso:** USD 14,000.
  - **Presupuesto directo base:** USD 1,480,000.
- **Alcance comparativo:**
  - Modelar la incertidumbre en duración y costos directos/indirectos en Python y Excel + VBA bajo dos alternativas:
    - **Estrategia A (Operación estándar):** Ejecución base sin plan de aceleración adicional.
    - **Estrategia B (Aceleración en cubierta y pisos industriales):** Sobrecosto directo estimado de **USD 65,000** a cambio de mayor ritmo/reducción de variabilidad o atrasos en esas partidas críticas.
- **Preguntas clave a resolver:**
  - Comparando **Estrategia A vs. Estrategia B**, ¿cuál conviene elegir según los percentiles de **costo total** (incluyendo directos, indirectos, sobrecosto de aceleración y multas) y la **probabilidad de cumplir las 24 semanas**?
  - ¿En qué escenarios o niveles de aversión al riesgo preferirían una u otra estrategia?
--->

</details>
