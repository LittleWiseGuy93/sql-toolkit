
SELECT
  a.name      AS fullname,
  a.summary   AS summary,

  -- 1) Idiomas como array JSON [{ language, level }, …]
  (
    SELECT json_agg(
             json_build_object(
               'language', d.name,
               'level',    d.level
             )
           )
    FROM (
      SELECT DISTINCT name, level
      FROM cv_languages d
      WHERE d.employeid = a.employeid
    ) d
  ) AS languages,

  -- 2) Skills como array JSON [{ skill, stars }, …]
  (
    SELECT json_agg(
             json_build_object(
               'skill', g.skill,
               'stars', repeat('★', g.experiencia)
             )
           )
    FROM (
      SELECT DISTINCT skill, experiencia
      FROM cv_technical_skills g
      WHERE g.employeid = a.employeid
    ) g
  ) AS skills,

  -- 3) Formación Académica como array JSON [{ title, year, institution }, …]
  (
    SELECT json_agg(
             json_build_object(
               'title',       b.degree,
               'year',        b.year::text,
               'institution', b.institution
             )
           )
    FROM (
      SELECT DISTINCT degree, year, institution
      FROM cv_education b
      WHERE b.employeid = a.employeid
    ) b
  ) AS education,

  -- 4) Certificaciones como array JSON [{ title, year }, …]
  (
    SELECT json_agg(
             json_build_object(
               'title', c.title,
               'year',  c.year::text
             )
           )
    FROM (
      SELECT DISTINCT title, year
      FROM cv_certifications c
      WHERE c.employeid = a.employeid
    ) c
  ) AS certifications,

  -- 5) Experiencias profesionales: un objeto por cada experiencia,
  --    con un sub‑array “projects” para agrupar todos los proyectos de esa experiencia.
  (
    SELECT json_agg(exp_row)
    FROM (
      SELECT
        f.id,
        f.company,
        /* construye el texto “Mes YYYY – Mes YYYY” ó “YYYY – Actualidad” */
        build_period(
          normalize_span_date(f.datestart, false),
          normalize_span_date(f.dateend,   true)
        ) AS period,
        f.position,
        COALESCE(f.client,'') AS client,

        /* sub‑array de proyectos */
        (
          SELECT json_agg(
                   json_build_object(
                     'projectName', p.name,
                     'description', p.description
                   )
                 )
          FROM cv_projects p
          WHERE p.experience_id = f.id
        ) AS projects,

        /* responsabilidades únicas */
     /*   (
          SELECT string_agg(DISTINCT r.responsability, '; ')
          FROM cv_project_responsabilities r
          WHERE r.experience_id = f.id
        ) AS responsability,
*/
        /* responsabilidades —-> AHORA ARRAY  */
        (
          SELECT json_agg(DISTINCT r.responsability
                          ORDER BY r.responsability)
          FROM cv_project_responsabilities r
          WHERE r.experience_id = f.id
        ) AS responsibilities,
  
        /* tecnologías únicas */
        (
          SELECT string_agg(DISTINCT t.technology, ', ')
          FROM cv_project_technologies t
          JOIN cv_projects p2 ON p2.id = t.project_id
          WHERE p2.experience_id = f.id
        ) AS technology

      FROM cv_professional_experience f
      WHERE f.employeid = a.employeid

      -- 1º orden: fin más reciente / “Actualidad” primero
      -- 2º orden: inicio más reciente
      ORDER BY
        normalize_span_date(f.dateend,   true ) DESC NULLS LAST,
        normalize_span_date(f.datestart, false) DESC NULLS LAST

    ) exp_row
  ) AS experiences

FROM cv_people a
WHERE a.employeid = "123456789X";
