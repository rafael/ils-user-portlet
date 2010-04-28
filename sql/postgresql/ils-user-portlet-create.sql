--
--  Copyright (C) 2007 Adenu UNED
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

create function inline_0()
returns integer as '
declare
  ds_id portal_datasources.datasource_id%TYPE;
begin
  ds_id := portal_datasource__new(
    	''ils_user_portlet'',											-- name
    	''Displays the user interface for the ILS''            		-- Description
  );

  -- 4 defaults procs

  -- shadeable_p 
  perform portal_datasource__set_def_param (
	ds_id,				-- datasource_id
	''t'',				-- config_required_p
	''t'',				-- configured_p
	''shadeable_p'',		-- key
	''f''				-- value
);	

  -- shaded_p 
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''t'',
	''shaded_p'',
	''f''
);	

  -- hideable_p 
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''t'',
	''hideable_p'',
	''t''
);	

  -- user_editable_p 
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''t'',
	''user_editable_p'',
	''f''
);	

  -- link_hideable_p 
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''t'',
	''link_hideable_p'',
	''t''
);	


  -- ils-admin-specific procs

  -- package_id must be configured
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''f'',
	''package_id'',
	''''
);	
  return 0;
end;' language 'plpgsql';

select inline_0();

drop function inline_0();


create function inline_1()
returns integer as '
begin
	-- create the implementation
	perform acs_sc_impl__new (
		''portal_datasource'',
		''ils_user_portlet'',
		''ils_user_portlet''
	);

	-- add all the hooks
	perform acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''ils_user_portlet'',
	       ''GetMyName'',
	       ''ils_user_portlet::get_my_name'',
	       ''TCL''
	);

	perform acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''ils_user_portlet'',
	       ''GetPrettyName'',
	       ''ils_user_portlet::get_pretty_name'',
	       ''TCL''
	);

	perform acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''ils_user_portlet'',
	       ''Link'',
	       ''ils_user_portlet::link'',
	       ''TCL''
	);

	perform acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''ils_user_portlet'',
	       ''AddSelfToPage'',
	       ''ils_user_portlet::add_self_to_page'',
	       ''TCL''
	);

	perform acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''ils_user_portlet'',
	       ''Show'',
	       ''ils_user_portlet::show'',
	       ''TCL''
	);

	perform acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''ils_user_portlet'',
	       ''Edit'',
	       ''ils_user_portlet::edit'',
	       ''TCL''
	);

	perform acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''ils_user_portlet'',
	       ''RemoveSelfFromPage'',
	       ''ils_user_portlet::remove_self_from_page'',
	       ''TCL''
	);

	-- Add the binding
	perform acs_sc_binding__new (
	    ''portal_datasource'',			-- contract_name 
	    ''ils_user_portlet''			-- impl_name
	);

  	return 0;
end;' language 'plpgsql';

select inline_1();

drop function inline_1();
