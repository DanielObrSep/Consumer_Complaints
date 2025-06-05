# Consumer Financial Complaints

Proyecto individual para limpieza, transformación y análisis de quejas financieras (dataset de Maven Analytics).

## Contenido del Proyecto

- Limpieza inicial en Jupyter
- Transformación con dbt (staging + marts)
- Pruebas de calidad de datos
- Métricas: tiempo de respuesta, canal, tipo de resolución
- Exportación de CSV desde DuckDB
- Visualización de resultados en Power BI

## Herramientas y Librerías

- Python (pandas, matplotlib, openpyxl)
- dbt + DuckDB
- Jupyter Notebook
- Power BI

## Estructura del Repositorio

Consumer_Complaints/
│
├── data_raw/ # Dataset original en Excel
├── notebooks/ # Exploración, limpieza y validación
├── dbt_project/ # Modelos SQL y pruebas dbt
├── outputs/ # Exportación final a CSV desde staging
├── reports/ # Capturas de Power BI y archivo .pbix
├── requirements.txt # Dependencias del entorno
└── README.md # Documentación general del proyecto

## Dashboard Power BI

Se diseñó un dashboard en Power BI usando `outputs/stg_consumer_complaints.csv`.

Incluye:

- Total de quejas (KPI)
- Quejas por tipo de producto
- Resoluciones por estado

Capturas incluidas:

- `reports/dashboard_overview.png`
- `reports/top_state_chart.png`

Archivo editable:

- `reports/consumer_dashboard.pbix`

## Reproducibilidad (Ejecutar Proyecto desde Cero)

```bash
# 1. Crear entorno virtual
python -m venv venv
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\venv\Scripts\Activate.ps1

# 2. Instalar dependencias
pip install -r requirements.txt

# 3. Inicializar dbt (si es primera vez)
cd dbt_project
dbt debug
dbt seed
dbt build
cd ..

# Exportación de datos para Power BI

El archivo `stg_consumer_complaints.csv` se exporta automáticamente al correr los modelos con dbt. Este archivo se usa como entrada directa en Power BI para generar el dashboard.

Ubicación del CSV exportado:
- `outputs/stg_consumer_complaints.csv`


# 5. Abrir consumer_dashboard.pbix en Power BI Desktop

Tests Implementados
dbt:
not_null en columnas clave
unique sobre complaint_id
accepted_values para valores categóricos
Validaciones adicionales en notebooks (nulos, duplicados, formatos)

Notas
El archivo dev.duckdb no se incluye. Se genera automáticamente al correr dbt build.
Los seeds son controlados por dbt. No se modifican directamente fuera del flujo reproducible.
El archivo .pbix se incluye para análisis replicable en Power BI Desktop.



