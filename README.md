# HPIG2

Este repositorio contiene un proyecto desarrollado con Jupyter Notebooks y SQL, cuyo objetivo es crear una base de datos estructurada para gestionar el inventario de la empresa de licores Bodega Inteligente. Este sistema es el primer paso hacia la implementación de análisis avanzados para optimizar las operaciones y ofrecer recomendaciones estratégicas a la empresa.

## Descripción General
El proyecto tiene como finalidad:

Diseñar y estructurar una base de datos que refleje el inventario actual de Bodega Inteligente.
Registrar productos, categorías, ventas y proveedores en una base de datos SQL.
Facilitar análisis futuros para mejorar la toma de decisiones comerciales.
Proveer una herramienta base para explorar y expandir el modelo de negocio mediante análisis predictivos y dashboards.
## Estructura del Proyecto
## Carpetas y Archivos Principales
notebooks/
Contiene los Jupyter Notebooks utilizados para:

Cargar datos iniciales.
Crear y poblar las tablas de la base de datos SQL.
Documentar el proceso de conexión y ejecución en SQL.
sql_scripts/
Scripts en SQL utilizados para:

Creación de la base de datos.
Definición de tablas (CREATE TABLE).
Inserción de datos (INSERT INTO).
Consultas iniciales para pruebas y validación.
data/
Datos iniciales en formatos CSV/Excel, utilizados para poblar las tablas:

Información de productos.
Inventarios iniciales.
Proveedores y ventas históricas.
README.md
Guía y documentación del repositorio.

## Sprint 1
Se recopilan los datos exportados desde un dataset externo con los datos crudos para su manipulación. Mediante el uso de MSSQL se realiza una carga inicial de los datos a la base de datos llamada insight_hub y se le realiza un análisis preliminar a los datos. Se crea el modelo ER(entidad-relación) conectando las diferentes tablas a través de sus correspondientes PK (Primary Keys) y se identifican a los FK (Foreign Keys). 
Mediante el uso de las librerías Pandas y NumPy en Python se realiza el EDA a insight_hub para lograr la consistencia y buscando mantener la integridad de los datos. Se normalizan las tablas quedando como resultado las tablas:

dbo_Compras

dbo_FacturasDeCompras

dbo_InventarioFinal

dbo_InventarioInicial

dbo_PreciosCompra

dbo_Productos

dbo_Ventas

dbo_Vendedores

Dichas tablas fueron exportadas a archivos csv para su posterior análisis y con datos más ordenados. Luego de realizar dicho procedimiento se cargan los archivos a BigQuery para su transformación y posterior análisis. A su vez se crea un pipeline de conexión desde MSSQL a BigQuery para posteriormente consumir los datos crudos directamente en BigQuery. Una vez en BigQuery dichos datos son guardados en un bucket llamado "insight_hub" en Google Storage para optimización de recursos. Luego de esto dichos datos son subidos a BigQuery, siendo guardados en principio en la tabla dbo_Compras. Estando ya en dbo_Compras los datos son analizados y transformados a través de queries SQL en BigQuery y asignados a su correspondiente tabla. A su vez se automatiza la carga para que a medida que los datos vayan aumentando los mismos vayan siendo consumidos por el dataset sin intervención manual en el proceso, solo dejando el paso de transformación. Este modelo ELT se deja programado para correr cada dos semanas, utilizando la opción de Schedule de BigQuery.
A su vez mientras este proceso estba siendo realizado se prepara una preparación inicial del proyecto para mostrar al potencial cliente la propuesta de negocio de análisis y las implicancias al negocio licorero.

## Sprint 2
Se verifican permisos de acceso a BigQuery para el equipo, mientras se trabaja en optimizar la consumición de datos a BigQuery. Se deciden junto al equipo los KPIs sobre los que se trabajarán en este sprint en miras de la presentación final.  Se trabaja en BigQuery junto a Apache Airflow para optimizar el modelo ELT creado y solucionar problemas de carga y transformación. A su vez se realizan correcciones a las tablas existentes y se crean las tablas:

dbo_Comparacion

factura-de-compra

inventario-final

inventario-inicial

precios-de-compra

compas-limpios-quizas

ventas-inventario

Las mismas se realizan a través de queries JOIN y UNION, como así también a través del uso de Pandas dentro de notebooks Jupyter. Mientras tanto se cargan los datos a Power BI para la generación de gráficas necesarias para presentación al cliente. Dentro de Power BI se realizan consultas DAX entre los diferentes tableros para la generación de métricas necesarias para el análisis del negocio. Se generan los gráficos de Análisis General, Análisis de Ventas, Análisis de Inventario y Análisis de Costos. Se agregaron filtros de fechas para poder realizar el análisis de estacionalidad en base a fechas. 
También se realizó un modelo de Machine Learning para la predicción de ventas y costos a futuro. En dicho análisis se utilizó el modelo de Random Forest para una mejor predicción de Forecasting. El mismo se hizo a través del uso de librerías como Pandas, NumPy, Maplotlib, Seaborn y Scikit-learn. SE verificaron y eliminaron nulos para un mejor análisis futuro. SE comprueban ciudades con movimientos sospechosos para encontrar puntos de atención al negocio. Se generan gráficos de top 10 ciudades con ventas realizadas, distribución de precios de ventas a modo de preparación para el modelo de Random Forest que se utilizará. Se entrena el modelo y se observan valores reales de precios en comparación a la predicción de precios a futuro. En el gráfico de importancia se observa que Tax y Revenue tiene un alto grado de importancia en los precios. Estos resultados fueron comprobados ya que dieron RMSE de ~0.51 y R² > 0.99.
