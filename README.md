# Kursova_NVBD_Variant_01
# Курсова робота NVBD — Варіант 01
**Тема:** Розробка та аналіз надвеликої БД (Microsoft SQL Server: SSIS, SSAS, SSRS)  
**Студент:** Кісельов Олександр Андрійович  
**Група:** ПМ-41 
**Варіант:** 01

## Структура репозиторію
- `Database/` — SQL-скрипти створення OLTP/DWH, обмеження, тригери, процедури
- `DataGeneration/` — генерація/налаштування даних
- `SSIS_Projects/` — ETL-проєкт (SSIS)
- `SSAS_Projects/` — OLAP-куб (SSAS)
- `SSRS_Projects/` — звіти (SSRS)
- `Documentation/` — PDF-звіт

## Як відтворити
1. Виконати `Database/CREATE_DATABASE.sql` + інші скрипти.
2. Згенерувати дані (див. `DataGeneration/`).
3. Запустити SSIS пакети для завантаження в DWH.
4. Задеплоїти/процеснути куб SSAS.
5. Відкрити SSRS звіти та перевірити параметри/інтерактивність.
