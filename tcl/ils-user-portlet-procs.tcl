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

ad_library {

    Procedures to support the ILS User portlet

    @author rafaelchacon@gmail.com

}

namespace eval ils_user_portlet {

    ad_proc -private get_my_name {
    } {
        return "ils_user_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "#ils-user-portlet.pretty_name#"
    }

    ad_proc -private my_package_key {
    } {
        return "ils-user-portlet"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Adds a ILS User portlet to the given portal
    } {
        return [portal::add_element_parameters \
                    -portal_id $portal_id \
                    -portlet_name [get_my_name] \
                    -key package_id \
                    -value $package_id]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
    } {
        Removes ILS User portlet from the given page
    } {
        # This is easy since there's one and only one instace_id
        portal::remove_element \
            -portal_id $portal_id \
            -portlet_name [get_my_name]
    }

    ad_proc -public show {
        cf
    } {
        Display the portlet
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "ils-user-portlet"
    }

}
