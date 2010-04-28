#
#  Copyright (C) 2007 Adenu UNED
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

ad_page_contract {
    The display logic for the ILS user portlet
    
} {
    package_id:optional
    template_portal_id:optional
    referer:optional
    return_url:optional
}

if {![exists_and_not_null package_id]} {
    set package_id [dotlrn_community::get_community_id]
}

# DRB: when previewing from the portals package no community is defined, we don't
# want to portlet to bomb in this case.

if { ![string equal $package_id ""] } {

    if {![exists_and_not_null template_portal_id]} {
        set template_portal_id [dotlrn_community::get_portal_id]
    }

    if {[exists_and_not_null return_url]} {
        set referer $return_url
    }

    if {![exists_and_not_null referer]} {
        set referer [ad_conn url]
    }

    set element_pretty_name [ils_user_portlet::get_pretty_name]

    set applet_url "[dotlrn_applet::get_url]/[ils_user_portlet::my_package_key]"

}
