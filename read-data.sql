SELECT 
  json_build_object(
    'aboutMe', (
      SELECT json_build_object(
        'img', img,
        'alt', alt,
        'link', link,
        'blurbs', blurbs
      ) FROM about_me
    ),
    'projects', (
      SELECT json_agg(projects)
      FROM projects
    ),
    'experience', (
      SELECT json_agg(experience)
      FROM experience
    ),
    'education', (
      SELECT json_agg(education)
      FROM education
    ),
    'testimonials', (
      SELECT json_agg(testimonials)
      FROM testimonials
    ),
    'community', (
      SELECT json_agg(community)
      FROM community
    ),
    'contact', (
      SELECT json_agg(contact)
      FROM contact
    )
  ) AS data



