--This is a small beta version function written in plpython3u tested for postgres 9.6 that converts the data type of the column from text / var char to double 

CREATE OR REPLACE FUNCTION public.ag_alt_text_to_double(
    table_name text,
    column_name text )
  RETURNS text AS
$BODY$
  ret = 'plugin in beta testing please verify the result and contact Abhijit Gujar if any issue '
  query = plpy.execute(" UPDATE {} SET {} = '0' WHERE COALESCE({}, '') = '' OR {} IS NULL  ; ".format( table_name , column_name, column_name , column_name ) )

  query = plpy.execute(" ALTER TABLE {} ALTER COLUMN {} TYPE double precision USING (trim({})::double precision)".format( table_name , column_name, column_name  ) )

  return ret
$BODY$
  LANGUAGE plpython3u 
