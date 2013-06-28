-- Function: guddi.fc_servico_localizar(character varying, integer, integer)

-- DROP FUNCTION guddi.fc_servico_localizar(character varying, integer, integer);

CREATE OR REPLACE FUNCTION guddi.fc_servico_localizar(p_descricao character varying, p_offset integer DEFAULT NULL::integer, p_limit integer DEFAULT NULL::integer)
  RETURNS SETOF guddi.type_fc_servico_localizar AS
$BODY$
declare
  v_sql text default '';
begin
  v_sql := 'select distinct on (o.id,  s.id, d.id, ws.id) ' || 
      'o.id, o.nome, s.id, s.nome, d.id, d.descricao, ws.id, ws.nome, ws.wsdl_link ' ||
    'from ' ||
      'guddi.servico ws ' ||
      'left join guddi.descritor d on d.id = ws.id_descritor ' ||
        'left join guddi.tag t on t.id_descritor = d.id ' ||
        'left join guddi.sistema s on s.id = d.id_sistema ' ||
          'left join guddi.orgao o on o.id = s.id_orgao ' ||
    'where ' ||
      'ws.nome ilike ''%'' || $1 || ''%'' or ' ||
      'd.descricao ilike ''%'' || $1 || ''%'' or ' ||
      't.tag ilike ''%'' || $1 || ''%'' or ' ||
      's.nome ilike ''%'' || $1 || ''%'' or ' ||
      'o.nome ilike ''%'' || $1 || ''%'' ';

  if p_limit is not null then
    v_sql := v_sql || ' limit ' || p_limit;
  end if;
  
  if p_offset is not null then
    v_sql := v_sql || ' offset ' || p_offset;
  end if;

  -- retorno
  return query execute v_sql using p_descricao;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION guddi.fc_servico_localizar(character varying, integer, integer) OWNER TO "guddi_apl";
GRANT EXECUTE ON FUNCTION guddi.fc_servico_localizar(character varying, integer, integer) TO public;
GRANT EXECUTE ON FUNCTION guddi.fc_servico_localizar(character varying, integer, integer) TO guddi_apl;

