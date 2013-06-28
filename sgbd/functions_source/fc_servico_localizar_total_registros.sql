-- Function: guddi.fc_servico_localizar_total_registros(character varying)

-- DROP FUNCTION guddi.fc_servico_localizar_total_registros(character varying);

CREATE OR REPLACE FUNCTION guddi.fc_servico_localizar_total_registros(p_descricao character varying)
  RETURNS integer AS
$BODY$
declare
  v_total_tuplas integer default null;
begin
    select 
      count(1) into v_total_tuplas
    from 
      guddi.fc_servico_localizar(p_descricao);
  -- retorno
  return v_total_tuplas;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION guddi.fc_servico_localizar_total_registros(character varying) OWNER TO "guddi_apl";
GRANT EXECUTE ON FUNCTION guddi.fc_servico_localizar_total_registros(character varying) TO public;
GRANT EXECUTE ON FUNCTION guddi.fc_servico_localizar_total_registros(character varying) TO guddi_apl;

