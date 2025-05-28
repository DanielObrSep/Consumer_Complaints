# Consumer Financial Complaints

Proyecto individual para limpieza, transformación y análisis de quejas financieras (dataset de Maven Analytics).

# Contenido

- Limpieza inicial en Jupyter
- Transformación con dbt (stg + marts)
- Pruebas de calidad de datos
- Métricas: tiempo de respuesta, canal, tipo de resolución
- Visualización de resultados en Power BI

# Herramientas y librerías utilizadas

- Python
- pandas, matplotlib, openpyxl
- dbt + DuckDB
- Jupyter
- Power BI

# Estructura

- `data_raw/`: dataset original
- `notebooks/`: validaciones y limpieza
- `dbt_project/`: modelos transformados y test
- `outputs/`: CSV final exportado desde DuckDB
- `reports/`: capturas del dashboard de Power BI + archivo `.pbix`
- `requirements.txt`: dependencias del proyecto

# Dashboard Power BI

Se diseñó un dashboard en Power BI utilizando el archivo `stg_consumer_complaints.csv` exportado desde el modelo staging.

Incluye:

- KPI de total de quejas
- Quejas por tipo de producto
- Resoluciones por estado

Capturas en:

- `reports/dashboard_overview.png`
- `reports/top_state_chart.png`

Archivo editable:

- `reports/consumer_dashboard.pbix`
